#!/usr/bin/perl

# New version of the midpass script
# 13/03/12
# Dave Stevens

use strict;

my ($dramBaseOffset, $outputName, @files, $main);

&readArgs(@ARGV);

# only require mid pass for more than 1 file
if($#files < 1) {
    print 'Error:' . "\n";
    print "\t" . 'You entered 1 or less files, you do not need this pass for that' . "\n";
    exit(-1);
}
# make sure outputName is set
if($outputName eq '') {
    print 'Error:' . "\n";
    print "\t" . 'You need to spicify an output name (-o(\w+))' . "\n";
    exit(-1);
}

# first of all check for main function
for(my $i=0;$i<=$#files;$i++) {
    open FILE, "< $files[$i]" or die 'Could not open file: ' . $files[$i] . ' ' . $! . "\n";
    while(<FILE>) {
	if(/^--\s*FUNC_main\n/) {
	    if($main eq '') {
		$main = $files[$i];
		splice(@files, $i--, 1);
	    }
	    else {
		print 'Error:' . "\n";
		print "\t" . 'Found 2 main functions in ' . $main . ' and ' . $files[$i] . "\n";
		exit(-1);
	    }
	}
    }
    close FILE;
}

# if no main function error out
if($main eq '') {
    print 'Error:' . "\n";
    print "\t" . 'Main() undefined.' . "\n";
    exit(-1);
}

# alter array so that file with main function is at the top
splice(@files, 0, 0, $main);

# variables to keep track of values through out different files
my $instructionTotal = 0;
my $dataTotal = 0;
my $dataCurrent = 0;
my $bssTotal = 0;
my $bssCurrent = 0;

my $order = '';

my ($noOfInstructions, $dataAlign, $dataSize, $bssAlign, $bssSize);
my (@operations, @importObjects, @imports, @instructionLabels, @dataLabels, @bssLabels, @memory);
my %dataLabels;

