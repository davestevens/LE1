#!/usr/bin/perl

# run through benchmarks

use strict;
use XML::Simple;
use Data::Dumper;

my $infile = $ARGV[0];

if(!(-e($infile))) {
    print $infile . ' does not exist' . "\n";
    exit(-1);
}

my $depth = 0;
my @path;
my $path;

my $bench = XMLin($infile,KeyAttr=>['list'],ForceArray=>1);

my $pwd = readpipe('pwd');
chomp($pwd);
my $LE1 = '/home/elds2/LE1/';
my $defaultAssemblerArgs = '';
my $err = 0;

print 'LE1 benchmarks' . "\n";
# run Insizzle in debug mode
#print '-' x 80 . "\n";
#print 'Debug' . "\n";
#&makeInsizzle('debug');
#$depth = 0;
#&walk($bench->{'single_thread'}[0]);

# run Insizzle in release mode
print '-' x 80 . "\n";
print 'Release' . "\n";
&makeInsizzle('release');
$depth = 0;
&walk($bench->{'single_thread'}[0]);
$depth = 0;
&walk($bench->{'coremark'}[0]);

#$depth = -1;

# run Insizzle in pthread mode
print '-' x 80 . "\n";
print 'Pthread' . "\n";
&makeInsizzle('VTHREAD');
$depth = 0;
&walk($bench->{'pthread'}[0]);

exit(0);

sub walk {
    my $element = $_[0];
    my $i = -1;
    $depth++;
    while(my $dir = $element->{'dir'}[++$i]) {
	$path[$depth] = $dir->{'name'};
	if(($dir->{'fileio'} eq 'true') || ($dir->{'stdio'} eq 'true') || ($dir->{'memcheck'} eq 'true')) {
	    $err = 0;
	    $path = '';
	    for(my $j=0;$j<=$depth;$j++) { $path .= $path[$j] . '/'; }
	    my $toAssemble = $pwd . '/' . $path;
	    my $assemblerFlags = $dir->{'assembler'};

	    # crappy hack around for the crappy legup code which #includes .c files
	    if($dir->{'file'}[0]) {
		chdir($pwd . '/' . $path);
		if(-d('ins_temp')) {
		    my $cmd = 'rm -rf ins_temp';
		    &exe($cmd);
		}
		my $cmd = 'mkdir ins_temp';
		&exe($cmd);
		chdir('ins_temp');
		$cmd = 'ln -sf ../' . $dir->{'file'}[0]->{'name'} . ' ' . $dir->{'file'}[0]->{'name'};
		&exe($cmd);
		$toAssemble .= '/ins_temp';
		$assemblerFlags .= ' -I../ ';
	    }
	    print $dir->{'name'} . "\n";
	    # compile through assembler
	    chdir($LE1 . 'Assembler/');
	    my $cmd = 'perl generate.pl ' . $toAssemble . ' ' . $defaultAssemblerArgs . ' ' . $assemblerFlags;
	    if(-e($pwd . '/' . $path . 'input/model.xml')) {
		$cmd .= ' -xmlMM=' . $pwd . '/' . $path . 'input/model.xml';
	    }
	    $cmd .= ' > ' . $pwd . '/' . $path . 'assembler_output';
	    &exe($cmd);

	    # run insizzle
	    chdir($toAssemble);
	    $cmd = $LE1 . 'Insizzle/INSIZZLE machinemodel/model.xml ' . $dir->{'insizzle'} . ' > ';
	    $cmd .= $pwd . '/' . $path . 'ins_std_out 2>&1 > ' . $pwd . '/' . $path . 'ins_out';
	    &exe($cmd);

	    chdir($pwd . '/' . $path);
	    # check output files / stdio
	    if($dir->{'fileio'} eq 'true') {
		$cmd = 'diff output/output output/output_correct > ' . $pwd . '/' . $path . 'fileio_diff';
		&exe($cmd);
	    }
	    if($dir->{'stdio'} eq 'true') {
		$cmd = 'diff ins_std_out output/stdio_output_correct > ' . $pwd . '/' . $path . 'stdioio_diff';
		&exe($cmd);
	    }
	    if($dir->{'memcheck'} eq 'true') {
		$cmd = 'diff memoryDump_0.dat output/memDump_correct > ' . $pwd . '/' . $path . 'memcheck_diff';
		&exe($cmd);
	    }

	    # remove all files
	    if (!$err) {
		$cmd = 'rm -rf assembler_output binaries ins_out ins_std_out machinemodel memoryDump_0.dat microblaze stdioio_diff fileio_diff memcheck_diff ins_temp ' . uc($dir->{'name'}) . ' output/output';
		&exe($cmd);
	    }
	}
	&walk($dir);
	$depth--;
    }
#    $depth = -1;
#    return;
}

sub makeInsizzle {
    chdir($LE1 . 'Insizzle');
    my $cmd = 'make clean && make ' . $_[0];
    print $cmd . "\n";
    &exe($cmd);
}

sub exe {
    #print "\t" . $_[0] . "\n";
    system($_[0]);
    if(($? >> 8)) {
	print '*** Error ***' . "\n";
	$err = 1;
    }
}
