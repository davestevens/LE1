#!/usr/bin/perl


# TODO: replace with readelf -wi
#open FILE, "< debug_info" or die;
#@debug  = <FILE>;
#close FILE;

@debug = readpipe("readelf -wi $ARGV[0]");
@symtab = readpipe("readelf -s $ARGV[0]");

# get all info from debug
for($i=0;$i<$#debug;$i++)
{
    if($debug[$i] =~ /\(DW_TAG_variable\)/)
    {
# variable name
	do {
	    $i++;
	    if($debug[$i] =~ /DW_AT_name/)
	    {
		$debug[$i] =~ /(\w+)\s*\n$/;
		$name = $1;
	    }
	    if($debug[$i] =~ /DW_AT_type/)
	    {
		$debug[$i] =~ /<0x(\w+)>\s*\n$/;
		$var{$name} = hex($1);
	    }
	} while(($debug[$i+1] !~ /^ </) && ($i < $#debug));
    }
    if($debug[$i] =~ /\(DW_TAG_base_type\)/)
    {
	$debug[$i] =~ /<\w+><(\w+)>:/;
	$num = hex($1);
# basic types
	do {
	    $i++;
	    if($debug[$i] =~ /DW_AT_name/)
	    {
		$debug[$i] =~ /((\w+\s?)+)\s*\n$/;
		$name = $1;
		$name =~ s/\s*$//g;
		$basic{$num} = $name;
	    }
	} while(($debug[$i+1] !~ /^ </) && ($i < $#debug));
    }
    if($debug[$i] =~ /\(DW_TAG_typedef\)/)
    {
	$debug[$i] =~ /<\w+><(\w+)>:/;
	$num = hex($1);
# typedef
	do {
	    $i++;
	    if($debug[$i] =~ /DW_AT_name/)
	    {
		$debug[$i] =~ /((\w+\s?)+)\s*\n$/;
		$name = $1;
		$name =~ s/\s*$//g;
		$typedef{$num} = $name;
	    }
	    if($debug[$i] =~ /DW_AT_type/)
	    {
		$debug[$i] =~ /<0x(\w+)/;
		$name = hex($1);
		$typedef{$num} .= "(" . $basic{$name} .")";
	    }
	} while(($debug[$i+1] !~ /^ </) && ($i < $#debug));
    }
    if($debug[$i] =~ /\(DW_TAG_array_type\)/)
    {
	$debug[$i] =~ /<\w+><(\w+)>:/;
	$num = hex($1);
# array type
	do {
	    $i++;
	    if($debug[$i] =~ /DW_AT_type/)
	    {
		$debug[$i] =~ /<0x(\w+)>/;
		$type = hex($1);
		$array{$num} = $type;
	    }
	} while(($debug[$i+1] !~ /^ </) && ($i < $#debug));
    }
    if($debug[$i] =~ /\(DW_TAG_const_type\)/)
    {
	$debug[$i] =~ /<\w+><(\w+)>:/;
	$num = hex($1);
# const type
	do {
	    $i++;
	    if($debug[$i] =~ /DW_AT_type/)
	    {
		$debug[$i] =~ /<0x(\w+)>/;
		$type = hex($1);
		$special{$num} = $type;
	    }
	} while(($debug[$i+1] !~ /^ </) && ($i < $#debug));
    }
    if($debug[$i] =~ /\(DW_TAG_pointer_type\)/)
    {
	$debug[$i] =~ /<\w+><(\w+)>:/;
	$num = hex($1);
# pointer type
	do {
	    $i++;
	    if($debug[$i] =~ /DW_AT_type/)
	    {
		$debug[$i] =~ /<0x(\w+)>/;
		$type = hex($1);
		$point{$num} = $type;
	    }
	} while(($debug[$i+1] !~ /^ </) && ($i < $#debug));
    }
    if($debug[$i] =~ /\(DW_TAG_volatile_type\)/)
    {
	$debug[$i] =~ /<\w+><(\w+)>:/;
	$num = hex($1);
# volatile type
	do {
	    $i++;
	    if($debug[$i] =~ /DW_AT_type/)
	    {
		$debug[$i] =~ /<0x(\w+)>/;
		$type = hex($1);
		$special{$num} = $type;
	    }
	} while(($debug[$i+1] !~ /^ </) && ($i < $#debug));
    }
}

# get all info from symtab
for($i=0;$i<$#symtab;$i++)
{
    if($symtab[$i] =~ /OBJECT\s+GLOBAL/)
    {
	chomp($symtab[$i]);
	@symbols = split(/\s+/, $symtab[$i]);
#	print $symbols[8], " -> ", $symbols[3], "\n";
	$syms{$symbols[8]} = $symbols[3];
    }
}

# get the data from the datalabels file
open FILE, "< $ARGV[1]" or die;
while(<FILE>)
{
    chomp();
    ($label, $addr) = split(/\s+/);
    $le1{$label} = $addr;
}
close FILE;

$vaj_file = $ARGV[1];
$vaj_file =~ s/datalabels/vajazzle.c/g;

open VAJAZZLE, "> $vaj_file" or die;

print VAJAZZLE "#include \"vajazzle.h\"\n";

foreach $key (%le1)
{
    if($le1{$key} ne "")
    {
	print VAJAZZLE "extern void *_vajazzle_$key;\n";
    }
}

print VAJAZZLE "\n\n";
print VAJAZZLE "void setupMem(void)\n";
print VAJAZZLE "{\n";

foreach $key (%le1)
{
    if($le1{$key} ne "")
    {
	if($basic{$var{$key}} ne "")
	{
	    print VAJAZZLE "\tpush(", $le1{$key}, ", (void *)&_vajazzle_", $key ,", ", &printBasicType($basic{$var{$key}}), ", \"", $key , "\", ", ($syms{$key} / &getSize($basic{$var{$key}})), ", 0);\n";
	}
	elsif($typedef{$var{$key}} ne "")
	{
#	    print "$typedef{$var{$key}} $key;\n";
	}
	elsif($basic{$special{$var{$key}}} ne "")
	{
	    print VAJAZZLE "\tpush(", $le1{$key}, ", (void *)&_vajazzle_", $key ,", ", &printBasicType($basic{$special{$var{$key}}}), ", \"", $key , "\", ", ($syms{$key} / &getSize($basic{$special{$var{$key}}})), ", 0);\n";
	}
	elsif($typedef{$special{$var{$key}}} ne "")
	{
#	    print "(special) $typedef{$special{$var{$key}}} $key;\n";
	}

	elsif($basic{$array{$var{$key}}} ne "")
	{
	    print VAJAZZLE "\tpush(", $le1{$key}, ", (void *)&_vajazzle_", $key ,", ", &printBasicType($basic{$array{$var{$key}}}), ", \"", $key , "\", ", ($syms{$key} / &getSize($basic{$array{$var{$key}}})), ", 0);\n";
	}
	elsif($typedef{$array{$var{$key}}} ne "")
	{
#	    print "$typedef{$array{$var{$key}}} $key;(ARRAY)\n";
	}
	elsif($basic{$array{$special{$var{$key}}}} ne "")
	{
	    print VAJAZZLE "\tpush(", $le1{$key}, ", (void *)&_vajazzle_", $key ,", ", &printBasicType($basic{$array{$special{$var{$key}}}}), ", \"", $key , "\", ", ($syms{$key} / &getSize($basic{$array{$special{$var{$key}}}})), ", 0);\n";
	}
	elsif($typedef{$array{$special{$var{$key}}}} ne "")
	{
#	    print "(special) $typedef{$array{$special{$var{$key}}}} $key;(ARRAY)\n";
	}

	elsif($basic{$point{$var{$key}}} ne "")
	{
	    print VAJAZZLE "\tpush(", $le1{$key}, ", (void *)&_vajazzle_", $key ,", ", &printBasicType($basic{$point{$var{$key}}}), ", \"", $key , "\", ", ($syms{$key} / 4), ", 1);\n";
	}
	elsif($typdef{$point{$var{$key}}} ne "")
	{
#	    print "*$typedef{$point{$var{$key}}} $key;\n";
	}
	elsif($basic{$special{$point{$var{$key}}}} ne "")
	{
	    print VAJAZZLE "\tpush(", $le1{$key}, ", (void *)&_vajazzle_", $key ,", ", &printBasicType($basic{$special{$point{$var{$key}}}}), ", \"", $key , "\", ", ($syms{$key} / 4), ");\n";
	}
	elsif($typdef{$special{$point{$var{$key}}}} ne "")
	{
#	    print "(special) *$typedef{$special{$point{$var{$key}}}} $key;\n";
	}

	elsif($basic{$point{$array{$var{$key}}}} ne "")
	{
	    print VAJAZZLE "\tpush(", $le1{$key}, ", (void *)&_vajazzle_", $key ,", ", &printBasicType($basic{$point{$array{$var{$key}}}}), ", \"", $key , "\", ", ($syms{$key} / 4), ", 1);\n";
	}
	elsif($typdef{$point{$array{$var{$key}}}} ne "")
	{
#	    print "*$typedef{$point{$array{$var{$key}}}} $key;(ARRAY)\n";
	}
	elsif($basic{$special{$point{$array{$var{$key}}}}} ne "")
	{
	    print VAJAZZLE "\tpush(", $le1{$key}, ", (void *)&_vajazzle_", $key ,", ", &printBasicType($basic{$special{$point{$array{$var{$key}}}}}), ", \"", $key , "\", ", ($syms{$key} / 4), ", 1);\n";
	}
	elsif($typdef{$special{$point{$array{$var{$key}}}}} ne "")
	{
#	    print "(special) *$typedef{$special{$point{$array{$var{$key}}}}} $key;(ARRAY)\n";
	}

	else
	{
	    print VAJAZZLE "UNKNOWN\n";
	}
    }
}

print VAJAZZLE "}\n";


sub getSize()
{
    if($_[0] =~ /(unsigned)?\s*short(\s+int)?/)
    {
	return 2;
    }
    elsif($_[0] =~ /(unsigned)?\s*int/)
    {
	return 4;
    }
    elsif($_[0] =~ /(unsigned)?\s*char/)
    {
	return 1;
    }
    elsif($_[0] =~ /(unsigned)?\s*long\s+long/)
    {
	return 8;
    }
    elsif($_[0] =~ /(unsigned)?\s*long/)
    {
	return 4;
    }
}

sub printBasicType()
{
    if($_[0] =~ /(unsigned)?\s*short(\s+int)?/)
    {
	return "shortT";
    }
    elsif($_[0] =~ /(unsigned)?\s*int/)
    {
	return "intT";
    }
    elsif($_[0] =~ /(unsigned)?\s*char/)
    {
	return "charT";
    }
    elsif($_[0] =~ /(unsigned)?\s*long\s+long/)
    {
	return "longlongT";
    }
    elsif($_[0] =~ /(unsigned)?\s*long/)
    {
	return "longT";
    }
}
