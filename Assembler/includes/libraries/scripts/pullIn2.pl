#!/usr/bin/perl


my %deps;
my $level = 0;
my @lev;

#do("deps.pl");
do($ARGV[0]);

#foreach my $arg (@ARGV) {
for(my $i=1;$i<=@ARGV;$i++) {
#    print "$ARGV[$i]\n";
    my $temp = $ARGV[$i];
#    print "@$temp\n";
    getMore(@$temp);
}

while (($key, $value) = each(%deps)) {
    if($key) {
	print $key, "\n";
    }
}

sub getMore()
{
    $level++;
    my @load = @_;
    $deps{$load[0]} = 1;
    for(my $i=1;$i<@load;$i++) {
#	print "\t" x $level;
#	print "[$level] $load[$i]\n";
	$deps{$load[$i]} = 1;
	$load[$i] =~ /\w+\/(\w+)/;
	if(@$1 > 1) {
	    my $temp;
	    for(my $j=$i+1;$j<@load;$j++) {
		$temp .= "$load[$j] ";
	    }
	    $lev[$level] = $temp;
#	    print "\t" x $level;
#	    print "[$level] $temp\n";
	    getMore(@$1);
#	    print "\t" x $level;

	}
	else
	{
#	    print "\t" x $level;
#	    print "[$level] </Romeo Done>\n";
	}
    }
    $level--;
#	    print "[$level] $lev[$level]\n";

    return;
}

#sub getMore()
#{
#    #push @UNdeps, $_[0];
#    print "FUUU: $_[0]\n";
#    $deps{$_[0]} = 1;
#    for($i=1;$i<@_;$i++) {
#	print "$_[$i]\n";
#	$deps{$_[$i]} = 1;
#	$_[$i] =~ /\w+\/(\w+)/;
#	if(@$1 > 1) {
#	    getMore(@$1);
#	}
#    }
#    return;
#}
