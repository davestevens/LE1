#!/usr/bin/perl

@cfiles = <*.c>;

foreach $file (@cfiles) {
    $file =~ /(\w+)/;
    $toPrint = "\@" . $1 . " = (\"" . $file . "\"";
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
		$toPrint .= ", \"" . $_ . "\"";
	    }
	}
	if(/\/\*\s+requires:/) {
	    $req = 1;
	}
    }
    $toPrint = "";
    close FILE;
}
