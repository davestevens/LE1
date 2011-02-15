#!/usr/bin/perl

# need to read through file and get the names of functions and where they -
# start and end

@file = <>;

# need to get the filename from the firstline!
$file[0] =~ /\# \d+ "((\w+\.)+(\w+))"/;

$filename = $1;

# this is used to see if we are currently in the func
$in_a_func = 0;
# this tells if a c style comment has been found, in this case need to look for
# the end before counting anything
$c_comment = 0;

# reads through file
&get_hash();

# need to see if there is a main! if there is it needs moving to the top ( well
# the top, where the first func is);

$first = 0;

# find out which function is first
while(($key,$value) = each(%funcs))
{
    if($key eq "main")
    {
	$main = 1;
	($main_start, $main_end) = split(/:/, $value);
    }
    
    ($start, $end) = split(/:/, $value);
    if(($start < $first) || ($first == 0))
    {
	$first = $start;
	$first_func = $key;
    }
}

print "First function = $first_func: at line $first\n";
if(($first_func ne "main") && ($main == 1))
{

# this means the the original .c file need opening up and moving around!!!!
    
# will need to find out which functions are above main and then get their defin
# itions to put them below main
    while(($key,$value) = each(%funcs))
    {
	($start, $end) = split(/:/, $value);
	if($start < $main_start)
	{
	    $needs_moving{$key} = 1;
	    print "NEEDS MOVING!\n";
	    print "$key, $value\n";
	}
    }

# need to open original c file and get the sane data from that
    open FILE, "< $filename" or die "Could not open file ($filename) : $!\n";
    @file = <FILE>;
    close FILE;

# make a copy of the file you are editing so you can go back to it.
    system("cp $filename $filename.bak");
    
    &get_hash();

    while(($key,$value) = each(%funcs))
    {
	if($key eq "main")
	{
	    $main = 1;
	    ($main_start, $main_end) = split(/:/, $value);
	}

	($start, $end) = split(/:/, $value);
	if(($start < $first) || ($first == 0))
	{
	    $first = $start;
	    $first_func = $key;
	}
    }
    
    print "This needs moving!!!\n";
    ($main_start, $main_end) = split(/:/, $funcs{main});
    print "$main_start $main_end\n";
    open FILE, "> $filename" or die 
	"Could not open file ($filename) : $!\n";
    for($i=0;$i<($first-1);$i++)
    {
	print FILE $file[$i];
    }

# need to input all the definitions of the functions which have been moved 
# below main.
    while(($key,$value) = each(%needs_moving))
    {
	if($value == 1)
	{
	    # need to get the line number and copy that line, and the rest of 
	    # the lines until the end of the )
	    ($start_line, $end_line) = split(/:/, $funcs{$key});
	    $count_1 = 0;
	    $found_any = 0;
	    do{
		@test = split(//, $file[($start_line - 1)]);
		
		foreach $test (@test)
		{
		    if($test eq "(")
		    {
			$count_1++;
			$found_any = 1;
		    }
		    elsif($test eq ")")
		    {
			$count_1--;
			$found_any = 1;
		    }
		}
		if($count_1 == 0)
		{
		    chomp($file[($start_line-1)]);
		}
		print FILE "$file[($start_line-1)]";
		if($count_1 == 0)
		{
		    print FILE ";\n\n";
		    $file[($start_line-1)] .= "\n";
		}
		$start_line++;
	    }while(($count_1 != 0) && ($found_any != 0));
	    
	}
    }
    
    # need to then pop main in.
    for($i=($main_start-1);$i<=$main_end;$i++)
    {
	print FILE $file[$i];
    }
    
    # then the rest of the file excluding the main
    for($i=($first-1);$i<=$#file;$i++)
    {
	if($i == ($main_start-1))
	{
	    $i = $main_end;
	}
	print FILE $file[$i];
    }
    
    close FILE;
}
elsif($first_func eq "main")
{
    print "This is fine :) main is at the top!\n";
}
elsif($main == 0)
{
    print "There is no main function in the file :)\n";
}
else
{
    print "There has been a problem :(\n";
}


# this will read in file and get the start and endlines of the functions there;
sub get_hash()
{
    for($i=0;$i<=$#file;$i++)
    {
	#chomp($file[$i]);
	# this looks for start of functions and then either the next line being
        # either an { or there being a { at the end
	if(($file[$i] =~ /^\s*((\w+\s+)+)?(\w+)\s*\(/) || 
	   (($file[$i+1] =~ /^\s*\(/) && 
	    ($file[$i] =~ /^\s*((\w+\s+)+)?(\w+)/)))
	{
	    #print "$1 : $2: $3\n";
	    #next;
	    if($2 eq "")
	    {
		# this means the function starts the line above
		$line_start_offset = -1;
	    }
	    $function_name = $3;
	    # there were some else  if (blah) being picked up
	    if(($function_name eq "if") || 
	       ($function_name eq "__attribute__"))
	    {
		next;
	    }
	    #print "$function_name\n";
	    if($file[$i] =~ /\{/)
	    {
		$in_a_func = 1;
		$line_start = $i+1 + $line_start_offset;
		$count = 1;
	    }
	    else
	    {
		if($file[$i+1] =~ /^\s*\n/)
		{
		    while($file[$i+1] =~ /^\s*\n/)
		    {
			$i++;
			$num_of_incs++;
		    }
		}
		else
		{
		    #print "SHOULD BE LOOKING HERE!\n";
		    ## need to look for defs on more than one line
		    $count_1 = 0;
		    $found_any = 0;
		    $not_a_func = 0;
		    do{
			@test = split(//, $file[$i]);
			
			foreach $test (@test)
			{
			    if($test eq "(")
			    {
				$count_1++;
				$found_any = 1;
				#print "FOUND ONE\n";
			    }
			    elsif($test eq ")")
			    {
				$count_1--;
				$found_any = 1;
				#print "FOUND ONE\n";
			    }
			    elsif($test eq ";")
			    {
				$not_a_func = 1;
			    }
			}
			$i++;
			$num_of_incs++;
		    }while(($count_1 != 0) && ($found_any != 0));
		    $i--;
		}
		
		if((($file[$i+$num_of_incs+2] =~ /^\s*\{/) || 
		   ($file[$i+1] =~ /^\s*\{/)) &&
		   ($not_a_func == 0))
		{
		    $in_a_func = 1;
		    $line_start = $i-($num_of_incs-2) 
			+ $line_start_offset;
		}
	    }
	    
	    if($in_a_func == 1)
	    {
print "Function ($function_name) starting at line: $line_start\n";
		## from here, need to go through and count up the 
		## number of { and } until they are zero and that means
		## its the end of the function
		do
		{
		    $i++;
		    # need to split the line at comments
		    if($c_comment == 0)
		    {
			($line, $comment) = 
			    split(/\/\//, $file[$i]);
			#print "$line\n";
			@line = split(//, $line);
			for($j=0;$j<=$#line;$j++)
			{
			    if(($line[$j] eq "{") && 
			       ($c_comment == 0))
			    {
				$count++;
			    }
			    elsif(($line[$j] eq "}") && 
				  ($c_comment == 0))
			    {
				$count--;
			    }
			    elsif(($line[$j] eq "/") && 
				  ($line[$j+1] eq "*"))
			    {
				$c_comment = 1;
			    }
			    elsif(($line[$j] eq "*") && 
				  ($line[$j+1] eq "/"))
			    {
				$c_comment = 0;
			    }
			}
		    }
		    else
		    {
			# need to check for */
			@line = split(//, $file[$i]);
			for($j=0;$j<=$#line;$j++)
			{
			    if(($line[$j] eq "*") && 
			       ($line[$j+1] eq "/"))
			    {
				$c_comment = 0;
			    }
			}
		    }
		}while($count != 0);
		# this means that you're at the end of the function
		$line_end = $i+1;
print "Found the end of the function ($function_name) at line: $line_end\n";
		$funcs{$function_name} = "$line_start:$line_end";
	    }
	    $in_a_func = 0;
	    $num_of_incs = 0;
	    $line_start_offset = 0;
	}
    }
}
