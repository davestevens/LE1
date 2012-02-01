#!/usr/bin/perl

use strict;

my @tests = (
    {'dir_name', 'test', 'ass_args', '-DSIZE=10 -O0', 'sim_args', ''},
    {'dir_name', 'sha', 'ass_args', '', 'sim_args', ''},
    {'dir_name', 'dijkstra', 'ass_args', '-MALLOC_SIZE=1000', 'sim_args', ''},
    {'dir_name', 'stringsearch', 'ass_args', '', 'sim_args', ''},
    {'dir_name', 'adpcm', 'ass_args', '', 'sim_args', ''},
    {'dir_name', 'basicmath', 'ass_args', '', 'sim_args', ''},
    );

my $d = 1;
my $LE1_DIR = '../';
my $ASSEMBLER_DIR = $LE1_DIR . 'Assembler/';
my $INSIZZLE_DIR = $LE1_DIR . 'Insizzle/';
my $TEST_DIR = readpipe('pwd');
chomp($TEST_DIR);
my $st;

print "Test suite for INSIZZLE and the LE1 Tool Chain\n";
print "git revision: ";
cmd('git rev-parse HEAD', 1);

# compile INSIZZLE both debug and release modes and copy them locally
chdir($INSIZZLE_DIR);
cmd('make distclean', 0);
cmd('make debug', 0);
# copy INSIZZLE to TEST
cmd('cp INSIZZLE ' . $TEST_DIR . '/INSIZZLE_DBG', 0);

cmd('make distclean', 0);
cmd('make release', 0);
cmd('cp INSIZZLE ' . $TEST_DIR . '/INSIZZLE_REL', 0);

foreach (@tests) {
    print '--------------------------------------------------------------------------------' . "\n";
    print 'Running test for: ' . $_->{'dir_name'} . "\n";

    # remove any old directories which would have been created
    chdir($TEST_DIR . '/' . $_->{'dir_name'});
    cmd('rm -rf binaries machinemodel microblaze TEST', 0);

    # move to Assembler
    chdir('../' . $ASSEMBLER_DIR);
    $st = 'generate';
    if(cmd('perl generate.pl -d ../test/' . $_->{'dir_name'} . ' ' . $_->{'ass_args'} . ' -oTEST -xmlMM=' . $TEST_DIR . '/' . $_->{'dir_name'} . '/check/machinemodel.xml', 0) == 1) { next; }

    chdir($TEST_DIR . '/' . $_->{'dir_name'});
    # run with INSIZZLE_DBG and check memory dump
    $st = 'INSIZZLE_DBG';
    if(cmd('../INSIZZLE_DBG machinemodel/model.xml', 0) == 1) { next; }
    $st = 'INSIZZLE_DBG memcheck';
    if(cmd('diff memoryDump_0.dat check/memout', 0) == 1) { next; }

    # run with INSIZZLE_REL and check memory dump
    $st = 'INSIZZLE_REL';
    if(cmd('../INSIZZLE_REL machinemodel/model.xml', 0) == 1) { next; }
    $st = 'INSIZZLE_REL memcheck';
    if(cmd('diff memoryDump_0.dat check/memout', 0) == 1) { next; }

    # run INSIZZLE_DBG though valgrind
    $st = 'Valgrind';
    if(cmd('valgrind ../INSIZZLE_REL machinemodel/model.xml --error-exitcode=1', 0) == 1) { next; }
    print 'Completed test for: ' . $_->{'dir_name'} . "\n";
    print '--------------------------------------------------------------------------------' . "\n";

    open FILE, ">>", $TEST_DIR . '/outcome.txt' or die 'Could not open outcome.txt: ' . "$!\n";
    my $date = readpipe('date');
    chomp($date);
    my $version = readpipe('cat /proc/version');
    chomp($version);
    my $rev = readpipe('git rev-parse --short HEAD');
    chomp($rev);
    print FILE 'PASS, ' . $rev . ', ' . $_->{'dir_name'} . ', ' . $date . ', ' . $version . "\n";
    close FILE;
}

exit(0);

# run command and check error code
sub cmd {
    if($d) { print $_[0] . "\n"; }
    if($_[1]) {
	system($_[0]);
    }
    else {
	readpipe($_[0]);
    }
    if(($? >> 8)) {
	print "\t" . 'Error running: ' . $_[0] . "\n";
	print "\t" . 'return code: ';
	print ($? >> 8);
	print "\n";
	#exit(-1);
	open FILE, ">>", $TEST_DIR . '/outcome.txt' or die 'Could not open outcome.txt: ' . "$!\n";
	my $date = readpipe('date');
	chomp($date);
	my $version = readpipe('cat /proc/version');
	chomp($version);
	my $rev = readpipe('git rev-parse --short HEAD');
	chomp($rev);
	print FILE 'FAIL, ' . $rev . ', ' . $_->{'dir_name'} . ' (' . $st . '), ' . $date . ', ' . $version . "\n";
	close FILE;
	return 1;
    }
    return 0;
}
