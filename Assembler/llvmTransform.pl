#!/usr/bin/perl

# transform the LLVM assembly into somthing I want

use strict;

########
# Operations - x
# Imports (should be none)
# Data Labels
# Data Section - x - Data_align=32
# BSS Labels - x - Bss_align=32

open INFILE, "< $ARGV[0]" or die;
my @inFile = <INFILE>;
close INFILE;

$ARGV[0] =~ /(\w+)\.(\w+)/;
my $filename = $1;
my $instCount = 0;
my (@oper, %instLabels);
my $i;

$instLabels{'exit'} = 'FUNC_exit'; # not the best way to get round this :S

for($i=0;$i<=$#inFile;$i++) {
    if($inFile[$i] =~ /\@object/) {
	last;
    }
    else {
	chomp($inFile[$i]);
	my ($inst, $comment) = split(/#/, $inFile[$i]);

	# remove leading and trailing whitespace
	$inst =~ s/^\s+//g;
	$inst =~ s/\s+$//g;

	if($inst =~ /^\./) { } # ignore any . instructions
	elsif($inst =~ /^(\w+):/) { # function labels
	    push @oper, '-- FUNC_' . $1;
	    $instLabels{$1} = 'FUNC_' . $1; # keep track of functions
	}
	elsif($inst =~ /^\$BB(\d+)_(\d+):/) { # basic block labels
	    push @oper, '-- ' . $filename . '_L' . $1 . '?' . $2;
	    $instLabels{'\$BB' . $1 . '_' . $2} = $filename . '_L' . $1 . '?' . $2;
	}
	elsif($inst =~ /^;/) { # clock
	    push @oper, ';';
	}
	elsif($inst =~ /^\w+\./) { # operations
	    push @oper, $inst;
	    $instCount++;
	}
	elsif($inst =~ /^$/) { } # empty lines
	elsif($inst =~ /^\$tmp/) { } # unused instruction labels
	else {
	    print "UNKNOWN: $inst\n";
	}
    }
}

# perform some modifications
for(my $j=0;$j<=$#oper;$j++) {
    # replace labels in instructions
    if($oper[$j] !~ /^--/) {
	while(my ($key, $value) = each(%instLabels)) {
	    $oper[$j] =~ s/(\W+)$key/$1$value/g;
	}
    }
    # rename multiply instructions
    $oper[$j] =~ s/^mul/mpy/;
    # insert some extra exit information
    if($oper[$j] =~ /call\.0\s+l\d+\.\d+,\s+FUNC_exit/) {
	$oper[$j] = '.call exit, caller, arg($r0.3:s32), ret($r0.3:s32)' . "\n" . $oper[$j];
    }
}

# check if main is the first function
# if not, move to the top
my $mainStart = -1;
my $mainEnd = 0;
for(my $j=0;$j<=$#oper;$j++) {
    if($mainStart != -1) {
	# in main
	do {
	    $mainEnd = ++$j;
	    if($oper[$j] =~ /-- FUNC/) {
		$j--;
		last;
	    }
	} while($j < $#oper);
    }
    if($oper[$j] =~ /^-- FUNC_main$/) {
	$mainStart = $j;
    }
}

# need to move main to the top of the file
if($mainStart != 0) {
    # remove main function
    my @mainFunc = splice(@oper, $mainStart, ($mainEnd - $mainStart)+1);
    # put in at top of operations array
    splice(@oper, 0, 0, @mainFunc);
}

my $comm = 0;
my @data;
my $currentLine = 0;
my $currentAddr = 0;
my %lookup;

for($i=$i-1;$i<=$#inFile;$i++) {
    if($inFile[$i] =~ /\.type\s+(\.?\w+),\@object/) {
	my $varname = $1;
	$lookup{$varname} = $currentAddr;
	my $found = 0;
	do {
	    $i++;
	    if($inFile[$i] =~ /\.comm\s+(\w+),(\d+),(\d+)/) {
		&pushData($varname, 0x0, $2, "COMM");
		$found = 1;
	    }
	    elsif($inFile[$i] =~ /\.word\s+(\d+|.?\w+)/) {
		&pushData($varname, $1, 0x0, "WORD");
	    }
	    elsif($inFile[$i] =~ /\.half\s+(\d+)/) {
		&pushData($varname, $1, 0x0, "HALF");
	    }
	    elsif($inFile[$i] =~ /\.byte\s+(\d+)/) {
		&pushData($varname, $1, 0x0, "BYTE");
	    }
	    elsif($inFile[$i] =~ /\.2byte\s+(\d+)/) {
		&pushData($varname, $1, 0x0, "HALF");
	    }
	    elsif($inFile[$i] =~ /\.4byte\s+(\d+)/) {
		&pushData($varname, $1, 0x0, "WORD");
	    }
	    elsif($inFile[$i] =~ /\.asci[iz]\s+\"(\w+)\"/) {
		&pushData($varname, $1, 0x0, "STRING");
	    }
	    elsif($inFile[$i] =~ /\.space\s+(\d+)/) {
		&pushData("", 0x0, $1, "SPACE");
		$found = 1;
	    }
	    elsif($inFile[$i] =~ /\.size\s+(\w+),\s*(\d+)/) {
		# should be the end of data item
		$found = 1;
	    }
	} while(($inFile[$i] !~ /^\n/) && ($i <= $#inFile) && ($found == 0));

	&alignMem();
    }
}

# Operations
print "## Operations - $instCount\n";
for(my $i=0;$i<=$#oper;$i++) {
    print $oper[$i] . "\n";
}
print "\n";

# print out all data labels
print "\n##Data Labels\n";
while(my ($key, $value) = each(%lookup)) {
    if($key !~ /^\./) {
	printf("%04x - %s\n", $value, $key);
    }
}

# data section
my $dataAddr = 0;
print "\n##Data Section - " . (($#data + 1) * 4) . " - Data_align=32\n";
foreach my $d (@data) {
    if($d =~ /\d+/) {
	printf("%04x - %08x - %032b\n", $dataAddr, $d, $d);
    }
    else {
	printf("%04x - %08x - %032b\n", $dataAddr, $lookup{$d}, $lookup{$d});
    }
    $dataAddr += 4;
}

exit(0);

sub pushData {
    my $name = $_[0];
    my $data = $_[1];
    my $size = $_[2];
    my $type = $_[3];

    if($type eq "COMM") {
	# pad to word boundary
	if($currentAddr % 4) {
	    while($currentAddr % 4) {
		$currentLine |= 0x00 << ((~($currentAddr % 4) & 0x3) * 8);
		$currentAddr++;
	    }
	    push @data, $currentLine;
	    $currentLine = 0;
	}

	#$lookup{$name} = $currentAddr;

	for(my $j=0;$j<$size;$j++) {
	    $currentLine |= 0x00 << ((~($currentAddr % 4) & 0x3) * 8);
	    $currentAddr++;
	    if(!($currentAddr % 4)) {
		push @data, $currentLine;
		$currentLine = 0;
	    }
	}
    }
    elsif($type eq "WORD") {
	# pad to word boundary
	if($currentAddr % 4) {
	    while($currentAddr % 4) {
		$currentLine |= 0x00 << ((~($currentAddr % 4) & 0x3) * 8);
		$currentAddr++;
	    }
	    push @data, $currentLine;
	    $currentLine = 0;
	}
	#if(!defined($lookup{$name})) {
	#    $lookup{$name} = $currentAddr;
	#}

	push @data, $data;
	$currentAddr += 4;
    }
    elsif($type eq "HALF") {
	# need to push any full words to data
	if(!($currentAddr % 4) && $currentAddr) {
	    push @data, $currentLine;
	    $currentLine = 0;
	}

	# possibility of padding
	if(($currentAddr % 2) && $currentAddr) {
	    $currentLine |= 0x00 << ((~($currentAddr % 4) & 0x3) * 8);
	    $currentAddr++;
	}

	#if(!defined($lookup{$name})) {
	#    $lookup{$name} = $currentAddr;
	#}

	$currentLine |= $data << (((~$currentAddr-1) % 4) * 8);
	$currentAddr += 2;
    }
    elsif($type eq "BYTE") {
	# need to push any full words to data
	if(!($currentAddr % 4) && $currentAddr) {
	    push @data, $currentLine;
	    $currentLine = 0;
	}

	#if(!defined($lookup{$name})) {
	#    $lookup{$name} = $currentAddr;
	#}

	$currentLine |= $data << ((~($currentAddr % 4) & 0x3) * 8);
	$currentAddr++;
    }
    elsif($type eq "SPACE") {
	# need to push any full words to data
	if(!($currentAddr % 4) && $currentAddr) {
	    push @data, $currentLine;
	    $currentLine = 0;
	}

	for(my $k=0;$k<$size;$k++) {
	    $currentLine |= 0x00 << ((~($currentAddr % 4) & 0x3) * 8);
	    $currentAddr++;

	    if(!($currentAddr % 4) && $currentAddr) {
		push @data, $currentLine;
		$currentLine = 0;
	    }
	}
    }
    elsif($type eq "STRING") {

	#if(!defined($lookup{$name})) {
	#    $lookup{$name} = $currentAddr;
	#}

	my @string = split(//, $data);
	for(my $k=0;$k<=$#string;$k++) {
	    $currentLine |= ord($string[$k]) << ((~($k % 4) & 0x3) * 8);
	    $currentAddr++;

	    if(!($currentAddr % 4) && $currentAddr) {
		push @data, $currentLine;
		$currentLine = 0;
	    }
	}
    }
}

sub alignMem {
# make sure all data is output
    if($currentAddr % 4) {
	while($currentAddr % 4) {
	    $currentLine |= 0x00 << ((~($currentAddr % 4) & 0x3) * 8);
	    $currentAddr++;
	}
	push @data, $currentLine;
    }
}