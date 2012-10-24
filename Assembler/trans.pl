#!/usr/bin/perl

# transform current assembly into new design, takes from stdin outputs to stdout
# 09/03/12
# Dave Stevens

use strict;

my $section = '';
my $prev = '';
my %supportedSYSCALLS;
my $inFile = '';

foreach my $arg (@ARGV) {
    if($arg =~ /-syscall=(.+)/) {
	&populateSyscalls($1);
    }
    else {
	$inFile = $arg;
    }
}

open FILE, "< $inFile" or die;
my $entry;
while( <FILE> ) {
    # different sections
    if(/^##\s*Operations/) {
	print;
	$section = 'ops';
	next;
    }
    elsif(/^##\s*ImportObjects/) {
	print;
	$section = 'impobj';
	next;
    }
    elsif(/^##\s*Import/) {
	print;
	$section = 'imp';
	next;
    }
    elsif(/^##\s*Instruction Labels/) {
	print;
	$section = 'inst';
	next;
    }
    elsif(/^##\s*Data Labels/) {
	print;
	$section = 'dlabs';
	next;

    }
    elsif(/^##\s*Data Section/) {
	print;
	$section = 'dsect';
	next;
    }
    elsif(/^##\s*BSS Labels/) {
	print;
	$section = 'bss';
	next;
    }
    elsif(/^\s*\n$/) {
	print "\n";
    }
    else {
	# within a section
	if($section eq 'ops') {
	    # there can be operations, clocks, calls, returns, entry, FILE, ENDOFFILE, function name
	    if((/^--/) || (/^FILE:/) || (/^ENDOFFILE:/)) {
		print;
		$prev = 'LABEL';
	    }
	    elsif(/^;;/) {
		print ';' . "\n";
	    }
	    elsif((/^\.(entry)/) || (/^\.(return)/) || (/^.(call)/)) {
		$prev = 'CALL';
		my $type = $1;
		if($type eq 'call') {
		    /call\s+(\w+)/;
		    $type .= ' ' . $1;
		}
		/arg\(((\$[rbl]\d+\.\d+:\w+,?)*)\)/;
		my $arg = $1;
		$arg =~ s/:[su]32//g;
		$arg =~ s/\$//g;
		/ret\(((\$[rbl]\d+\.\d+:\w+,?)*)\)/;
		my $ret = $1;
		$ret =~ s/:[su]32//g;
		$ret =~ s/\$//g;
		if($type eq 'entry') {
		    print '.' . $type . ' arg(' . $arg . ') ret()' . "\n";
		}
		else {
		    print '.' . $type . ' arg(' . $arg . ') ret(' . $ret . ')' . "\n";
		}
	    }
	    else {
		$prev = 'OP';
		/^c(\d+)\s+(\w+.?\w+)\s+(.+)/;
		my $clu = $1;
		my $op = $2;
		my $items = $3;
		my $asmNum = 0;
		my $asmASS = '';

		$op =~ s/\./_/g;

# catch ASM instructions here.
		if($op =~ /asm,(\d+)/) {
		    $op = 'asm';
		    $asmNum = $1;

		    my @src = split(/,?\s+/, $items);
		    my $left = 0;
		    my $right = -1;
		    for(my $i=0;$i<=$#src;$i++) {
			if($src[$i] eq "=") {
			    $right = 0;
			}
			else {
			    if($right >= 0) {
				$right++;
			    }
			    else {
				$left++;
			    }
			}
		    }
		    $asmASS = $left . "X" . $right;
		}
# catch STDIO which is suported
		if($op =~ /call/i) {
		    $items =~ /FUNC\_(\w+)/;
		    if(defined($supportedSYSCALLS{$1})) {
			print 'syscall.0 ' . $supportedSYSCALLS{$1} . "\n";
			next;
		    }
		}

		# replace = with ,
		$items =~ s/\s=/,/;
		# remove $ in registers

		my $_items = "";
		my $new = '';
		my @src = split(/,?\s+/, $items);
		for(my $i=0;$i<=$#src;$i++)
		{
		    if($src[$i] =~ /^\$([rbl]\d+\.\d+)$/) {
			$new = $1;
		    }
		    elsif($src[$i] =~ /^\(?([-~]?0x\w+)\)?$/) {
			$new = $1;
		    }
		    elsif($src[$i] =~ /^\(?(-?)(\d+)\)?$/) {
			$new = sprintf("%s0x%x", $1, $2);
		    }
		    elsif($src[$i] =~ /^((-?)(0x)?\w+)\[\$([rbl]\d+\.\d+)\]$/) {
			if($3 eq '0x') {
			    $new = $4 . '[' . $2 . $1 . ']';
			}
			else {
			    $new = $3 . '[' . $1 . ']';
			    $new = sprintf("%s[%s0x%x]", $4, $2, $1);
			}
		    }
		    elsif($src[$i] =~ /^\(([~-]?0x\w+)\)\[\$([rbl]\d+\.\d+)\]$/) {
			$new = $2 . '[' . $1 . ']';
		    }
		    elsif($src[$i] =~ /^(\w+([\?\.]?\w+)?)$/) {
			$new = $1;
		    }
		    elsif($src[$i] =~ /^\(((\w+([\?\.]?\w+)*)\+\d+)\)$/) {
			$new = '(' . $1 . ')';
		    }
		    elsif($src[$i] =~ /^\((\w+([\?\.]?\w+)*)(\+)(\d+)\)\[\$([rbl]\d+\.\d+)\]$/) {
			my $val = 0;
			$val += ($3 eq '+') ? ($4) : (-$4);

			$new = $5 . '[(' . $1;
			$new .= ($val >= 0) ? '+' : '-';
			$new .= $val . ')]';
		    }
		    elsif($src[$i] =~ /^\(\((\w+([\?\.]?\w+)*)(\+)(\d+)\)(\+)(\d+)\)\[\$([rbl]\d+\.\d+)\]$/) {
			my $val = 0;
			$val += ($3 eq '+') ? ($4) : (-$4);
			$val += ($5 eq '+') ? ($6) : (-$6);

			$new = $7 . '[(' . $1;
			$new .= ($val >= 0) ? '+' : '-';
			$new .= $val . ')]';
		    }
		    elsif($src[$i] =~ /^\(\(\((\w+([\?\.]?\w+)*)(\+)(\d+)\)(\+)(\d+)\)(\+)(\d+)\)\[\$([rbl]\d+\.\d+)\]$/) {
			my $val = 0;
			$val += ($3 eq '+') ? ($4) : (-$4);
			$val += ($5 eq '+') ? ($6) : (-$6);
			$val += ($7 eq '+') ? ($8) : (-$8);

			$new = $9 . '[(' . $1;
			$new .= ($val >= 0) ? '+' : '-';
			$new .= $val . ')]';
		    }
		    elsif($src[$i] =~ /^\(\((\w+([\?\.]?\w+)*)(\+)(\d+)\)([+-])(\d+)\)$/) {
			my $val = 0;
			$val += ($3 eq '+') ? ($4) : (-$4);
			$val += ($5 eq '+') ? ($6) : (-$6);

			$new = '(' . $1 . '+' . $val . ')';
		    }
		    elsif($src[$i] =~ /^\(\(\((\w+([\?\.]?\w+)*)(\+)(\d+)\)(\+)(\d+)\)(\+)(\d+)\)$/) {
			my $val = 0;
			$val += ($3 eq '+') ? ($4) : (-$4);
			$val += ($5 eq '+') ? ($6) : (-$6);
			$val += ($7 eq '+') ? ($8) : (-$8);

			$new = '(' . $1;
			$new .= ($val >= 0) ? '+' : '-';
			$new .= $val . ')';
		    }
		    elsif($src[$i] =~ /^\(\(((\w+([\?\.]?\w+)*)([+-])(\d+))\)([+-])\(([-~]?)0x(\w+)\)\)$/) {
			my $val = 0;
			$val += ($4 eq '+') ? ($5) : (-$5);

			my $dec = hex($8);
			if($7 eq "~") {
			    $dec = ($dec+1) * -1;
			}
			$val += ($6 eq '+') ? ($dec) : (-$dec);

			$new = sprintf("(%s+%d)", $2, $val);
		    }
		    elsif($src[$i] =~ /^\(\(((\w+([\?\.]?\w+)*)([+-])(\d+))\)([+-])\(([-~]?)0x(\w+)\)\)\[\$([rbl]\d+\.\d+)\]$/) {
			my $val = 0;
			$val += ($4 eq '+') ? ($5) : (-$5);

			my $dec = hex($8);
			if($7 eq "~") {
			    $dec = ($dec+1) * -1;
			}
                        $val += ($6 eq '+') ? ($dec) : (-$dec);

			$new = $9 . '[(' . $2;
			#$new .= ($val >= 0) ? '+' : '-';
			$new .= '+';
			$new .= $val . ')]';
		    }
		    else {
			$new = 'UNDEF';
		    }

		    $_items .= $new;

		    if($i < $#src) {
			$_items .= ', ';
		    }
		}

		if($op eq 'asm') {
		    printf("%s.%d 0x%x %s %s\n", $op, $clu, $asmNum, $asmASS, $_items);
		}
		else {
		    print $op . '.' . $clu . ' ' . $_items . "\n";
		}
	    }
	}
	elsif(($section eq 'impobj') || ($section eq 'imp')) {
	    print;
	}
	elsif(($section eq 'inst') || ($section eq 'dlabs') || ($section eq 'bss')) {
	    print;
	}
	elsif($section eq 'dsect') {
	    # might want to edit this into a whole data section
	    if(1) {
		print;
	    }
	    else {
		/\w+\s-\s(\w+)\s-\s\d+/;
		print $1;
	    }
	}
	else {
	    print 'ERROR: ' . $_ . "\n";
	}
    }
}

close FILE;

exit(0);

sub populateSyscalls {
    open SYSCALL, "< $_[0]" or die "Could not open file: $_[0] ($!)\n";
    while(<SYSCALL>) {
	chomp();
	if(/#define\s+(\w+)\s+(\d+)/) {
	    $supportedSYSCALLS{lc($1)} = $2;
	}
    }
    close SYSCALL;
}
