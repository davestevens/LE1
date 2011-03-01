#!/usr/bin/perl

#use strict;

#do("deps.pl");
do($ARGV[0]);

my @reqs = ("cos", "sin", "tan");
my $level = 0;
my @array;
my %includes;

#foreach my $req (@reqs)
for(my $i=0;$i<@ARGV;$i++)
{
#    recursion(reverse(@$req));
    my $temp = $ARGV[$i];
    recursion(reverse(@$temp));
}

sub recursion()
{
    $level++;
    my @load = @_;

    $includes{pop(@load)} = 1;

    while(@load) {
	my $current = pop(@load);
	$includes{$current} = 1;

	foreach my $load (@load) {
	    $array[$level] .= "$load ";
	}

	$current =~ /\w+\/(\w+)/;
	recursion(reverse(@$1));
    }
    @load = split(/\s+/, $array[$level]);
    $level--;
    return;
}

while ((my $key, my $value) = each(%includes)) {
    if($key) {
	print $key, "\n";
    }
}
