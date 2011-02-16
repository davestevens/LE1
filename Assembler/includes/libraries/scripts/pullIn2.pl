#!/usr/bin/perl

do("deps.pl");

foreach $arg (@ARGV) {
    getMore(@$arg);
}

while (($key, $value) = each(%deps)) {
    print $key, "\n";
}

sub getMore()
{
    #push @UNdeps, $_[0];
    $deps{$_[0]} = 1;
    for($i=1;$i<@_;$i++) {
	$deps{$_[$i]} = 1;
	$_[$i] =~ /\w+\/(\w+)/;
	if(@$1 > 1) {
	    getMore(@$1);
	}
    }
}
