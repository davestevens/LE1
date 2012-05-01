#!/usr/bin/perl

# concatenate multiple .temp.s.new.s files (originally used for llvm sections

use strict;

#######
# Operations - x
# Data Labels
# Data Section - x - Data_align=32

# foreach file input need to see if main available
my $foundMain = 0;
my @order;
foreach my $file (@ARGV) {
    if($foundMain) {
	push @order, $file;
    }
    else {
	open FILE, "< $file" or die;
	while(<FILE>) {
	    chomp();
	    if(/^--\s+FUNC_main\s*$/) {
		# this file has a main function in it, it should be at the top
		# splice into the top or order array
		splice(@order, 0, 0, $file);
		$foundMain = 1;
		last;
	    }
	}
	close FILE;
	if(!$foundMain) {
	    push @order, $file;
	}
    }
}

# now have the order to do stuff in
my (@operations, %dataLabels, @dataArea, %instLabels);
my $operationCount = 0;
foreach my $file (@order) {
    open FILE, "< $file" or die;
    while(<FILE>) {
	if(/^##\s*Operations\s*\-\s*(\d+)/) {
	    $operationCount += $1;
	    while(<FILE>) {
		chomp();
		if(/^\s*$/) {
		    last;
		}
		else {
		    push @operations, $_;
		    if(/^--\s+FUNC_(\w+)/) {
			$instLabels{$1} = 'FUNC_' . $1;
		    }
		}
	    }
	}
	if(/^##\s*Data\s+Labels/) {
	    while(<FILE>) {
		chomp();
		if(/^\s*$/) {
		    last;
		}
		else {
		    /(\w+)\s*\-\s*(.+)/;
		    $dataLabels{$2} = hex($1) + (@dataArea * 4);
		}
	    }
	}
	if(/^##\s*Data\s+Section\s*\-\s*(\d+)\s*\-\s*Data_align=(\d+)/) {
	    while(<FILE>) {
		/(\w+)\s*\-\s*(\w+)\s*\-\s*(\d+)/;
		push @dataArea, hex($2);
	    }
	}
    }
    close FILE;
}

# now print it back out
print '## Operations - ' . $operationCount . "\n";
foreach my $op (@operations) {
    $op .= "\n";
    if($op !~ /^--/) {
	while(my ($key, $value) = each(%instLabels)) {
	    $op =~ s/(\W+)$key(\W+)/$1$value$2/g;
	}
    }
    print $op;
}
print "\n";
print '##Data Labels' . "\n";
while(my ($key, $value) = each(%dataLabels)) {
    printf("%04x - %s\n", $value, $key);
}
print "\n";
print '##Data Section - ' . (@dataArea * 4)  . ' - Data_align=32' . "\n";
#foreach my $line (@dataArea) {
for(my $i=0;$i<@dataArea;$i++) {
    printf("%04x - %08x - %032b\n", $i * 4, $dataArea[$i], $dataArea[$i]);
}
print "\n";
