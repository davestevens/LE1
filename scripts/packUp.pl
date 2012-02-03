#!/usr/bin/perl
use strict;
# package up the LE1 Tool Chain

my $d = 0;
my $rev = readpipe('git rev-parse --short HEAD');
chomp($rev);

print 'LE1 Tool Chain Revision: ' . $rev . "\n";

# mkdir LE1
if(-e 'LE1_' . $rev) {
    cmd('rm -rf LE1_' . $rev, 0);
}
cmd('mkdir LE1_' . $rev, 0);
# archive GIT
cmd('git archive master | tar -x -C LE1_' . $rev, 0);
# make Insizzle release
chdir('Insizzle');
cmd('make clean && make release', 0);
chdir('../LE1_' . $rev);

# remove test and script dir
cmd('rm -rf test/ scripts/', 0);

# remove insizzle direcories
cmd('rm -rf Insizzle/obj Insizzle/inc Insizzle/src Insizzle/scripts Insizzle/Makefile', 0);
# copy compiled insizzle binary to here
cmd('cp ../Insizzle/INSIZZLE Insizzle/', 0);

chdir('../');
if(-e 'LE1') {
    cmd('rm -rf LE1');
}
cmd('mv LE1_' . $rev . ' LE1', 0);

# tar up
cmd('tar -czvf LE1_' . $rev . '.tar.gz LE1/', 0);
cmd('rm -rf LE1');

print 'Created LE1_' . $rev . '.tar.gz' . "\n";

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
	exit(-1);
    }
#    else {
#	if($d) { print "\t" . 'return code: ';
#		 print ($? >> 8);
#		 print "\n";
#	}
#    }
}
