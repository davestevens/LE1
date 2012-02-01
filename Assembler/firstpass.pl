#!/usr/bin/perl

###############################################################################
#                               LE1 Tool-Chain                                #
#                           Assembler/firstpass.pl                            #
#                           Dave Stevens - A767169                            #
#                          Loughborough University                            #
#                              D.Stevens.ac.uk                                #
###############################################################################
if ($ARGV[0] eq "")
{
    print<<ERROR;
    First Pass Failed
	You have not entered a file to convert!
	Please call this script with a switch of the filename you wish to convert
	eg. perl firstpass.pl <filename>
ERROR
	exit(0);
}
else
{
    $stack_size = 0;
    $output_file = "";
    foreach $arg (@ARGV)
    {
	if($arg =~ /-s=0x(\w+)/)
	{
	    $stack_size = hex($1);
	}
	elsif($arg =~ /-o(.+)/)
	{
	    $output_file = $1;
	}
	else
	{
	    $input_file = $arg;
	}
    }
    if(-e $input_file)
    {
	if($output_file eq "")
	{
	    @fil = split(/\//, $input_file);
	    $fil[$#fil] =~ s/\.s$//;
	    mkdir $fil[$#fil];
	    $output_file = "$fil[$#fil]/$fil[$#fil].temp.s";
	}
	&first_pass($input_file);
 	&check_calls();
	&check_returns();
	&print_output($output_file);
	print "First Pass Completed
$output_file contains data needed for second pass\n";
	exit(0);
    }
    else
    {
	print "Error: First Pass Failed\nFile does not exist ($input_file)\n";
	exit(0);
    }
}
sub first_pass()
{
    open INPUT, "< @_[0]" or die
	"Error: First Pass Failed\nCould not open file (@_[0]): $!\n";
    @file = <INPUT>;
    close INPUT;

    $data_start = 0;
    $instruction_start = 0;
    $bss_start = 0;
    $tot = 0;
    $tot_bss = 0;
    for($i=0;$i<=$#file;$i++)
    {
	chomp($file[$i]);
	if($file[$i] =~ /\.section \.(\w+)/)
	{
	    $i++;
	    if($1 eq "data")
	    {
		while($file[$i] !~ /\.section/)
		{
		    if($file[$i] =~ /\#\# Begin (\w+\s*)+\n/)
		    {
			$functions{"FUNC_$1"} = $#Instructions + 1;
			$current = $1;
			if($current =~ /main$/)
			{
			    $where_we_were = $i;
			    while($file[$i] !~ /\s*\#\# End/)
			    {
				if($file[$i] =~ /c0\s+return/)
				{
				    ($data, $comment) = split(/##/, $file[$i]);
				    $file[$i] = "c0    call \$l0.0 = exit ## $comment";
				    splice(@file,$i,0,"\.call exit, caller, arg(\$r0.3:s32), ret(\$r0.3:s32)");
				    $i++;
				}
				$i++;
			    }
			    $i = $where_we_were;
			}
		    }
		    if($file[$i] =~ /\.align (\d+)/)
		    {
			$data_align = $1;
		    }
		    elsif($file[$i] =~ /:+$/)
		    {
			chomp($file[$i]);
			$file[$i] =~ s/:+//;
			if($file[$i] =~ /PACKET/)
			{
			    $file[$i] = $fil[$#fil] . $file[$i];
			}
			$Data_Label{$file[$i]} = $data_start;
		    }
		    elsif($file[$i] =~ /\.data(\d+) -?\d+:(\d+)/)
		    {
			#print $file[$i];
			$size = $1;
			$num = $2;
			#print "HERE IS THIS: $file[$i]\n";
			#print "size: $size\n";
			#print "num: $num\n";
			# need to fill with zeros
			#$tot = &check_total($tot);
			if($size == 4)
			{
			    for($padding=0;$padding<$num;$padding++)
			    {
				$data_line = "00000000";
				$tot += $size;
				#print $data_line, "\n";
				#print "need to pad here: $padding ($tot)\n";
				$tot = &check_total($tot);
			    }
			}
			elsif($size == 2)
			{
			    for($padding=0;$padding<$num;$padding++)
			    {
				$tot = &check_total($tot);
				$data_line .= "0000";
				$tot += $size;
				$tot = &check_total($tot);
			    }
			}
			elsif($size == 1)
			{
			    for($padding=0;$padding<$num;$padding++)
			    {
				$tot = &check_total($tot);
				$data_line .= "00";
				$tot += $size;
				$tot = &check_total($tot);
			    }
			}
			else
			{
			    print "ERROR: unknown data section: $file[$i]";
			}
		    }
		    elsif($file[$i] =~ /\.data(\d+) (-?\d+)/)
		    {
			$size = $1;
			if(($2 < 0) && ($size == 4))
			{
			    $max = 4294967296;
			    $val = $max + $2;
			}
			elsif(($2 < 0) && ($size == 2))
			{
			    $max = 65536;
			    $val = $max + $2;
			}
			elsif(($2 < 0) && ($size == 1))
			{
			    $max = 256;
			    $val = $max + $2;
			}
			else
			{
			    $val = $2;
			}
                        $tot = &check_total($tot);
                        if($size == 1)
			{
			    $stripped = sprintf("%08x", $val);
			    $data_line .= substr($stripped, 6);
			}
                        elsif($size == 2)
			{
			    $inter = sprintf("%04x", $val);
			    if(length($inter) != 4)
			    {
				print "Error: First pass failed\nTried to input a larger than 32 bit value\n";
				exit(0);
			    }
			    if(length($inter) > 4)
			    {
				$len = length($inter) - 4;
				$inter =~ s/^.{$len}//s;
			    }
			    $inter =~ s/(.{2})/$1\;/g;
			    @str = split(/\;/, $inter);
			    #@str = reverse(@str);
			    undef($inter);
			    foreach $str (@str)
			    {
				$inter .= $str;
			    }
			    $data_line .= $inter;
			}
                        elsif($size == 4)
			{
			    $inter = sprintf("%08x", $val);
			    if(length($inter) != 8)
			    {
				print "Error: First pass failed\nTried to input a larger than 32 bit value\n";
				exit(0);
			    }
			    $inter =~ s/(.{2})/$1\;/g;
			    @str = split(/\;/, $inter);
			    #@str = reverse(@str);
			    undef($inter);
			    foreach $str (@str)
			    {
				$inter .= $str;
			    }
			    $data_line .= $inter;
			}
                        $tot += $size;
			$tot = &check_total($tot);
		    }
		    elsif($file[$i] =~ /\.data(\d+) (\w+)/)
		    {
			$size = $1;
			$val = $2;
			if($size == 4)
			{
			    # need to put a label to be checked in the second pass
			    $data_line .= "LABEL: $val";
			    $tot += $size;
			    $tot = &check_total($tot);
			}
			else
			{
			    print "trying to insert a label with a value bigger than 4, i don't know what to do about this:\n.data$size $val\n";
			}
		    }
		    elsif($file[$i] =~ /\.skip (\d+)/)
		    {
			$tot += $1;
			for($j=0;$j<$1;$j++)
			{
			    $data_line .= sprintf("%02x", 0);
			}
			$tot = &check_total($tot);
		    }
		    elsif($file[$i] =~ /\.comm (\w+), 0x(\w+), (\d+)/)
		    {
			$comm_dec = hex($2);
			push @comm, "$1:$comm_dec:$3";
		    }
                    elsif($file[$i] =~ /\.data(\d+) (\(+\w*\??(\w+\.*)+(\s*[+-]?\s*\d*\))+)/)
                    {
			$temp_link_size = $1;
                        $tot = &check_total($tot);
			$temp_link = $2;
#			$temp_link =~ s/(\(*)_\?/$1$fil[$#fil]\_\?/g;
			$temp_link =~ s/\s//g;
			$temp_link =~ s/^\(//g;
			$temp_link =~ s/\)$//g;
                        $data_line = $temp_link;
			if($temp_link =~ /TAG/)
			{
			    $data_line = "LABEL: $data_line";
			}
                        $tot += $temp_link_size;
                        $tot = &check_total($tot);
                    }
		    elsif($file[$i] =~ /\.data(\d+) \((~?)0x(\w+)\)/)
		    {
			$tot = &check_total($tot);
			$size = $1;
			$dec = hex($3);
			if($2 eq "~")
			{
			    $dec = ($dec+1) * -1;
			}
			if($size == 4)
			{
			    $dec = sprintf("%08x", $dec);
			    $dec =~ s/(.{2})/$1\;/g;
			    @str = split(/\;/, $dec);
			    undef($dec);
			    foreach $str (@str)
			    {
				$dec .= $str;
			    }
			    $data_line .= $dec;
			    $tot += $size;
			    $tot = &check_total($tot);
			}
			else
			{
			    print "Error: First Pass Failed\ni haven't seen this before: $file[$i]\n";
			}
		    }
		    elsif($file[$i] =~ /\.real(\d+) 0x(\w+)/)
		    {
			$tot = &check_total($tot);
			$inter = $2;
			$size_of = $1;
			if($size_of == 4)
			{
			    $inter =~ s/(.{2})/$1\;/g;
			    @str = split(/\;/, $inter);
			    #@str = reverse(@str);
			    undef($inter);
			    foreach $str (@str)
			    {
				$inter .= $str;
			    }
			    $data_line .= $inter;
			    $tot += $size_of;
			}
			elsif($size_of == 8)
			{
			    for($i2=0;$i2<length($inter);$i2++)
			    {
				$temp = chop($inter) . $temp;
			    }
			    $inter =~ s/(.{2})/$1\;/g;
			    $temp =~ s/(.{2})/$1\;/g;
			    @str = split(/\;/, $inter);
			    #@str = reverse(@str);
			    @str2 = split(/\;/, $temp);
			    #@str2 = reverse(@str2);
			    undef($inter);
			    undef($temp);
			    foreach $str (@str)
			    {
				$inter .= $str;
			    }
			    $data_line .= $inter;
			    $tot += ($size_of/2);
			    $tot = &check_total($tot);
			    foreach $str2 (@str2)
			    {
				$temp .= $str2;
			    }
			    $data_line .= $temp;
			    undef($temp);
			    $tot += ($size_of/2);
			}
			else
			{
			    print "Error: First Pass Failed\nTrying to use more than 32 bits\n";
			}
			$tot = &check_total($tot);
		    }
		    elsif($file[$i] =~ /\.import (\w+\s*)+\n/)
		    {
			$imp = $1;
			chomp($imp);
			if($file[$i+1] =~ /\@object/)
			{
			    push (@ImportObject, $imp);
			}
			else
			{
			    push (@Import, "FUNC_$imp");
			}
		    }
		    $i++;
		}
	    }
	    elsif($1 eq "bss")
	    {
		while($file[$i] !~ /\.section/)
		{
		    if($file[$i] =~ /\.align (\d+)/)
		    {
			$bss_align = $1;
		    }
		    elsif($file[$i] =~ /:$/)
		    {
			chomp($file[$i]);
			$file[$i] =~ s/:+//;
			if($file[$i] =~ /PACKET/)
			{
			    $file[$i] = $fil[$#fil] . $file[$i];
			}
			$Bss_Label{$file[$i]} = $bss_start;
		    }
		    elsif($file[$i] =~ /\.skip (\d+)/)
		    {
			$bss_start += $1;
		    }
		    else
		    {
			print "Error: First Pass Failed\nUnknown bss section\n";
		    }
		    $i++;
		}
	    }
	    $i--;
	}
	elsif($file[$i] =~ /^\s*(c(\d+)|\;\;)/)
	{
	    if($2 ne "")
	    {
		$instruction_start++;
	    }
	    chomp($file[$i]);
	    $file[$i] =~ s/\t//g;
	    ($data, $comment) = split(/\#\#/, $file[$i]);
	    if($data =~ /\((.+)\)/)
	    {
		$tempy = $1;
		$tempy =~ s/\s//g;
		$data =~ s/\((.+)\)/\($tempy\)/;
	    }
	    if($data =~ /sub/)
	    {
		if($data =~ /= -?\d+/)
		{
		    $data =~ s/sub/rsub/;
		}
	    }
	    $comment =~ /line\s+(\d+)/;
	    push (@Instructions, $data);
	}
	elsif($file[$i] =~ /\s*\#\# Begin (\w+\s*)+/)
	{
	    $functions{"FUNC_$1"} = $#Instructions + 1;
	    $current = $1;
	    if($current =~ /main$/)
	    {
		$where_we_were = $i;
		$i++;
		while($file[$i] !~ /\s*\#\# End/)
		{
		    if($file[$i] =~ /c0\s+return/)
		    {
			($data, $comment) = split(/##/, $file[$i]);
			$file[$i] = "c0    call \$l0.0 = exit ## $comment";
			splice(@file,$i,0,"\.call exit, caller, arg(\$r0.3:s32), ret(\$r0.3:s32)");
			$i++;
		    }
		    $i++;
		}
		$i = $where_we_were;
	    }
	}
	elsif($file[$i] =~ /\.(entry|call|return)/)
	{
	    push (@Instructions, $file[$i]);
	}
	elsif($file[$i] =~ /\.import (\w+\s*)+/)
	{
	    $imp = $1;
	    if($file[$i+1] =~ /\@object/)
	    {
		push (@ImportObject, $imp);
	    }
	    else
	    {
		push (@Import, "FUNC_$imp");
	    }
	}
	elsif($file[$i] =~ /xnop \d+/)
	{
	    $file[$i] =~ s/\t//g;
	    push (@Instructions, "c0$file[$i]");
	    $instruction_start++;
	}
        elsif($file[$i] =~ /(.+)::$/)
        {
	    $inst_label_temp = $1;
	    $inst_label_temp = "FUNC_$inst_label_temp";
	    $Inst_Label{$inst_label_temp} = ($instruction_start);
            push(@Instructions, "-- $inst_label_temp");
            if(($stack_size != 0) && ($1 eq "main"))
            {
                push(@Instructions, "c0    mov \$r0.1 = $stack_size");
                push(@Instructions, ";;");
                push(@Instructions, ";;");
		$instruction_start++;
            }
        }
        elsif($file[$i] =~ /(.+):$/)
        {
	    $inst_label_temp = $1;
	    if($file[$i-1] =~ /\.entry/)
	    {
		push(@static_functions, $inst_label_temp);
		$inst_label_temp = "FUNC_$inst_label_temp";
	    }
	    $Inst_Label{$inst_label_temp} = ($instruction_start);
            push(@Instructions, "-- $inst_label_temp");
            if(($stack_size != 0) && ($1 eq "main"))
            {
                push(@Instructions, "c0    mov \$r0.1 = $stack_size");
                push(@Instructions, ";;");
                push(@Instructions, ";;");
		$instruction_start++;
            }
        }
    }
    if(defined($data_line))
    {
	for($j=$tot;$j<($data_align/8);$j++)
	{
	    $data_line .= sprintf("%02x", 0);
	}
	$data_start += ($data_align/8);
	push @mem, $data_line;
	undef($data_line);
    }
    $tot = 0;
    while(($bss_start % ($bss_align/8)) != 0)
    {
	$bss_start++;
    }

# TODO: This needs to be sorted out for -mem_align
if(0)
{
    foreach $comm (@comm)
    {
	($label, $size, $width) = split(/:/, $comm);
	$width = 4;
	if($label =~ /PACKET/)
	{
	    $label = $fil[$#fil] . $label;
	}
	while(1)
	{
	    if(!($data_start % $size))
	    {
		$Data_Label{$label} = $data_start;
		if($size == 1)
		{
		    $line .= "00";
		}
		elsif($size == 2)
		{
		    $line .= "0000";
		}
		elsif($size == 4)
		{
		    $line .= "00000000";
		}
		$data_start += $size;
		if(!($data_start % 4))
		{
		    push @mem, $line;
		    $line = "";
		}
		last;
	    }
	    else
	    {
		$line .= "00";
		$data_start++;
		if(!($data_start % 4))
		{
		    push @mem, $line;
		    $line = "";
		}
	    }
	}
    }
}
else
{
    foreach $comm (@comm)
    {
	($label, $size, $width) = split(/:/, $comm);
        $width = 4;
        if($label =~ /PACKET/)
        {
            $label = $fil[$#fil] . $label;
	}
        $Data_Label{$label} = $data_start;
	for($j=0;$j<($size/$width);$j++)
        {
            push @mem, sprintf("%08x", 0);
            $data_start += 4;
        }
    }
}
    if($line ne "")
    {
	while(length($line) < 8)
	{
	    $line .= "0";
	}
	push @mem, $line;
	$line = "";
    }
    &move_main();
    for($i=0;$i<=$#Instructions;$i++)
    {
	foreach $key (keys(%Data_Label))
	{
	    if(($Data_Label{$key} ne "") && ($key =~ /PACKET/))
	    {
		$temp = $key;
		$temp =~ s/$fil[$#fil]\_//;
		$temp2 = $temp;
		$temp2 =~ s/\?/\\?/;
		if($Instructions[$i] =~ /$temp2(\+|\))/)
		{
		    $Instructions[$i] =~ s/_$temp2/$fil[$#fil]\_$temp/g;
		}
	    }
	}
	foreach $key (keys(%Bss_Label))
	{
	    if(($Bss_Label{$key} ne "") && ($key =~ /PACKET/))
	    {
		$temp = $key;
		$temp =~ s/$fil[$#fil]\_//;
		$temp2 = $temp;
		$temp2 =~ s/\?/\\?/;
		if($Instructions[$i] =~ /$temp2(\+|\))/)
		{
		    $Instructions[$i] =~ s/_$temp2/$fil[$#fil]\_$temp/g;
		}
	    }
	}
    }
}
sub print_output()
{
    open OUTPUT, "> @_[0]" or die "Error: Could not open file: @_[0]\n";
    @_[0] =~ /(.+)\//;
    $filename_ = $1;
    print OUTPUT<<ENDOFHEADER;
ENDOFHEADER
    print OUTPUT "## Operations - $instruction_start\n";
    print OUTPUT "FILE: $filename_\n";
	foreach $inst (@Instructions)
	{
	    $inst =~ s/\s+$//g;
	    if($inst =~ /c(\d+\s+)call(\s+)\$l0\.0(\s+)=(\s+)(.+)/)
	    {
		if($5 ne "\$l0\.0")
		{
		    $inst = "c" . $1 . "call" . $2 . "\$l0.0" . $3 . "=" . $4 . "FUNC_" . $5;
		}
		else
		{
		    #print "call link!\n";
		    $inst = "c" . $1 . "call" . $2 . "\$l0.0" . $3 . "=" . $4 . $5;
		}
	    }
	    elsif($inst =~ /(\s*c\d+\s+)asm,0\s+(\$[rbl]\d+\.\d+)\s+=\s+(\$[rbl]\d+\.\d+)/)
	    {
		# need to switch for CPUID instruction
		$inst = $1 . "cpuid  " . $2;
	    }
	    # Prefix static function call names with the filename
	    foreach (@static_functions) {
		if($inst =~ /FUNC\_$_/) {
		    $inst =~ s/FUNC\_$_/$filename_\_FUNC\_$_/;
		}
	    }
	    printf(OUTPUT "%s\n", $inst);
	}
    print OUTPUT "ENDOFFILE: $filename_\n";
    print OUTPUT "\n\n\#\#Import\n";
    foreach $imp (@Import)
    {
	if($Inst_Label{$imp} eq "")
	{
	    print OUTPUT "$imp\n";
	}
    }
    print OUTPUT "\n\n\#\#ImportObject\n";
    foreach $imp (@ImportObject)
    {
	if($Data_Label{$imp} eq "")
	{
	    print OUTPUT "$imp\n";
	}
    }
    print OUTPUT "\n\n\#\#Instruction Labels\n";
    foreach $key (sort sortinstlabel (keys(%Inst_Label)))
    {
	if($Inst_Label{$key} ne "")
	{
	    $key_temp = "$key";
	    foreach (@static_functions) {
		if($key_temp =~ /FUNC\_$_/) {
		    $key_temp =~ s/FUNC\_$_/$filename_\_FUNC\_$_/;
		}
	    }
	    printf(OUTPUT "%04x - %s\n",($Inst_Label{$key}*4),$key_temp);
	}
    }
    print OUTPUT "\n\n\#\#Data Labels\n";
    foreach $key (sort sortdatalabel (keys(%Data_Label)))
    {
	if($Data_Label{$key} ne "")
	{
	    $key_temp = $key;
	    printf(OUTPUT "%04x - %s\n",$Data_Label{$key},$key_temp);
	}
    }
    $ds = $data_start;
    print OUTPUT "\n\n\#\#Data Section - $ds - Data_align=$data_align\n";
    $start = 0;
    foreach $bit (@mem)
    {
	if($bit !~ /[A-Fa-f0-9]{8}/)
	{
	    foreach (@static_functions) {
		if($bit =~ /$_/) {
		    $bit =~ s/$_/$filename_\_FUNC\_$_/;
		}
	    }
	    if(($bit =~ /LABEL:/) && ($bit !~ /FUNC\_/)) {
		$bit =~ s/LABEL:\s+(.+)/LABEL: FUNC\_$1/;
	    }
	    printf(OUTPUT "%04x - %s\n", $start, $bit);
	    $start += 4;
	}
	else
	{
	    $data = hex($bit);
	    printf(OUTPUT "%04x - %08x - %032b\n",$start, $data, $data);
	    $start += 4;
	}
    }
    $bs = $bss_start;
    print OUTPUT "\n\n\#\#BSS Labels - $bs - Bss_align=$bss_align\n";
    foreach $key (sort sortbsslabel (keys(%Bss_Label)))
    {
	if($Bss_Label{$key} ne "")
	{
	    printf(OUTPUT "%04x - %s\n",$Bss_Label{$key}, $key);
	}
    }
    close OUTPUT;
}
sub check_total()
{
    if(@_[0] == ($data_align/8))
    {
	push @mem, $data_line;
	undef($data_line);
	$data_start += ($data_align/8);
	return(0);
    }
    elsif(@_[0] > ($data_align/8))
    {
	@data_line_temp = split(//, $data_line);
	undef($data_line);
	for($data_l_temp=0;$data_l_temp<=$#data_line_temp;$data_l_temp+=2)
	{
	    $data_line_temp .= "$data_line_temp[$data_l_temp]$data_line_temp[$data_l_temp+1]";
	    if($data_l_temp == (($data_align/8) + 2))
	    {
		push @mem, $data_line_temp;
		undef($data_line_temp);
		$data_start += ($data_align/8);
	    }
	}
	$data_line = $data_line_temp;
	undef($data_line_temp);
	return(length($data_line)/2);
    }
    else
    {
	return(@_[0]);
    }
}
sub sortdatalabel()
{
    $Data_Label{$a} <=> $Data_Label{$b};
}
sub sortinstlabel()
{
    $Inst_Label{$a} <=> $Inst_Label{$b};
}
sub sortbsslabel()
{
    $Bss_Label{$a} <=> $Bss_Label{$b};
}
sub sortfunctions()
{
    $functions{$a} <=> $functions{$b};
}
sub check_calls()
{
    for($calls_check=0;$calls_check<=$#Instructions;$calls_check++)
    {
	if(($Instructions[$calls_check] =~ /call \$l0\.0 =/) && ($Instructions[$calls_check+1] ne ";;"))
	{
	    $position_of_call = $calls_check;
	    while($Instructions[$calls_check] ne ";;")
	    {
		$calls_check++;
	    }
	    splice(@Instructions,$calls_check,0,$Instructions[$position_of_call]);
	    splice(@Instructions,$position_of_call,1);
	}
    }
}
sub check_returns()
{
    for($returns_check=0;$returns_check<=$#Instructions;$returns_check++)
    {
	if(($Instructions[$returns_check] =~ /return \$r0\.1/) && ($Instructions[$returns_check+1] ne ";;") && ($returns_check+1 < $#Instructions))
	{
	    $position_of_return = $returns_check;
	    while($Instructions[$returns_check] ne ";;")
	    {
		$returns_check++;
	    }
	    splice(@Instructions,$returns_check,0,$Instructions[$position_of_return]);
	    splice(@Instructions,$position_of_return,1);
	}
    }
}
sub move_main()
{
    $there_is_a_main = -1;
    foreach $key (sort sortfunctions (keys(%functions)))
    {
	if(($functions{$key} ne "") && ($there_is_a_main == -1))
	{
	    if($key =~ /FUNC_main/)
	    {
		$there_is_a_main = $functions{$key};
		last;
	    }
	    else
	    {
		push @needs_moving, "$functions{$key},$key";
	    }
	}
    }
    if(($there_is_a_main > -1) && ($#needs_moving >= 0))
    {
#	print "THERE IS A MAIN AND IT NEEDS MOVING!\n";
	for($k=$there_is_a_main;$k<=$#Instructions;$k++)
	{
	    $Instructions[$k] =~ /^--\s*FUNC_(\w+)$/;
	    if(($1 ne "main") && ($Instructions[$k] =~ /^--\s*FUNC_(\w+)$/))
	    {
		last;
	    }
	    else
	    {
		push @Instructions_Temp, $Instructions[$k];
	    }
	}
	$endding = $k - 1;
#	delete $Instructions_Temp[$#Instructions_Temp];
	for($k=0;$k<$there_is_a_main;$k++)
	{
	    push @Instructions_Temp, $Instructions[$k];
	}
	for($k=$endding;$k<$#Instructions;$k++)
	{
	    push @Instructions_Temp, $Instructions[$k];
	}
	@Instructions = @Instructions_Temp;
	undef(@Instructions_Temp);
	$count_func = 0;
	foreach $key (sort sortinstlabel (keys(%Inst_Label)))
	{
	    if((($Inst_Label{$key} ne "") && (defined($functions{$key}))) && (($key eq "FUNC_main") || ($count_func == 1)))
	    {
		if($count_func == 0)
		{
		    $main_starts_at = $Inst_Label{$key};
		}
		elsif($count_func == 1)
		{
		    $main_ends_at = $Inst_Label{$key};
		}
		$count_func++;
	    }
	    if($count_func == 2)
	    {
		last;
	    }
	}
	if($main_ends_at == 0)
	{
	    $main_ends_at = $instruction_start;
	}
#	$main_starts_at = $Inst_Label{"FUNC_main"};
	foreach $key (sort sortinstlabel (keys(%Inst_Label)))
	{
	    if(($Inst_Label{$key} >= $main_starts_at) && ($Inst_Label{$key} < $main_ends_at))
	    {
		$Inst_Label{$key} -= $main_starts_at;
	    }
	    elsif($Inst_Label{$key} <= $main_starts_at)
	    {
		$Inst_Label{$key} += ($main_ends_at - $main_starts_at);
	    }
	}
    }
    elsif($there_is_a_main > -1)
    {
    }
    else
    {
    }
}
sub nop_check()
{
    for($i=0;$i<=$#Instructions;$i++)
    {
	if(($Instructions[$i] =~ /;;/) && ($i+1 <= $#Instructions))
	{
	    $op_count = 0;
	    while($Instructions[$i+1] !~ /;;/)
	    {
		$i++;
		if($Instructions[$i] =~ /c\d+\s+\w+/)
		{
		    $op_count++;
		}
	    }
	    if($op_count == 0)
	    {
		splice(@Instructions,$i+1,0,"c0    xnop 1");
		$i++;
	    }
	}
    }
}
