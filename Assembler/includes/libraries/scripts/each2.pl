#!/usr/bin/perl

push @cfiles, <lm/*.c>;
push @cfiles, <string/*.c>;
push @cfiles, <stdlib/*.c>;

foreach $file (@cfiles) {
    $file =~ /(\w+\/)(\w+)/;
    $dir = $1;
    $toPrint = "\@" . $2 . " = (\"" . $file . "\"";
    open FILE, "< $file" or die;
    $req = 0;
    while(<FILE>) {
	chomp();
	if($req) {
	    if(/\s*\*\//) {
		$toPrint .= ");\n";
		print $toPrint;
		last;
	    }
	    else {
		$toPrint .= ", \"" . $dir . $_ . "\"";
	    }
	}
	if(/\/\*\s+requires:/) {
	    $req = 1;
	}
    }
    $toPrint = "";
    close FILE;
}
