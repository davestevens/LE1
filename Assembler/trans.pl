#!/usr/bin/perl

# transform the assembly to be our new design

$section = "";

while( <> )
{
    # different sections
    if(/^##\s*Operations/)
    {
	print;
	$section = "ops";
	next;
    }
    elsif(/^##\s*ImportObjects/)
    {
	print;
	$section = "impobj";
	next;
    }
    elsif(/^##\s*Import/)
    {
	print;
	$section = "imp";
	next;
    }
    elsif(/^##\s*Instruction Labels/)
    {
	print;
	$section = "inst";
	next;
    }
    elsif(/^##\s*Data Labels/)
    {
	print;
	$section = "dlabs";
	next;
	
    }
    elsif(/^##\s*Data Section/)
    {
	print;
	$section = "dsect";
	next;
    }
    elsif(/^##\s*BSS Labels/)
    {
	print;
	$section = "bss";
	next;
    }
    elsif(/^\s*\n$/)
    {
	print "\n";
    }
    else
    {
	#print $section, " TRANSFORM!\n";
	if($section eq "ops")
	{
	    # there can be operations, clocks, calls, returns, entry, FILE, ENDOFFILE, function name
	    if((/^--/) || (/^FILE:/) || (/^ENDOFFILE:/))
	    {
		print;
		$prev = "LABEL";
	    }
	    elsif(/^;;/)
	    {
		if($prev eq "CLOCK")
		{
		    print "nop.0\n";
		}
		print ";\n";
		$prev = "CLOCK";
	    }
	    elsif((/^\.(entry)/) || (/^\.(return)/) || (/^.(call)/))
	    {
		$prev = "CALL";
		$type = $1;
		if($type eq "call")
		{
		    /call\s+(\w+)/;
		    $type .= " $1";
		}
		/arg\(((\$[rbl]\d+\.\d+:\w+,?)*)\)/;
		$arg = $1;
		$arg =~ s/:[su]32//g;
		$arg =~ s/\$//g;
		/ret\(((\$[rbl]\d+\.\d+:\w+,?)*)\)/;
		$ret = $1;
		$ret =~ s/:[su]32//g;
		$ret =~ s/\$//g;
		if($type eq "entry")
		{
		    print ".", $type, " arg() ret()\n";
		}
		else
		{
		    print ".", $type, " arg(", $arg, ") ret(", $ret, ")\n";
		}
	    }
	    else
	    {
		$prev = "OP";
		/^c(\d+)\s+(\w+.?\w+)\s+(.+)/;
		$clu = $1;
		$op = $2;
		$items = $3;

		$op =~ s/\./_/g;
		
		# replace = with ,
		$items =~ s/\s=/,/;
		# remove $ in registers

		$_items = "";
		@src = split(/,?\s+/, $items);
		for($i=0;$i<=$#src;$i++)
		{
		    if($src[$i] =~ /^\$([rbl]\d+\.\d+)$/)
		    {
			$new = $1;
		    }
		    elsif($src[$i] =~ /^\(?([-~]?0x\w+)\)?$/)
		    {
			$new = $1;
		    }
		    elsif($src[$i] =~ /^\(?(-?)(\d+)\)?$/)
		    {
			$new = sprintf("%s0x%x", $1, $2);
		    }
		    elsif($src[$i] =~ /^((-?)(0x)?\w+)\[\$([rbl]\d+\.\d+)\]$/)
		    {
			if($3 eq "0x")
			{
			    $new = $4 . "[" . $2 . $1 . "]";
			}
			else
			{
			    $new = $3 . "[" . $1 . "]";
			    $new = sprintf("%s[%s0x%x]", $4, $2, $1);
			}
		    }
		    elsif($src[$i] =~ /^(\w+(\??\w+)?)$/)
		    {
			#$new = "#" . $1;
			$new = $1;
		    }
		    elsif($src[$i] =~ /^\(((\w+([\?\.]?\w+)*)\+\d+)\)$/)
		    {
			#$new = "(#" . $1 . ")";
			$new = "(" . $1 . ")";
		    }
		    elsif($src[$i] =~ /^\((\w+([\?\.]?\w+)*)(\+)(\d+)\)\[\$([rbl]\d+\.\d+)\]$/)
		    {
			$val = 0;
			if($3 eq "+")
			{
			    $val += $4;
			}
			else
			{
			    $val -= $4;
			}

			if($val >= 0)
			{
			    #$new = $5 . "[(#" . $1 . "+" . $val .")]";
			    $new = $5 . "[(" . $1 . "+" . $val .")]";
			}
			else
			{
			    #$new = $5 . "[(#" . $1 . "-" . $val .")]";
			    $new = $5 . "[(" . $1 . "-" . $val .")]";
			}
		    }
		    elsif($src[$i] =~ /^\(\((\w+([\?\.]?\w+)*)(\+)(\d+)\)(\+)(\d+)\)\[\$([rbl]\d+\.\d+)\]$/)
		    {
			$val = 0;
			if($3 eq "+")
			{
			    $val += $4;
			}
			else
			{
			    $val -= $4;
			}

			if($5 eq "+")
			{
			    $val += $6;
			}
			else
			{
			    $val -= $6;
			}
			if($val >= 0)
			{
			    #$new = $7 . "[(#" . $1 . "+" . $val .")]";
			    $new = $7 . "[(" . $1 . "+" . $val .")]";
			}
			else
			{
			    #$new = $7 . "[(#" . $1 . "-" . $val .")]";
			    $new = $7 . "[(" . $1 . "-" . $val .")]";
			}
		    }
		    elsif($src[$i] =~ /^\(\(\((\w+([\?\.]?\w+)*)(\+)(\d+)\)(\+)(\d+)\)(\+)(\d+)\)\[\$([rbl]\d+\.\d+)\]$/)
		    {
			$val = 0;
			if($3 eq "+")
			{
			    $val += $4;
			}
			else
			{
			    $val -= $4;
			}

			if($5 eq "+")
			{
			    $val += $6;
			}
			else
			{
			    $val -= $6;
			}

			if($7 eq "+")
			{
			    $val += $8
			}
			else
			{
			    $val -= $8;
			}

			if($val >= 0)
			{
			    #$new = $9 . "[(#" . $1 . "+" . $val .")]";
			    $new = $9 . "[(" . $1 . "+" . $val .")]";
			}
			else
			{
			    #$new = $9 . "[(#" . $1 . "-" . $val .")]";
			    $new = $9 . "[(" . $1 . "-" . $val .")]";
			}
		    }
		    elsif($src[$i] =~ /^\(\((\w+([\?\.]?\w+)*)(\+)(\d+)\)(\+)(\d+)\)$/)
		    {
			$val = 0;
			if($3 eq "+")
			{
			    $val += $4;
			}
			else
			{
			    $val -= $4;
			}

			if($5 eq "+")
			{
			    $val += $6;
			}
			else
			{
			    $val -= $6;
			}
			if($val >= 0)
			{
			    #$new = "(#" . $1 . "+" . $val .")";
			    $new = "(" . $1 . "+" . $val .")";
			}
			else
			{
			    #$new = "(#" . $1 . "-" . $val .")";
			    $new = "(" . $1 . "-" . $val .")";
			}
		    }
		    elsif($src[$i] =~ /^\(\(\((\w+([\?\.]?\w+)*)(\+)(\d+)\)(\+)(\d+)\)(\+)(\d+)\)$/)
		    {
			$val = 0;
			if($3 eq "+")
			{
			    $val += $4;
			}
			else
			{
			    $val -= $4;
			}

			if($5 eq "+")
			{
			    $val += $6;
			}
			else
			{
			    $val -= $6;
			}

			if($7 eq "+")
			{
			    $val += $8;
			}
			else
			{
			    $val -= $8;
			}
			
			if($val >= 0)
			{
			    #$new = "(#" . $1 . "+" . $val .")";
			    $new = "(" . $1 . "+" . $val .")";
			}
			else
			{
			    #$new = "(#" . $1 . "-" . $val .")";
			    $new = "(" . $1 . "-" . $val .")";
			}
		    }
		    else
		    {
			$new = "UNDEF";
		    }
		    #print "\t\t$src ::: $new\n";
		    $_items .= $new;

		    if($i < $#src)
		    {
			$_items .= ", ";
		    }
		}

		print $op, ".", $clu, " ", $_items, "\n";
	    }
	}
	elsif(($section eq "impobj") || ($section eq "imp"))
	{
	    print;
	}
	elsif(($section eq "inst") || ($section eq "dlabs") || ($section eq "bss"))
	{
	    print;
	}
	elsif($section eq "dsect")
	{
	    # might want to edit this into a whole data section
	    if(1)
	    {
		print;
	    }
	    else
	    {
		/\w+\s-\s(\w+)\s-\s\d+/;
		print $1;
	    }
	}
	else
	{
	    print "ERROR: $_";
	}
    }
}
