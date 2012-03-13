#!/usr/bin/perl

# New version of the generate script
# 09/03/12
# Dave Stevens

use strict;
use File::Path;

require 'filepaths.pl';

my ($debug, $keep, $sSize, $dramSize, $falconMLHack, $skip, $outputDir, $memAlign, $fmm, $xmlMM, $mallocSize, $dramBaseOffset, $inputDir, $softfloat);
our ($le1_folder, $assembler_folder, $perl, $xml_to_mm, $falconml_hack, $vex_location, $firstpass, $midpass, $transform, $pullin, $deps, $libraries, $secondpass, $opcodes, $floatlib);
my $arguments = '';

# read in command line arguments
&readArgs(@ARGV);

if($inputDir eq '') {
    print 'Error:' . "\n";
    print "\t" . 'You did not specify a directory for input files' . "\n";
    print "\t" . '(use -h for help)' . "\n";
    exit(-1);
}
if($outputDir eq '') {
    # create own name
    my @of = split(/\//, $inputDir);
    $outputDir = uc($of[$#of]);
}

# change directory to where the files are
chdir($inputDir);
my $currentDir = readpipe('pwd');
chomp($currentDir);

# create machine models from LE1 XML
if($xmlMM ne '') {
    &printHeader('Creating machine model from XML file');

    if(!(-d 'machinemodel')) {
	system('mkdir machinemodel');
    } else {
	print "\t" . 'machine model directory already exists.' . "\n";
    }

    my $cmd = $perl . ' ' . $xml_to_mm . ' ' . $xmlMM . ' machinemodel';
    (my $_dramSize, my $_sSize) = split(/,/, &command($cmd, 'readpipe'));

    if($_dramSize != 0) {
	$dramSize = $_dramSize;
    }
    if($_sSize != 0) {
	$sSize = $_sSize;
    }

    if(-e('machinemodel/model.mm')) {
	$fmm = $currentDir . '/machinemodel/model.mm';
    }
    elsif(-e('machinemodel/0_0_0.mm')) {
	# TODO: does not work with heterogeneous systems
	$fmm = $currentDir . 'mahcinemodel/0_0_0.mm';
    }
    else {
	print 'Error:' . "\n";
	print "\t" . 'Could not find the created machin model.' . "\n";
	exit(-1);
    }

    $cmd = 'cp ' . $xmlMM . ' ' . $currentDir . '/machinemodel/model.xml';
    &command($cmd);
}

if(!$skip) {
    # get all .c files
    my @cfiles = <*.c>;
    if($#cfiles == -1) {
	print 'Error:' . "\n";
	print "\t" . 'No .c files found' . "\n";
	exit(-1);
    }
    # create string of all .c files
    my $cfiles = join(' ', @cfiles);

    # run FalconML hack script
    if($falconMLHack) {
	&printHeader('Running FalconML Hack');

	my $cmd = $perl . ' ' . $falconml_hack . ' ' . $vex_location;
	&command($cmd);
    }

    # run Compiler (VEX)
    &printHeader('Running VEX');

    my $cmd = $vex_location . ' -S ' . $cfiles . ' ' . $arguments . ' -fexpand-div -fno-xnop -w -c99inline ';
    if($fmm ne '') {
	$cmd .= '-fmm=' . $fmm . ' ';
    }
    $cmd .= '2>&1';
    &command($cmd);

    # .s files should now be generated
    # need to see if softfloat needs to be imported
    foreach my $cfile (@cfiles) {
	if($cfile eq 'softfloat.c') {
	    $softfloat = 1;
	    last;
	}
    }
    if(!$softfloat) {
	my @sfiles = <*.s>;
	foreach my $sfile (@sfiles) {
	    open SFILE, "< $sfile" or die 'Could not open file: ' . $sfile . "\n";
	    while(<SFILE>) {
		if(/_(r|d)_(r|d|add|sub|mul|div|eq|le|lt|ilfloat|ufloat)/) {
		    print "\t" . 'Need to include the softfloat lib...' . "\n";
		    my $floatlib_arguments = $arguments;
		    $floatlib_arguments =~ s/-c99inline//g;

		    my $cmd = $vex_location . ' -S ' . $floatlib . ' ' . $floatlib_arguments . ' -fexpand-div -fno-xnop -w ';
		    if($fmm ne '') {
			$cmd .= '-fmm=' . $fmm . ' ';
		    }
		    $cmd .= '2>&1';
		    &command($cmd);
		    $softfloat = 1;
		    last;
		}
	    }
	    close SFILE;
	    if($softfloat) {
		last;
	    }
	}
    }
}
else {
    &printHeader('Assembly files as input, compilation stage skipped.');
}

&printHeader('Running Assembler');

my @sfiles = <*.s>;
if($#sfiles == -1) {
    print 'Error:' . "\n";
    print "\t" . 'No .s files found' . "\n";
    exit(-1);
}
# create string of all .s files
my $sfiles = join(' ', @sfiles);

# do some initial modifications of the .s files
&printHeader('Running First Pass');

my @sfiles_new;
foreach my $sfile (@sfiles) {
    my $cmd = $perl . ' ' . $firstpass . ' ' . $sfile . ' ';
    #$cmd .= '2>&1';
    my @ret = &command($cmd, 'readpipe');
    (my $fn, my $r) = split(/\s+contains\s+/, $ret[$#ret]);
    push @sfiles_new, $fn;
}

# the single file containing full program
my $singleFile = $outputDir . '/' . $outputDir . '.temp.s';

my $done = 0;
 REWIND:

# if only 1 .s file, mid pass not required
if($#sfiles_new > 0) {

    # concatenate all files into a single .s files
    &printHeader('Running Mid Pass');

    my $sfiles_new = join(' ', @sfiles_new);
    my $cmd = $perl . ' ' . $midpass . ' ' . $sfiles_new . ' -o' . $outputDir . ' -DRAM_OFFSET=' . sprintf("0x%x ", $dramBaseOffset);
    #$cmd .= ' 2>&1';
    my @ret = &command($cmd, 'readpipe');
}
else {
    # copy the current file to the new dir
    mkdir $outputDir;
    my $cmd = 'cp ' . $sfiles_new[0] . ' ' . $outputDir . '/' . $outputDir . '.temp.s';
    &command($cmd);
}

# transform the current file into new format
&printHeader('Transforming Assembly File');

my $cmd = $perl . ' ' . $transform . ' ' . $singleFile . ' > ' . $singleFile . '.new.s';
&command($cmd);

$singleFile .= '.new.s';

# now to check imports
if(!$done) {
    $done = 1;

    &printHeader('Checking For Imports');

    open FILE, "< $singleFile" or die 'Could not open file: ' . $singleFile . "\n";
    my $_import = 0;
    my @required;
    while( <FILE> ) {
	if($_import) {
	    if(/^\n/) { last; }
	    elsif(/FUNC_(\w+)/) { push @required, $1; }
	}
	if(/##Import/) {
	    $_import = 1;
	}
    }
    close FILE;

    my $required = join(' ', @required);

    my $cmd = $perl . ' ' . $pullin . ' ' . $deps . ' '  . $required;
    my @toImport = &command($cmd, 'readpipe');

    foreach my $toImport (@toImport) {
	print "\t\t" . 'Importing: ' . $toImport;
	chomp($toImport);

	my $cmd = $vex_location  . ' -S ' . $libraries . $toImport . ' ' . $arguments . ' -fexpand-div -fno-xnop -w ';
	if($fmm ne '') {
	    $cmd .= '-fmm=' . $fmm . ' ';
	}
	if($mallocSize) {
	    $cmd .= '-DHEAP_SIZE=' . $mallocSize . ' ';
	}
	$cmd .= '2>&1';
	&command($cmd);

	$toImport =~ /(\w+)\/(\w+)\.c/;
	my $s_toImport = $2 . '.s';

	my $cmd = $perl . ' ' . $firstpass . ' ' . $s_toImport . ' ';
	$cmd .= '2>&1';
	my @ret = &command($cmd, 'readpipe');
	(my $fn, my $r) = split(/\s+contains\s+/, $ret[$#ret]);
	push @sfiles_new, $fn;

	# TODO check for softfloat
	if(!$softfloat) {
	    foreach my $sfile (@sfiles_new) {
		open SFILE, "< $sfile" or die 'Could not open file: ' . $sfile . "\n";
		while(<SFILE>) {
		    if(/_(r|d)_(r|d|add|sub|mul|div|eq|le|lt|ilfloat|ufloat)/) {
			print "\t" . 'Need to include the softfloat lib...' . "\n";
			my $floatlib_arguments = $arguments;
			$floatlib_arguments =~ s/-c99inline//g;

			my $cmd = $vex_location . ' -S ' . $floatlib . ' ' . $floatlib_arguments . ' -fexpand-div -fno-xnop -w ';
			if($fmm ne '') {
			    $cmd .= '-fmm=' . $fmm . ' ';
			}
			$cmd .= '2>&1';
			&command($cmd);
			$softfloat = 1;
			last;
		    }
		}
		close SFILE;
		if($softfloat) {
		    last;
		}
	    }
	}
    }

    # if any files have been included need to go back and compile through again
    if($#toImport > -1) {
	goto REWIND;
    }
}

&printHeader('Running Second Pass');
my $cmd = $perl . ' ' . $secondpass . ' -d=0 ' . $singleFile . ' -OPC=' . $opcodes . ' -dram=' . sprintf("0x%x ", $dramSize);
if($memAlign) {
    $cmd .= '-mem_align ';
}
if($dramBaseOffset) {
    $cmd .= '-DRAM_OFFSET=' . sprintf("0x%x ", $dramBaseOffset);
}
$cmd .= '2>&1';
&command($cmd);

# all done, remove intermediate files
if(!$keep) {
    if(!$skip) {
	my $cmd = 'rm -f *.s';
	&command($cmd);
    }

    # remove directories
    foreach my $toRemove (@sfiles_new) {
	(my $dir, my $file) = split(/\//, $toRemove);
	rmtree($dir) or warn 'Could not remove directory: ' . $dir . "\n";
    }
}

&printHeader("\n" . 'All Done' . "\n");
exit(0);

# read command line arguments
sub readArgs {
    my @args = @_;

    # initialise some variables
    $debug = 0; # printout more info
    $keep = 0; # remove intermediate files
    $sSize = 8; # default stack size
    $dramSize = 256; # default data ram size
    $falconMLHack = 0; # run falconml hack, script
    $skip = 0; # skip the compilation stage, requires .s files as input
    $outputDir = ''; # directory for output
    $memAlign = 0; # align data to boundaries (not supported fully)
    $fmm = ''; # machine model used by compiler (VEX)
    $xmlMM = ''; # machine model used by LE1
    $mallocSize = 0; # if set includes dynamic mem and sets size of area, in chunks
    $dramBaseOffset = 0; # start dram addressing from any value
    $inputDir = ''; # directory of files for compilation
    $arguments = ''; # argument string to pass to compiler
    $softfloat = 0; # used for including extra library

    foreach my $arg (@args) {
	if($arg eq '-d')                      { $debug = 1; }
	elsif($arg eq '-k')                   { $keep = 1; }
	elsif($arg eq '-falconmlhack')        { $falconMLHack = 1; }
	elsif($arg eq '-skip')                { $skip = 1; }
	elsif($arg =~ /-o(\w+)/)              { $outputDir = $1; }
	elsif($arg eq '-memalign')            { $memAlign = 1; }
	elsif($arg =~ /-fmm=(.+)/)            { $fmm = $1; }
	elsif($arg =~ /-xmlMM=(.+)/i)         { $xmlMM = $1; }
        # VEX (use for clusters)
	elsif($arg =~ /-width=(\d+)/)         { $arguments .= ' -width ' . $1 . ' '; }
	elsif($arg =~ /-MALLOC_SIZE=(\d+)/)   { $mallocSize = $1; }
	elsif($arg =~ /-DRAM_OFFSET=0x(\w+)/) { $dramBaseOffset = hex($1); }
	# inlude path for pthread.h
	elsif($arg eq '-pthread')             { $arguments .= ' -I' . $le1_folder . '/' . $assembler_folder . '/includes/libraries/pthread/' ;}
	# macro for getCPUID function
	elsif($arg eq '-cpuid')               { $arguments .= ' -DgetCPUID\(x\)=_asm1\(0x0,x\) '; }
	elsif($arg =~ /-D(.+)=(.+)/)          { $arguments .= ' ' . $arg . ' '; }
	elsif($arg =~ /-h(elp)?/)             { &help; }
	# any other flag sent
	elsif($arg =~ /^(-\w+)/)              { $arguments .= ' ' . $arg . ' '; }
	elsif($arg =~ /-I(.+)/)               { $arguments .= ' ' . $arg . ' '; }
	else                                  { $inputDir = $arg; }
    }

}

sub help {
    print<<HELP;
usage: perl generate.pl <ARGS>
Args:
    <dir>        - Directory including .c files
    -d           - Debug, will output more information
    -xmlMM=%s    - Machine model in LE1 xml format (absolute path)
    -fmm=%s      - Machine model in VEX MM format (absolute path)
    -cpuid       - Includes getCPUID operation
    -pthread     - Include pthread library
    -MALLOC_SIZE=%d - Set size for dynamic memory (default is 100 Chunks)
    -oNAME       - Output name, if none is given it will use the dircetory name
    <args>       - Will be passed to gcc/VEX
    (all unknown arguments will be passed to compiler)
HELP
	exit(0);
}

sub printHeader {
    print<<EOH;
--------------------------------------------------------------------------------
 $_[0]
--------------------------------------------------------------------------------
EOH
}

sub printCmd {
    print 'Running command: ' . $_[0] . "\n";
}

sub checkReturn {
    if(($_[0] >> 8) != 0) {
	print 'Error running command: ' . "\n";
	print "\t" . $_[1] . "\n";
	exit(-1);
    }
}

sub command {
    my @ret;
    if($debug) { &printCmd($_[0]); }
    if($_[1] eq 'readpipe') {
	@ret = readpipe($_[0]);
    }
    else {
	system($_[0]);
    }
    &checkReturn($?, $_[0]);
    return @ret;
}