# loop though each file
foreach my $file (@files) {
    $order .= $file . ' ';

    my $filename = '';
    if($file =~ /\//) {
	my @f = split(/\//, $file);
	$filename = $f[$#f];
    }
    else {
	$filename = $file;
    }
    my @i = split(/\./, $filename);
    $filename = $i[0];

    # open file
    open FILE, "< $file" or die 'Could not open file: ' . $file . ' ' . $! . "\n";
    my @currentFile = <FILE>;
    close FILE;

    # loop through and replace labels to include the filename
    for(my $i=0;$i<$#currentFile;$i++) {
	$currentFile[$i] =~ s/(L\d+\?\d+)/$filename\_$1/;
	$currentFile[$i] =~ s/(_\?\d+\.\w+\.TAG\.\d+\.\d+)/$filename\_$1/;
    }

    # loop through and populate arrays of different sections of the file
    for(my $i=0;$i<$#currentFile;$i++) {
	# operations
	if($currentFile[$i] =~ /\#\#\s*Operations\s*-\s*(\d+)/) {
	    $noOfInstructions = $1;
	    $i++;
	    while(($currentFile[$i] !~ /^\n/) && ($i <= $#currentFile)) {
		push @operations, $currentFile[$i++];
	    }
	}
	# imported objects
	if($currentFile[$i] =~ /\#\#\s*ImportObjects/) {
	    $i++;
	    while(($currentFile[$i] !~ /^\n/) && ($i <= $#currentFile)) {
		push  @importObjects, $currentFile[$i++];
	    }
	}
	# imported function
	if($currentFile[$i] =~ /\#\#\s*Import/) {
	    $i++;
	    while(($currentFile[$i] !~ /^\n/) && ($i <= $#currentFile)) {
		push  @imports, $currentFile[$i++];
	    }
	}
	# instruction labels
	if($currentFile[$i] =~ /\#\#\s*Instruction\s+Labels/) {
	    $i++;
	    while(($currentFile[$i] !~ /^\n/) && ($i <= $#currentFile)) {
		my($address, $label) = split(/\s+-\s+/, $currentFile[$i++]);
		my $newAddr = sprintf("%04x", (hex($address) + $instructionTotal));
		push @instructionLabels, $newAddr . ' - ' . $label;
	    }
	}
	# data labels
	if($currentFile[$i] =~ /\#\#\s*Data\s+Labels/) {
	    $i++;
	    while(($currentFile[$i] !~ /^\n/) && ($i <= $#currentFile)) {
		my($address, $label) = split(/\s+-\s+/, $currentFile[$i++]);
		my $newAddr = sprintf("%04x", (hex($address) + $dataTotal));
		chomp($label);
		if($dataLabels{$label} eq '') {
		    push @dataLabels, $newAddr . ' - ' . $label . "\n";
		    $dataLabels{$label} = $newAddr;
		}
		else {
		    # data label already exists
		    # could either be compiler error or bad input code
		}
	    }
	}
	# data section
	if($currentFile[$i] =~ /\#\#\s*Data\s+Section\s*-\s*(\d+)\s*-\s*Data_align=(\d+)/) {
	    $dataAlign = $2;
	    $dataSize = $1;
	    $i++;
	    while(($currentFile[$i] !~ /^\n/) && ($i <= $#currentFile)) {
		my($address, $hex, $bin) = split(/\s+-\s+/, $currentFile[$i++]);
		my $newAddr = sprintf("%04x", $dataCurrent);

		# hex value
		if($hex =~ /[A-Fa-f0-9]{8}/) {
		    push @memory, $newAddr . ' - ' . $hex . ' - ' . $bin;
		}
		# label to be generated later
		elsif($hex =~ /LABEL: (.+)/) {
		    push @memory, $newAddr . ' - LABEL: ' . $1 . "\n";
		}
		# local data label
		# i think this isn't used anymore (old)
		else {
		    $hex =~ /(\(*(\w*\??(\w+\.*)+)((\s*[+-]?\s*\d*\))*))/;
		    my $label = $filename . $2;
		    my $newValue = ($dataLabels{$label} + $dramBaseOffset);
		    my @newValue = split(/\)/, $4);

		    foreach my $nV (@newValue) {
			$nV =~ /([-+])(\d+)/;
			$newValue += ($1 eq '+') ? ($2) : (-$2);
		    }

		    push @memory, $newAddr . ' - ' . sprintf("%08x", $newValue) . ' - ' . sprintf("%032b", $newValue) . "\n";
		}
		$dataCurrent += 4;
	    }
	    $dataTotal += $dataSize;
	}
	# bss labels
	if($currentFile[$i] =~ /\#\#\s*BSS\s+Labels\s*-\s*(\d+)\s*-\s*Bss_align=(\d+)/) {
	    $bssAlign = $2;
	    $bssSize = $1;
	    $i++;
	    while(($currentFile[$i] !~ /^\n/) && ($i <= $#currentFile)) {
		my($address, $label) = split(/\s+-\s+/, $currentFile[$i++]);
		my $newAddr = sprintf("%04x", (hex($address) + $bssTotal));
		push @bssLabels, $newAddr . ' - ' . $label;
	    }
	    $bssTotal += $bssSize;
	}
    }
    $instructionTotal += ($noOfInstructions * 4);
}

if(!(-d $outputName)) {
    mkdir $outputName;
}

open FILE, "> $outputName/$outputName.temp.s" or die 'Could not open file: ' . $outputName . '/' . $outputName . '.temp.s ' . $! . "\n";

# create new sections

# operations
print FILE '## Operations - ' . ($instructionTotal / 4) . "\n";
foreach my $ops (@operations) {
    print FILE $ops;
}

# imported objects
# imported functions

# check if required imports are available in whole program
my %saw;
@saw{@imports} = ();
@imports = sort keys %saw;
undef %saw;
@saw{@importObjects} = {};
@importObjects = sort keys %saw;

my (@importsRequired, @importObjectsRequired);

my $found = 0;
foreach my $imp (@imports) {
    foreach my $lab (@instructionLabels) {
	my ($addr, $label) = split(/\s+-\s*/, $lab);
	if($imp eq $label) {
	    $found = 1;
	    last;
	}
    }
    if(!$found) {
	push @importsRequired, $imp;
    }
    $found = 0;
}

$found = 0;
foreach my $imp (@importObjects) {
    foreach my $lab (@dataLabels) {
	my ($addr, $label) = split(/\s+-\s+/, $lab);
	if($imp eq $label) {
	    $found = 1;
	    last;
	}
    }
    if(!$found) {
	foreach my $lab (@bssLabels) {
	    my ($addr, $label) = split(/\s+-\s+/, $lab);
	    if($imp eq $label) {
		$found = 1;
		last;
	    }
	}
    }

    if(!$found) {
	push @importObjectsRequired, $imp;
    }
    $found = 0;
}

print FILE "\n\n" . '##Import' . "\n";
foreach my $imp (@importsRequired) {
    print FILE $imp;
}
print FILE "\n\n" . '##ImportObjects' . "\n";
foreach my $imp (@importObjectsRequired) {
    print FILE $imp;
}
# instruction labels
print FILE "\n\n" . '##Instruction Labels' . "\n";
foreach my $lab (@instructionLabels) {
    print FILE $lab;
}
# data labels
print FILE "\n\n" . '##Data Labels' . "\n";
foreach my $lab (@dataLabels) {
    print FILE $lab;
}
# data section
print FILE "\n\n" . '##Data Section - ' . $dataTotal . ' - Data_align=' . $dataAlign . "\n";
foreach my $line (@memory) {
    print FILE $line;
}
#bss labels
print FILE "\n\n" . '##BSS Labels - ' . $bssTotal . ' - Bss_align=' . $bssAlign . "\n";
foreach my $lab (@bssLabels) {
    print FILE $lab;
}
close FILE;

print 'Mid Pass Completed' . "\n";
print 'Single .s file generated (' . $outputName . '/' . $outputName . '.temp.s)' . "\n";
print 'ORDER' . $order . "\n";

exit(0);

sub readArgs {
    my @args = @_;

    # initialise some variables
    $dramBaseOffset = 0; # start dram addressing from any value
    $outputName = ''; # name of output file
    $main = ''; # used to store file with main() in

    foreach my $arg (@args) {
	if($arg =~ /-o(\w+)/)                 { $outputName = $1; }
	elsif($arg =~ /-DRAM_OFFSET=0x(\w+)/) { $dramBaseOffset = hex($1); }
	else                                  { push @files, $arg; }
    }
}
