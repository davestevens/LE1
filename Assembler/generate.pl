#!/usr/bin/perl

###############################################################################
#                               LE1 Tool-Chain                                #
#                                generate.pl                                  #
#                           Dave Stevens - A767169                            #
#                          Loughborough University                            #
#                              D.Stevens.ac.uk                                #
###############################################################################
use File::Path;

# include the filepaths.pl script
do('filepaths.pl');

$debug = 0;
$stack_size = "0x0";
$keep = 0;
$softfloat = 0;
$assembly = 0;
$fmm = "";
$xmlmm = "";
$sim_threads = 2;
$sim_mem_blocks = 1;
$sim_width = 4;
$mem_align = 0;
$vex_sim = 0;
$malloc_size = 0;
$dram_base_offset = '0x0';
foreach $arg (@ARGV) {
    if($arg eq "-d") {
	$debug = 1;
    }
    elsif($arg eq "-k") {
	$keep = 1;
    }
    elsif($arg eq "-skipvex") {
	$assembly = 1;
    }
    elsif($arg eq "-vexsim") {
	$vex_sim = 1;
    }
    elsif($arg =~ /-s=(0x\w+)?/) {
	$stack_size = $1;
    }
    elsif($arg =~ /-o(\w+)/) {
	$output_file = $1;
    }
    elsif($arg eq "-mem_align") {
	$mem_align = 1;
    }
    elsif($arg =~ /-fmm=(.+)/) {
	$fmm = $1;
    }
    elsif($arg =~ /-xmlMM=(.+)/) {
	$xmlmm = $1;
    }
    elsif($arg =~ /-width=(\d+)/) {
	$arguments .= "-width $1 ";
    }
    elsif($arg =~ /-SIM_THREADS=(\d+)/) {
	$sim_threads = $1;
    }
    elsif($arg =~ /-SIM_MEM_BLOCKS=(\d+)/) {
	$sim_mem_blocks = $1;
    }
    elsif($arg =~ /-SIM_WIDTH=(\d+)/) {
	$sim_width = $1;
    }
    elsif($arg =~ /-MALLOC_SIZE=(\d+)/) {
	$malloc_size = $1;
    }
    elsif($arg =~ /-DRAM_OFFSET=(0x\w+)/) {
	$dram_base_offset = $1;
    }
    elsif($arg =~ /-pthread/) {
	$arguments .= '-I' . $le1_folder . '/' . $assembler_folder . '/includes/libraries/pthread/';
    }
    elsif($arg =~ /-D(.+)=(.+)/) {
	$arguments .= "-D$1=$2 ";
    }
    elsif($arg =~ /-cpuid/) {
	# insert macro for getCPUID at compile time
	$arguments .= ' -DgetCPUID\(x\)=_asm1\(0x0,x\) ';
    }
    elsif($arg =~ /-+h(elp)?/) {
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
    elsif($arg =~ /(^-\w+)/) {
	    print $1, "\n";
	    $arguments .= "$1 ";
	}
	else {
	    $dir = $arg;
	}
    }
    if($output_file eq "")
    {
	@of = split(/\//, $dir);
	$output_file = uc($of[$#of]);
    }
    if($debug == 1)
    {
	print "Vex : $vex_location\n";
	print "Debug = $debug\n";
	print "Stack = $stack_size\n";
	print "Output File = $output_file\n";
	print "Arguments = $arguments\n";
	print "fmm = $fmm\n";
	print "Directory : $dir\n";
    }
    if($dir eq "")
    {
	print "Error:\nYou did not specify a directory to look in\nPlease use -h to see help\n";
	exit(0);
    }
    chdir("$dir");
    $cur_dir = readpipe("pwd");
    chomp($cur_dir);
    # remove all floatlib files
    system("rm -rf floatlib*");
    # remove all temp_* files (simulator files)
    system("rm -f temp_*");
    @cfiles = <*.c>;
    foreach $file (@cfiles)
    {
	if($file !~ /\.cs\.c/)
	{
	    $cfiles .= "$file ";
	}
	if($file eq "floatlib.c")
	{
	    $softfloat = 1;
	}
    }
    if($assembly == 0)
    {
	if($xmlmm ne '') {
	print<<EOH;
--------------------------------------------------------------------------------
	Creating machine model from XML file
--------------------------------------------------------------------------------
EOH
	    if(!(-d 'machinemodel')) {
		system("mkdir machinemodel");
	    }
	else {
	    print "\t" . 'machinemodel directory already exists' . "\n";
	}
	    my $command = 'perl ' . $xml_to_mm . ' ' . $xmlmm . ' machinemodel';
	    if($debug == 1) {
		print "Running Command: " . $command . "\n";
	    }
	    @return = readpipe($command);
	    if(($? >> 8) != 0) {
		print "Error creating vex machine model from LE1 XML machine model\n";
		exit(-1);
	    }
	    if(-e("machinemodel/model.mm")) {
		$fmm = $cur_dir . "/machinemodel/model.mm";
	    }
	    elsif(-e("machinemodel/0_0_0.mm")) {
		#TODO: does not work with heterogeneous systems at the moment
		$fmm = $cur_dir . "/machinemodel/0_0_0.mm";
	    }
	    else {
		print "Could not find created machine model\n";
		print "Should be in <dir>/machinemodel/\n";
		exit(-1);
	    }
	    # copy xml to machinemodel dir
	    $command = 'cp ' . $xmlmm . ' ' . $cur_dir . '/machinemodel/';
	    system($command);
	}
	print<<EOH;
--------------------------------------------------------------------------------
	Running FalconML Hack
--------------------------------------------------------------------------------
EOH
	    if($debug == 1)
	{
#	    print "Running Command: perl $falconml_hack $vex_location\n";
	}
	#@return = readpipe("perl $fml_hack_location");
#	system("perl $falconml_hack $vex_location");
	print<<EOH;
--------------------------------------------------------------------------------
	Running VEX
--------------------------------------------------------------------------------
EOH
	    if($debug == 1)
	{
	    if($fmm eq "")
	    {
		print "Running Command: $vex_location -S $cfiles $arguments -fexpand-div -fno-xnop -w 2>&1\n";
	    }
	    else
	    {
		print "Running Command: $vex_location -S $cfiles $arguments -fexpand-div -fno-xnop -w -fmm=$fmm 2>&1\n";
	    }
	}
	if($fmm eq "")
	{
	    @return = readpipe("$vex_location -S $cfiles $arguments -fexpand-div -fno-xnop -w 2>&1");
	}
	else
	{
	    @return = readpipe("$vex_location -S $cfiles $arguments -fexpand-div -fno-xnop -w -fmm=$fmm 2>&1");
	}
	&check_return();
	print "VEX run completed, created all .s and .cs.c files\n";
    }
    if($softfloat == 0)
    {
	@sfiles = <*.s>;
	foreach $sfile (@sfiles)
	{
	    open SFILE, "< $sfile" or die "Could not open file ($sfile : $!)\n";
	    while( <SFILE> )
	    {
		if(/_(r|d)_(r|d|add|sub|mul|div|eq|le|lt|ilfloat|ufloat)/)
		{
		    print "Including softfloat library\n";
#		    @return = readpipe("cp $le1_folder/Assembler/includes/floatlib.c . 2>&1");
#		    @return = readpipe("cp $floatlib . 2>&1");
		    &check_return();
		    $floatlib_args = $arguments;
		    $floatlib_args =~ s/-c99inline//g;
		    if($fmm eq "")
		    {
			print "Running Command: $vex_location -S $floatlib $floatlib_args -fexpand-div -fno-xnop -w 2>&1\n";
		    }
		    else
		    {
			print "Running Command: $vex_location -S $floatlib $floatlib_args -fexpand-div -fno-xnop -w -fmm=$fmm 2>&1\n";
		    }
		    if($fmm eq "")
		    {
			@return = readpipe("$vex_location -S $floatlib $floatlib_args -fexpand-div -fno-xnop -w 2>&1");
		    }
		    else
		    {
			@return = readpipe("$vex_location -S $floatlib $floatlib_args -fexpand-div -fno-xnop -w -fmm=$fmm 2>&1");
		    }
		    &check_return();
		    push @cfiles, "floatlib.c";
		    $softfloat = 1;
		    last;
		}
	    }
	    close SFILE;
	    if($softfloat == 1)
	    {
		last;
	    }
	}
    }
    if($#cfiles < 1)
    {
	$keep_folder = 1;
    }
    else
    {
	$keep_folder = $keep;
    }

    print<<EOH;
--------------------------------------------------------------------------------
    Running Assembler
--------------------------------------------------------------------------------
EOH
	@files = <*.s>;
    print "Files:\n";
    foreach $file (@files)
    {
	print "\t$file\n";
    }
    if(($#files > 0) && ($output_file eq ""))
    {
	print "Error: You need to specify an output name, eg -oOutputFile\n\n";
	exit(0);
    }
    print<<EOH;
--------------------------------------------------------------------------------
    Running First Pass
--------------------------------------------------------------------------------
EOH
	foreach $file (@files)
    {
	if($debug == 1)
	{
	    print "Running firstpass on: $file\n";
	    print "Running Command: $perl $firstpass $file -s=$stack_size 2>&1\n";
	}
	@return = readpipe("$perl $firstpass $file -s=$stack_size 2>&1");
	&check_return();
	($filename, $rest) = split(/ contains /, $return[$#return]);
	push @files2, $filename;
    }
    print "Firstpass Completed\n";

    $DONE = 0;
REWIND:

    if($#files2 > 0)
    {
	print<<EOH;
--------------------------------------------------------------------------------
	Running Mid Pass
--------------------------------------------------------------------------------
EOH
	$midpassfiles = '';
	foreach $file (@files2)
	{
	    if($debug == 1)
	    {
		print "Running midpass on: $file\n";
	    }
	    $midpassfiles .= $file . " ";
	}
	if($debug == 1)
	{
	    print "Running Command: $perl $midpass $midpassfiles -o$output_file -DRAM_OFFSET=$dram_base_offset 2>&1\n";
	}
	@return = readpipe("$perl $midpass $midpassfiles -o$output_file -DRAM_OFFSET=$dram_base_offset 2>&1");
	&check_return();
	$return[$#return] =~ s/ORDER//;
	@order = split(/ /, $return[$#return]);
	print "Midpass completed\n";
	$file3 = $output_file . "/" . $output_file . ".temp.s";
    }
    else
    {
	print "No Midpass needed\n";
	$file3 = $files2[0];
    }
    print<<EOH;
--------------------------------------------------------------------------------
    TRANSFORMING ASSEMBLY FILE
--------------------------------------------------------------------------------
EOH

if($debug == 1)
{
    print "Running Command: $perl $transform $file3 > $file3.new.s\n";
}

@return = readpipe("$perl $transform $file3 > $file3.new.s");
    &check_return();

$file3 = $file3 . ".new.s";

if($DONE == 0)
{
    $DONE = 1;
# TODO: at this point we should look for imports and pull in files as needed
    printf("looking for imports\n");
    open FILE, "< $file3" or die;
    $imp = 0;
    while(<FILE>)
    {
	if($imp)
	{
	    if(/^\n/)
	    {
		last;
	    }
	    else
	    {
		/FUNC_(\w+)/;
		push @required, $1;
	    }
	}
	if(/##Import/)
	{
	    $imp = 1;
	}
    }
    close FILE;

    print "$perl $pullin $deps @required\n";
    @toImport = readpipe("$perl $pullin $deps @required");

    if(($#toImport + $#cfiles) >= 1)
    {
	$keep_folder = $keep;
    }

    foreach $toImport (@toImport)
    {
	chomp($toImport);
	print "\tImporting: $toImport\n";

	if($fmm eq "")
	{
	    if($malloc_size) {
		print "\t\tRunning Command: $vex_location -S $libraries$toImport $arguments -fexpand-div -fno-xnop -w -DHEAP_SIZE=$malloc_size 2>&1\n";
		@return = readpipe("$vex_location -S $libraries$toImport $arguments -fexpand-div -fno-xnop -w  -DHEAP_SIZE=$malloc_size 2>&1");
	    }
	    else {
		print "\t\tRunning Command: $vex_location -S $libraries$toImport $arguments -fexpand-div -fno-xnop -w 2>&1\n";
		@return = readpipe("$vex_location -S $libraries$toImport $arguments -fexpand-div -fno-xnop -w 2>&1");
	    }
	    &check_return();
	    # then run firstpass on this
	    $toImport =~ /(\w+)\/(\w+)\.c/;
	    $forFP = $2 . ".s";
	    print "\t\tRunning Command: $perl $firstpass $forFP -s=$stack_size 2>&1\n";
	    @return = readpipe("$perl $firstpass $forFP -s=$stack_size 2>&1");
	    &check_return();

	    ($filename, $rest) = split(/ contains /, $return[$#return]);
	    push @files2, $filename;
	}
	else
	{
	    if($malloc_size) {
		print "\t\tRunning Command: $vex_location -S $libraries$toImport $arguments -fexpand-div -fno-xnop -w -DHEAP_SIZE=$malloc_size -fmm=$fmm 2>&1\n";
		@return = readpipe("$vex_location -S $libraries$toImport $arguments -fexpand-div -fno-xnop -w  -DHEAP_SIZE=$malloc_size -fmm=$fmm 2>&1");
	    }
	    else {
		print "\t\tRunning Command: $vex_location -S $libraries$toImport $arguments -fexpand-div -fno-xnop -w -fmm=$fmm 2>&1\n";
		@return = readpipe("$vex_location -S $libraries$toImport $arguments -fexpand-div -fno-xnop -w -fmm=$fmm 2>&1");
	    }
	    &check_return();
	    # then run firstpass on this
	    $toImport =~ /(\w+)\/(\w+)\.c/;
	    $forFP = $2 . ".s";
	    print "\t\tRunning Command: $perl $firstpass $forFP -s=$stack_size2>&1\n";
	    @return = readpipe("$perl $firstpass $forFP -s=$stack_size 2>&1");
	    &check_return();

	    ($filename, $rest) = split(/ contains /, $return[$#return]);
	    push @files2, $filename;

	}
    }

    # need to check to see if softfloat needs adding
    if($softfloat == 0)
    {
	@sfiles = <*.s>;
	foreach $sfile (@sfiles)
	{
	    open SFILE, "< $sfile" or die "Could not open file ($sfile : $!)\n";
	    while( <SFILE> )
	    {
		if(/_(r|d)_(r|d|add|sub|mul|div|eq|le|lt|ilfloat|ufloat)/)
		{
		    print "Including softfloat library\n";
#		    @return = readpipe("cp $floatlib . 2>&1");
#		    &check_return();
		    $floatlib_args = $arguments;
		    $floatlib_args =~ s/-c99inline//g;
		    if($fmm eq "")
		    {
			print "Running Command: $vex_location -S $floatlib $floatlib_args -fexpand-div -fno-xnop -w 2>&1\n";
			@return = readpipe("$vex_location -S $floatlib $floatlib_args -fexpand-div -fno-xnop -w 2>&1");
		    }
		    else
		    {
			print "Running Command: $vex_location -S $floatlib $floatlib_args -fexpand-div -fno-xnop -w -fmm=$fmm 2>&1\n";
			@return = readpipe("$vex_location -S $floatlib $floatlib_args -fexpand-div -fno-xnop -w -fmm=$fmm 2>&1");
		    }
		    &check_return();
		    push @cfiles, "floatlib.c";

		    # then run first pass on it
		    print "\t\tRunning Command: $perl $firstpass floatlib.s -s=$stack_size 2>&1\n";
		    @return = readpipe("$perl $firstpass floatlib.s -s=$stack_size 2>&1");
		    &check_return();

		    ($filename, $rest) = split(/ contains /, $return[$#return]);
		    push @files2, $filename;

		    $softfloat = 1;
		    last;
		}

	    }
	    if($softfloat)
	    {
		last;
	    }
	}
    }

    printf("done looking for imports\n");
    if(@toImport > 0)
    {
	goto REWIND;
    }
}

    print<<EOH;
--------------------------------------------------------------------------------
    Running Second Pass
--------------------------------------------------------------------------------
EOH
	if($debug == 1)
    {
	print "Running secondpass on: $file3\n";
	if($mem_align)
	{
	    print "Running Command: $perl $secondpass -s=$stack_size -d=0 -mem_align $file3 -OPC=$opcodes -DRAM_OFFSET=$dram_base_offset 2>&1\n";
	}
	else
	{
	    print "Running Command: $perl $secondpass -s=$stack_size -d=0 $file3 -OPC=$opcodes -DRAM_OFFSET=$dram_base_offset 2>&1\n";
	}
    }
    if($mem_align)
    {
	@return = readpipe("$perl $secondpass -s=$stack_size -d=0 -mem_align $file3 -OPC=$opcodes -DRAM_OFFSET=$dram_base_offset 2>&1");
    }
    else
    {
	@return = readpipe("$perl $secondpass -s=$stack_size -d=0 $file3 -OPC=$opcodes -DRAM_OFFSET=$dram_base_offset 2>&1");
    }
    &check_return();
    print "Secondpass completed\n";
    if($keep_folder != 1)
    {
	foreach $file (@files2)
	{
	    ($direct, $file) = split(/\//, $file);
	    rmtree($direct) or warn "Couldn't remove $direct\n";
	}
    }

if($vex_sim)
{
    print<<EOH;
--------------------------------------------------------------------------------
    Generating VEX Simulator
--------------------------------------------------------------------------------
EOH
	if($debug == 1)
    {
	print "Now running Q Gen to generate binaries\n";
    }
    $data_file = $file3;
    if($#order > -1)
    {
	foreach $or (@order)
	{
	    print "$or\n";
	    chomp($or);
	    ($name, $file) = split(/\//, $or);
	    if($name ne "")
	    {
		$cscfiles .= "$name.cs.c ";
		$csofiles .= "$name.cs.o ";
	    }
	}
    }
    else
    {
	$cscfiles = $sfiles[0];
	$cscfiles =~ s/\.s/\.cs\.c/g;
	$csofiles = $sfiles[0];
	$csofiles =~ s/\.s/\.cs\.o/g;
    }
    if($debug == 1)
    {
	print "Running Command: $perl $forq_location -s=$stack_size -d=$debug $cscfiles -o$output_file\_q -df=$data_file 2>&1\n";
    }
    @return = readpipe("$perl $forq_location -s=$stack_size -d=$debug $cscfiles -o$output_file\_q -df=$data_file 2>&1");
    &check_return();
    if($debug == 1)
    {
	print "Running Command: gcc -c $cscfiles -w -m32\n";
    }
    @return = readpipe("gcc -c $cscfiles -w -m32 2>&1");
    &check_return();
    if($debug == 1)
    {
	print "Running Command: gcc -c $le1_folder/For_q/includes/forq.c -o forq.o -m32 2>&1\n";
	print "Running Command: $vex_location -o $output_file\_q $csofiles $arguments forq.o -w 2>&1\n";
    }
    @return = readpipe("gcc -c $le1_folder/For_q/includes/forq.c -o forq.o -m32 2>&1");
    &check_return();
    @return = readpipe("$vex_location -o $output_file\_q $csofiles $arguments forq.o -w 2>&1");
    &check_return();
    print<<EOH;
--------------------------------------------------------------------------------
- All Done
-
- There should now be the following file structure:
- FROM ASSEMBLER
- $dir/$output_file/$output_file.inst.txt
-                   Text file with instructions and PC
- $dir/$output_file/$output_file.s.bin
-                   Binary data to feed ISS instructions
- $dir/$output_file/$output_file.data.txt
-                   Text file showing data addresses and content
- $dir/$output_file/$output_file.data.bin
-                   Binary data to feed ISS data
- $dir/$output_file/$output_file.temp.s
-                   Intermediate File
-
- FROM FOR_Q
- $dir$output_file\_q
-      Executable to run which will output to a Q with the name "$output_file\_q"
-
- To read this Q use one of the receive executables in the For_q/includes dir.
- Calling it with ./receive_sim $output_file\_q
-
--------------------------------------------------------------------------------
EOH
}
if($keep != 1)
    {
	system("rm -f *.cs.c *.o *.s *.txt");
    }
    exit(0);
#    sub setup()
#    {
#	print "Needs setting up!\n";
#	while($vex_cc eq "")
#	{
#	    print "Please type the location of VEX cc:\n";
#	    chomp($vex_cc = <>);
#	    $vex_cc =~ s/~/$home/;
#	    if(!(-e($vex_cc)))
#	    {
#		$vex_cc = "";
#	    }
#	}
#	while($le1_folder eq "")
#	{
#	    print "Please type the location of LE1 folder:\n";
#	    chomp($le1_folder = <>);
#	    $le1_folder =~ s/~/$home/;
#	    if(!(-d($le1_folder)))
#	    {
#		$le1_folder = "";
#	    }
#	}
#	open ASSEM, "> $home/.assem" or die
#	    "Could not open file to write to (.assem: $!)\n";
#	print ASSEM "VEX=$vex_cc\n";
#	print ASSEM "LE1=$le1_folder\n";
#	close ASSEM;
#	print "Thanks :)\n";
#    }
sub check_return()
{
    $error = 0;
    foreach $return (@return)
    {
	if($debug == 1)
	{
	    print $return;
	}
	if($return =~ /error:/i)
	{
	    $error = 1;
	}
	elsif($return =~ /no such (file|dir)/i)
	{
	    $error = 1;
	}
    }
    if($error == 1)
    {
	foreach $return (@return)
	{
	    print $return;
	}
	print "\nThere has been an error, see above and resolve the issue\n\n";
	exit(0);
    }
}
