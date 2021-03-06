#!/usr/bin/perl
# hacks for the C code generated by FalconML-3.0.2784
use strict;

do('filepaths.pl');
my $vex_flags = ' -c ';
my @cfiles = <*.c>;
my @file;

# little hack around the forward declaration of variables in falconml generated code

foreach (@cfiles) {
again:
    print $_, "\n";
    my $command = $ARGV[0] . ' ' . $_ . $vex_flags . '2>&1';
    #print $command . "\n";
    my @ret = readpipe($command);
    if(checkReturn(@ret) > 0) {
	print "\t" . 'Forward declaration issue' . "\n";
	fixFile($_);
	printFile($_);
	goto again;
    }
    # remove assert()
    removeAssert($_);
    # remove opearator_delete()
    removeOperatorDelete($_);
    my $ofile = $_;
    $ofile =~ s/\.c$/\.o/;
    system('rm -f ' . $ofile);
}

exit(0);

sub removeOperatorDelete {
    open FILE, "<", $_[0] or die $!;
    @file = <FILE>;
    close FILE;
    for(my $i=0;$i<@file;$i++) {
	if($file[$i] =~ /operator_delete\(/) {
	    print "\t" . 'Removing *_operator_delete: ' . $file[$i];
	    chomp($file[$i]);
	    $file[$i] =~ s/operator_delete/0perator_delete/;
	    $file[$i] = '/*' . $file[$i] . '*/' . "\n";
	}
    }
    printFile($_[0]);
}

sub removeAssert {
    open FILE, "<", $_[0] or die $!;
    @file = <FILE>;
    close FILE;
    for(my $i=0;$i<@file;$i++) {
	if($file[$i] =~ /assert\(/) {
	    print "\t" . 'Removing assert: ' . $file[$i];
	    chomp($file[$i]);
	    $file[$i] =~ s/assert/a\$\$ert/;
	    $file[$i] = '/*' . $file[$i] . '*/' . "\n";
	}
    }
    printFile($_[0]);
}

sub printFile {
    #system('mv ' . $_[0] . ' ' . $_[0] . '.bak');
    open FILE, ">", $_[0] or die $!;
    foreach (@file) {
	print FILE $_;
    }
    close FILE;
}

sub fixFile {
    open FILE, "<", $_[0] or die $!;
    @file = <FILE>;
    close FILE;
    my $i;
    my $end = -1;
    my $start = -1;
    for($i = @file;$i >= 0;$i--) {
	if($file[$i] =~ /^};\n$/) {
	    $end = $i;
	}
	if($file[$i] =~ /(.+_vtable)\s+=\s+{\n$/) {
	    $start = $i;
	    #print $start . ' -> ' . $end . "\n";
	    my @section;
	    for(my $j=0;$j<=($end-$start);$j++) {
		push(@section, splice(@file, $start, 1));
	    }
	    #print @section;
	    # then need to find in the file
	    #print $1 . "\n";
	    my $line = findLine($1);
	    #print $line . "\n";
	    # need to replace that line with @section
	    splice(@file, $line, 1); # remove line
	    splice(@file, $line, 0, @section); # add section
	    return;
	}
    }
}

# find in file tie line passed
sub findLine {
    my $i;
    for($i=0;$i<@file;$i++) {
	if($file[$i] =~ /$_[0];\n$/) {
	    return $i;
	}
    }
}

# look in the return for the string 'initializer element is not constant'
sub checkReturn {
    foreach (@_) {
	if(/warn: \[fix_align\] bogus data align/) {
	    return 1;
	}
    }
    return 0;
}
