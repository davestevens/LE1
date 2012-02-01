#!/usr/bin/perl

use strict;

my $size = 8192;

open BINFILE, "> inputBin" or die;
open HFILE, "> inputH.h" or die;

print HFILE '#define SIZE ' . $size . "\n\n";
print HFILE "BYTE inputH[" . $size . "] = {\n";

for(my $i=0;$i<$size;$i++) {
    my $c = rand();
    $c *= 255;
    $c &= 0xff;
    printf(HFILE "\t0x%02x,\n", $c);
    print BINFILE chr($c);
}

print HFILE "};\n";

close HFILE;
close BINFILE;
