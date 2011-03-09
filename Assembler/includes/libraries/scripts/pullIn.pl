#!/usr/bin/perl

do($ARGV[0]);

for(my $i=0;$i<@ARGV;$i++) {
    my $temp = $ARGV[$i];
    foreach $file (@$temp) {
	$deps{$file} = 1;
    }
}

while (($key, $value) = each(%deps)) {
    print $key, "\n";
}
