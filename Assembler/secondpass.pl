#!/usr/bin/perl

##############################################################################
#                               LE1 Tool-Chain                                #
#                           Assembler/secondpass.pl                           #
#                           Dave Stevens - A767169                            #
#                          Loughborough University                            #
#                              D.Stevens.ac.uk                                #
###############################################################################
$total_1 = 0;
$ok = 1;
$return_count = 0;

$debug = 0;
$mem_align = 0;
$dram_base_offset = 0;
if($ARGV[0] eq "")
{
    print<<EOR;
    Second Pass Failed
	You have not entered a file to convert!
	Pleace call the script with a switch of the filename you wish to convert
	eg. perl secondpass.pl <filename>
EOR
	exit(0);
}
else
{
    foreach $arg (@ARGV)
    {
	if($arg =~ /-d=(\d)/)
	{
	    $debug = $1;
	}
	elsif($arg =~ /-s=0x(\w+)/)
	{
	    $sp = hex($1);
	}
	elsif($arg =~ /-mem_align/)
	{
	    $mem_align = 1;
	}
	elsif($arg =~ /-OPC=(.+)/)
	{
	    $opcodes_txt = $1;
	}
	elsif($arg =~ /-DRAM_OFFSET=0x(\w+)/)
	{
	    $dram_base_offset = hex($1);
	}
	else
	{
	    $input_file = $arg;
	}
    }
    print "mem align: $mem_align\n";
    print "dram_base_offset: $dram_base_offset\n";
    if(-e $input_file)
    {
	($output_file) = split(/\./, $input_file);
	mkdir('microblaze');

	$output_file_inst = $output_file . ".s.bin";
	$output_file_inst_readable = $output_file . ".inst.txt";
	$output_header_file_inst = 'microblaze/inst.h';#$output_file . ".inst.forXilinx.h";

	$output_file_data = $output_file . ".data.bin";
	$output_file_data_readable = $output_file . ".data.txt";
	$output_header_file_data = 'microblaze/data.h';#$output_file . ".data.forXilinx.h";
	$output_data_le1_vars = 'microblaze/le1_obj.h';#$output_file . "_le1_objects.h";

	&grab_data($input_file);
	&second_pass();
	if($ok == 1)
	{
	    # create binaries directory
	    if(!(-e "binaries")) {
		system("mkdir binaries");
	    }
	    &print_instructions($output_file_inst, $output_file_inst_readable, $output_header_file_inst);
	    &print_data($output_file_data, $output_file_data_readable, $output_header_file_data, $output_data_le1_vars);

	    # need a flat file of data labels and addresses
	    open FILE, "> $output_file.datalabels" or die;
	    foreach $key (sort sortdatalabel (keys(%Data_Label)))
	    {
		if($key ne "")
		{
		    print FILE "$key $Data_Label{$key}\n";
		}
	    }	    
	    close FILE;

	    print "Second Pass Completed\n$output_file_inst created & $output_file_data created\n";
	    exit(0);
	}
	else
	{
	    print "Error: Second Pass Failed\nSee above errors ^^^\n";
	    exit(0);
	}
    }
    else
    {
	print "Second Pass Failed\nwhy? File does not exists $input_file\n";
	exit(0);
    }
}
sub grab_data()
{
    $file = @_[0];
    open INPUT, "< $file" or die
	"Second Pass Failed\nCould not open file ($file): $!\n";
    @in_file = <INPUT>;
    close INPUT;
    for($i=0;$i<=$#in_file;$i++)
    {
	if($in_file[$i] =~ /Operations - \d+$/)
	{
	    $i++;
	    while($in_file[$i] !~ /^\n/)
	    {
		chomp($in_file[$i]);
		push @Operations, $in_file[$i];
		$i++;
	    }
	}
	# just need to skip over this section now
	elsif($in_file[$i] =~ /Instruction Labels$/)
	{
	    $i++;
	    while($in_file[$i] !~ /^\n/)
	    {
		$i++;
	    }
	}
	elsif($in_file[$i] =~ /Data Labels$/)
	{
	    $i++;
	    while($in_file[$i] !~ /^\n/)
	    {
		chomp($in_file[$i]);
		($address, $label) = split(/ \- /, $in_file[$i]);
		if(defined($label))
		{
		    $Data_Label{$label} = hex($address) + $dram_base_offset;
		    undef($label);
		}
		$i++;
	    }
	}
	elsif($in_file[$i] =~  /Import$/)
	{
	    $i++;
	    while($in_file[$i] !~ /^\n/)
	    {
		chomp($in_file[$i]);
		push (@Import, $in_file[$i]);
		$i++;
	    }
	}
	elsif($in_file[$i] =~ /Data Section - (\d+) - Data_align=(\d+)$/)
	{
	    $data_align = $2;
	    $total_data = $1;
	    $i++;
	    while(($in_file[$i] !~ /^\n/) && ($i <= $#in_file))
	    {
		chomp($in_file[$i]);
		($address, $value_hex, $value_bin) = split(/ \- /, $in_file[$i]);
		if(defined($value_hex))
		{
		    push @Memory, $value_hex;
		}
		$i++;
	    }
	}
	elsif($in_file[$i] =~ /BSS Labels - (\d+) - Bss_align=(\d+)/)
	{
	    $total_bss = $1;
	    $bss_align = $2;
	    $i++;
	    while(($in_file[$i] !~ /^\n/) && ($i <= $#in_file))
	    {
		chomp($in_file[$i]);
		($address, $label) = split(/ - /, $in_file[$i]);
		if(defined($label))
		{
		    $Data_Label{$label} = (hex($address) + $total_data + $dram_base_offset);
		    undef($label);
		}
		$i++;
	    }
	}
    }
    for($q=0;$q<$total_bss;$q+=4)
    {
	push @Memory, "00000000";
    }
    print "Size of data area : $total_data\n";
    print "Size of bss area : $total_bss\n";
    $end_of_memory = ($total_data + $total_bss) * 8;
    print "End of memory: $end_of_memory\n";

    $counter = 0;
    foreach $op (@Operations)
    {
	if($op =~ /^\w+\.\d+/)
	{
	    $counter++;
	}
	if($op =~ /^--\s+(.+)/)
	{
	    $Inst_Label{$1} = $counter;
	}
    }

}
sub second_pass()
{
    @opcode = (
	'2,5,RR(i|I)L',             # for RETURN
	'1,5,^RR$',                 # sign|zero extension
	'0,5,RRR',                  # alu R = R, R
	'2,5,RR?i$',                # alu R = R, 9bitImmediate
	'1,5,RR?I$',                # alu R = R, 32bitImmediate
	'2,5,RiR',                  # alu, R = 9bitImmediate (only for RSUB)
	'1,5,RIR',                  # alu, R = 32bitImmediate (only for RSUB)
	'3,2,RBRRB',                # addcg & divs
	'3,2,RB',                   # MFB
	'7,2,(ST\w|PFT)$',          # store
	'8,2,(ST\w|PFT).S',         # store
	'9,2,(ST\w|PFT).L',         # store
	'1,5,(ST\w|PFT\.(S|L)?)$',  # store, 32bit
	'3,2,F',                    # GOTO
	'3,2,^L$',                  # GOTO $l0.0
	'3,2,L[FL]',                   # CALL (ADDED L for call LINK)
	'3,2,BF',                   # this is for BR and BRF
	'6,4,(R|B)R?i',             # cmp R = R, 9bitImmediate
	'5,4,(R|B)R?I',             # cmp R = R, 32bitImmediate
	'4,4,(R|B)R?R',             # cmp R = R, R
	'0,5,RBRR',                 # for slct/slctf RBRR
	'1,5,RBRI',                 # for slct/slctf RBRI
	'1,5,RBRi',                 # for slct/slctf RBRI
	'2,5,^i$',                  # for XNOP
	'1,5,AR?',	            # for store with 32 bit immediate
	'11,2,LDBU.?\w?',           # load byte unsigned
	'10,2,LDB.?\w?$',           # load byte
	'12,2,LDH.?\w?$',           # load halfword
	'13,2,LDHU.?\w?',           # load halfword unsigned
	'14,2,LDW.?\w?',            # load word
	'1,5,LD\w+.?\w?$',          # load, 32bit
	'1,5,RL',                   # mov from link reg
	'1,5,LR',                   # mov to link reg
	'1,5,LDL',                  # load from link reg
	'1,5,STL',                  # store to link reg
	'1,5,RF',                   # this is a MOV with a function label
	'3,2,R',
	);
    $syllable |= $2 << 15;
    $syllable |= $1 << 10;
    $instruction_address = 0;
    $current_cluster = 0;
    $clock = 0;
    $call = 0;
    for($i=0;$i<=$#Operations;$i++)
    {
	undef($syllable);
	if($Operations[$i+1] =~ /\;/)
	{
	    $clock = 1;
	}
	elsif($Operations[$i+1] =~ /xnop/)
	{
	    $clock = 1;
	}
	if(($Operations[$i+1] =~ /\;/) && ($Operations[$i] =~ /^\-/))
	{
	    $syllable = 1 << 31;
	    push @output, "$instruction_address - $syllable - Auto Inserted NOP2|NOP";
	    foreach $key (%Inst_Label)
	    {
		if($Inst_Label{$key} >= $instruction_address)
		{
		    if($Operations[$i] eq "-- $key")
		    {
		    }
		    else
		    {
			$Inst_Label{$key}++;
		    }
		}
	    }
	    $instruction_address++;
	    $clock = 0;
	}
	if(($Operations[$i] =~ /\;/) && ($Operations[$i+1] =~ /\;/))
	{
	    $syllable = 1 << 31;
	    push @output, "$instruction_address - $syllable - Auto Inserted NOP|NOP";
	    foreach $key (%Inst_Label)
	    {
		if($Inst_Label{$key} >= $instruction_address)
		{
		    $Inst_Label{$key}++;
		}
	    }
	    $instruction_address++;
	    $clock = 0;
	}
	if($Operations[$i] =~ /\.entry/)
	{
	    &entry_caller($Operations[$i]);
	}
	elsif($Operations[$i] =~ /\.return/)
	{
	    &return_args($Operations[$i]);
	}
	elsif($Operations[$i] =~ /\.call/)
	{
	    &call_caller($Operations[$i]);
	}
	elsif($Operations[$i] =~ /^\-/)
	{
	    &label($Operations[$i]);
	}
	elsif($Operations[$i] =~ /^\./)
	{
	    &other($Operations[$i]);
	}
	elsif($Operations[$i] =~ /\;/)
	{
	}
	elsif($Operations[$i] =~ /^(ENDOF)?FILE/)
	{
	    if($Operations[$i] =~ /^FILE/)
	    {
		$Operations[$i] =~ /FILE: (.+)/;
		$filename_ = $1;
		$Operations[$i+2] =~ /-- (.+)/;
		$functionname_ = $1;
		$fileStart{$functionname_} = $filename_;
		#print $functionname_, " => ", $fileStart{$functionname_}, "\n";
	    }
	}
	else
	{
	    push @output, &operation($Operations[$i]);
	    if($clock == 1)
	    {
		$current_cluster = 0;
	    }
	    undef($line);
	    $instruction_address++;
	}
	undef($opcode_length);
	undef($times);
	undef($format_found);
	undef($clock);
	undef(@nops);
	undef(@customs);
    }
}
sub entry_caller()
{
    $entry_caller = $_[0];
}
sub return_args()
{
    $return_args[$return_count++] = $_[0];
}
sub call_caller()
{
    $call = @_[0];
    push @output, $_[0];
}
sub clock()
{
}
sub label()
{
    $function = $_[0];
    if($function =~ /FUNC_/)
    {
	$function =~ /--\s+(.+)/;
	$function = $1;
	$function =~ s/\./X/g;
	$function =~ s/\?/X/g;
	$function_head = "/* FUNCTION *$function */\n";
	$entry_caller =~ /arg\((.*)\)/;
	@sim_args = split(/,/, $1);
	$args_count = 0;

	if($function eq "FUNC_main")
	{
	    $function_head .= "\t" . '/* CLOCK */' . "\n";
	    $function_head .= "\t" . 'void *label0x0(void)' . "\n";
	    $function_head .= "\t" . '{'. "\n";
	}
	foreach $sim_arg (@sim_args)
	{
	    if($sim_arg =~ /\$([rbl])(\d+)\.(\d+):\w+/)
	    {
		$function_head .= "sim_$1" . "\[cntxt\]\[hcntxt\]\[$2\]\[$3\] = pass_arguments[cntxt][hcntxt].args.arg[$args_count];\n";
		$function_head .= "sim_$1" . "_prev\[cntxt\]\[hcntxt\]\[$2\]\[$3\] = pass_arguments[cntxt][hcntxt].args.arg[$args_count];\n";
		$args_count++;
	    }
	}
	if($function eq "FUNC_main")
	{
$current_label_for_hash_define = "label0x0";
$function_head .=<<FUNCHEAD;
\t\tif(!checked[cntxt][hcntxt])
\t\t{
\t\t\tif(check_bundles(cntxt, hcntxt, label0x0_start, label0x0_end))
\t\t\t{
\t\t\t\tchecked[cntxt][hcntxt] = 1;
\t\t\t\treturn 0;
\t\t\t}
\t\t}
\t\tchecked[cntxt][hcntxt] = 0;
\t\tCYCLE_INCREMENT(cntxt, hcntxt);
FUNCHEAD
    push @Functions, "void *label0x0(void);";
}
    push @output, $function_head;
    }
    else
    {
	$function =~ /--\s+(.+)/;
	$function =~ s/\./X/g;
	$function =~ s/\?/X/g;
	push @output, $function;
    }
}
sub other()
{
}
sub operation()
{
    @ops = split(/\s+/, @_[0]);
    if($clock == 1)
    {
	$syllable |= 1 << 31;
    }
# TODO: work out this moving from clusters in new Assembly
    if(($ops[0] =~ /c(\d+)=c(\d+)/) && (($ops[1] eq "mov") || ($ops[1] eq "MOV")))
    {
	if($clock == 1)
	{
	    $syllable |= 1 << 31;
	}
	$syllable |= 4 << 26;
	$syllable |= 14 << 21;
	$ops[2] =~ /\$r(\d+)\.(\d+)/;
	$syllable |= $2 << 15;
	$syllable |= $1 << 10;
	$ops[4] =~ /\$r(\d+)\.(\d+)/;
	$syllable |= $2;
	$syllable |= $1 << 6;
	return("$instruction_address - $syllable - MVCL|@_[0]");
    }
    elsif(0)
    {
	$ops[0] =~ /c(\d+)/;
	if($1 == $current_cluster)
	{
	}
	elsif($1 == $current_cluster + 1)
	{
	    $syllable |= 1 << 30;
	    $current_cluster++;
	}
	else
	{
	    if($1 == 0)
	    {
		$syllable |= 1 << 30;
		$current_cluster = 0;
	    }
	    else
	    {
		$ok = 0;
		print "ERROR - Cluster numbers increment too high - @_[0]\n";
	    }
	}
    }

    # ops now in the form opcode.cluster
    $ops[0] =~ /\s*(\w+)\.(\d+)/;

    #$opcode_name = uc($ops[1]);
    $opcode_name = uc($1);
    if($2 == $current_cluster)
    {
    }
    elsif($2 == $current_cluster + 1)
    {
	$syllable |= 1 << 30;
	$current_cluster++;
    }
    else
    {
	if($2 == 0)
	{
	    $syllable |= 1 << 30;
	    $current_cluster = 0;
	}
	else
	{
	    $ok = 0;
	    print "ERROR - Cluster numbers increment too high - @_[0]\n";
	}
    }

    if($opcode_name =~ /[SZ]XT[BH]/)
    {
	$syllable |= 1 << 6;
    }

    if($opcode_name eq "ASM")
    {
	$ops[1] =~ /0x(\w+)/;
	$custom_instid = hex($1);
	$syllable |= ($custom_instid & 0x3f) << 9;
	$syllable |= 1 << 7;
	$syllable |= 1 << 26; # format

	$ops[2] =~ /(\d+)X(\d+)/;
	$left_side = $1;
	$right_side = $2;

	if(($left_side + $right_side) == 7)
	{
	    $syllable |= 24 << 21;
	}
	elsif(($left_side + $right_side) == 6)
	{
	    $syllable |= 25 << 21;
	}
	elsif(($left_side + $right_side) == 5)
	{
	    $syllable |= 26 << 21;
	}
	elsif(($left_side + $right_side) == 4)
	{
	    $syllable |= 27 << 21;
	}

	# SPECIAL CASE
	elsif(($left_side + $right_side) == 3)
	{
	    $syllable &= 0xc0000000;
	    $syllable |= 4 << 26; # format 4
	    $syllable |= 15 << 21; # opcode

	    $ops[3] =~ /$reg2/;
	    $syllable |= $3 << 15; # rd
	    $syllable |= ($custom_instid & 0x7) << 12;

	    if($left_side == 1)
	    {
		$syllable |= 1 << 25; # 1X2
		$ops[4] =~ /$reg2/;
		$syllable |= $3;
		$ops[5] =~ /$reg2/;
		$syllable |= $3 << 6;
	    }
	    else
	    {
		$ops[4] =~ /$reg2/;
		$syllable |= $3 << 6;
		$ops[5] =~ /$reg2/;
		$syllable |= $3;
	    }
	}
	
	$reg2 = '([rbl])(\d+)\.(\d+)';


	if(($left_side + $right_side) != 3)
	{
	    $syllable2 = 0;
	    $syllable2 |= ($left_side - 1) << 30;

	    $ops[3] =~ /$reg2/; # rd1
	    $syllable |= $3 << 15;

	    for($custom_count2 = 4; $custom_count2 < $left_side + 3;$custom_count2++)
	    {
		$ops[$custom_count2] =~ /$reg2/;
		if($custom_count2 == 4)
		{
		    # this needs to go in $syllable
		    $syllable |= $3;
		}
		else
		{
		    # $syllable2
		    $syllable2 |= $3 << (32 - (($custom_count2 - 5) * 6) - 8);
		}
	    }

	    $custom_count = $custom_count2;
	    for(; $custom_count2 < $left_side + 3 + $right_side; $custom_count2++)
	    {
		$ops[$custom_count2] =~ /$reg2/;
		if($custom_count == 10)
		{
		    # $syllable
		    $syllable |= $3;
		}
		else
		{
		    # $syllable2
		    $cust_c = $custom_count2 - $custom_count;
		    if($cust_c == 5)
		    {
			# only CASM7
			$syllable |= $3;
		    }
		    else
		    {
			$syllable2 |= $3 << ($cust_c * 6);
		    }
		}
	    }
	}
	push @customs, "$instruction_address - $syllable - CUSTOM|@_[0]";
	if(($left_side + $right_side) != 3)
	{
	    foreach $key (%Inst_Label)
	    {
		if($Inst_Label{$key} > $instruction_address) # EDIT HERE
		{
		    $Inst_Label{$key}++;
		}
	    }
	    $instruction_address++;
	    push @customs, "$instruction_address - $syllable2 - CUSTOM|EXTRA32BITS $syllable2";
	    undef($syllable2);
	}
	undef($custom_count);
	undef($custom_count2);
	undef($custom_c);
	return(@customs);
    }
    $layout_return = &return_layout(@_[0]);
    ($layout, $layout_values) = split(/:/, $layout_return);
    if(($layout eq "RL") || ($layout eq "LR"))
    {
	if($layout eq "RL")
	{
	    $opcode_name = "MVL2G";
	    $syllable |= 1 << 6;
	}
	elsif($layout eq "LR")
	{
	    $opcode_name = "MVG2L";
	    $syllable |= 1 << 6;
	}
    }
    if(($layout eq "oL") || ($layout eq "Lo") || ($layout eq "OL") || ($layout eq "LO"))
    {
	$layout =~ s/o/O/;
	if($opcode_name =~ s/LD\w(\.\w)?/LDL$1/)
	{
	    $syllable |= 1 << 7;
	}
	elsif($opcode_name =~ s/ST\w(\.\w)?/STL$1/)
	{
	    $syllable |= 3 << 6;
	}
    }
    if(($opcode_name eq "SLCT") || ($opcode_name eq "SLCTF"))
    {
	$layout =~ s/RBRi/RBRI/;
    }
    open OPCTXT, "< $opcodes_txt" or die "Second Pass Failed\nCould not find $opcodes_txt file ($!)\n";
    while( <OPCTXT> )
    {
	chomp();
	($opcode_check, $num) = split(/\s+/);
	if($opcode_name eq $opcode_check)
	{
	    if((($layout =~ /A|O/) && ($layout !~ /L/)) && ($times == 0))
	    {
		$times++;
	    }
	    else
	    {
		$opcode_num = &bin2dec($num);
	    	$opcode_length = length($num);
		last;
	    }
	}
    }
    close OPCTXT;
    if($opcode_length == 0)
    {
	$ok = 0;
	print "ERROR - Unknown Opcode - @_[0]\n";
	return("$instruction_address - 0 - XXX:@_[0]");
    }
    foreach $opc (@opcode)
    {
	($format, $opcode_chk, $layout_chk) = split(/\,/, $opc);
	if(($opcode_chk eq $opcode_length) && (($layout =~ /$layout_chk/) || ($opcode_name =~ /$layout_chk/)))
	{
	    $format_found = 1;
	    if(($layout eq "RR") && ($opcode_name eq "MOV"))
	    {
		$format = 0;
	    }
	    elsif($times > 0)
	    {
		$format = 1;
	    }
	    $syllable |= $format << 26;
	    last;
	}
    }	$ops[2] =~ /\$r(\d+)\.(\d+)/;
    if($format_found != 1)
    {
	print "ERROR - There was no format found for - $layout : @_[0]\n";
	$ok = 0;
    }
    if(($format == 5) || (($format == 1) && (($layout !~ /(RB)?RR$/) && ($layout !~ /^(LR|RL)$/))))
    {
	foreach $key (%Inst_Label)
	{
	    if($Inst_Label{$key} > $instruction_address) # EDIT HERE
	    {
		$Inst_Label{$key}++;
	    }
	}
    }
    if(($format =~ /[4-6]/) && ($layout =~ /^B/))
    {
	$syllable |= 1 << 25;
    }
    @values = split(/\,/, $layout_values);
    @types = split(//, $layout);
    if($format == 3)
    {
	$syllable |= $opcode_num << 24;
	if($layout eq "RBRRB")
	{
	    $syllable |= $values[0] << 15;
	    $syllable |= $values[1] << 21;
	    $syllable |= $values[2];
	    $syllable |= $values[3] << 6;
	    $syllable |= $values[4] << 12;
	    return("$instruction_address - $syllable - $opcode_name|@_[0]");
	}
	elsif($layout eq "L")
	{
	    $syllable |= 19 << 21;
	    return("$instruction_address - $syllable - $opcode_name|LINK");
	}
	elsif($layout eq "RB")
	{
	    $syllable |= $values[0] << 15;
	    $syllable |= $values[1] << 12;
	    return("$instruction_address - $syllable - $opcode_name|@_[0]");
	}
	elsif($layout =~ /^(L?F|BF)/)
	{
	    if($opcode_name eq "GOTO")
	    {
		$syllable |= 1 << 21;
		return("$instruction_address - $syllable - $opcode_name|$values[0]");
	    }
	    elsif($opcode_name eq "CALL")
	    {
		$syllable |= 2 << 21;
		if($Inst_Label{$values[1]} eq "")
		{
		    if($call !~ /exit/)
		    {
			if($call =~ /\.call (\w+), caller, arg\(((\$r\d+\.\d+\:\w+,?)*)\), ret\(((\$r\d+\.\d+\:\w+,?)*)\)/)
			{
			    $caller = $1;
			    @arg = split(/,/, $2);
			    @ret = split(/,/, $4);
			    for($a=0;$a<=$#arg;$a++)
			    {
				$arg[$a] =~ /\$([rbl])(\d+)\.(\d+)\:/;
				$arg .= $1 . $3;
				if($a < $#arg)
				{
				    $arg .= ",";
				}
			    }
			    for($a=0;$a<=$#ret;$a++)
			    {
				$ret[$a] =~ /\$([rbl])(\d+)\.(\d+)\:/;
				$ret .= $1 . $3;
				if($a < $#ret)
				{
				    $ret .= ",";
				}
			    }
			    if($call =~ /fprintf/)
			    {
				$append = " :STOP: FPRINTF";
			    }
			    elsif($call =~ /sprintf/)
			    {
				$append = " :STOP: SPRINTF";
			    }
			    elsif($call =~ /printf/)
			    {
				$append = " :STOP: PRINTF";
			    }
			    elsif($call =~ /clock/)
			    {
				$append = " :STOP: CLOCK";
			    }
			    elsif($call =~ /fopen/)
			    {
				$append = " :STOP: FOPEN";
			    }
			    elsif($call =~ /fscanf/)
			    {
				$append = " :STOP: FSCANF";
			    }
			    elsif($call =~ /fclose/)
			    {
				$append = " :STOP: FCLOSE";
			    }
			    elsif($call =~ /feof/)
			    {
				$append = " :STOP: FEOF";
			    }
			    elsif($call =~ /fflush/)
			    {
				$append = " :STOP: FFLUSH";
			    }
			    elsif($call =~ /fgetc/)
			    {
				$append = " :STOP: FGETC";
			    }
			    elsif($call =~ /fgets/)
			    {
				$append = " :STOP: FGETS";
			    }
			    elsif($call =~ /fputc/)
			    {
				$append = " :STOP: FPUTC";
			    }
			    elsif($call =~ /fputs/)
			    {
				$append = " :STOP: FPUTS";
			    }
			    elsif($call =~ /fread/)
			    {
				$append = " :STOP: FREAD";
			    }
			    elsif($call =~ /fwrite/)
			    {
				$append = " :STOP: FWRITE";
			    }
			    elsif($call =~ /sscanf/)
			    {
				$append = " :STOP: SSCANF";
			    }
			    else
			    {
				$append = "";
			    }
			    $call = ".call" . $caller . "\;" . $arg . "\;" . $ret . "\0";
			    undef($ret);
			    undef($arg);
			    undef(@arg);
			    undef(@ret);
			    undef($caller);
			    foreach $key (%Inst_Label)
			    {
				if($Inst_Label{$key} > $instruction_address) # EDIT HERE
				{
				    $Inst_Label{$key}++;
				}
			    }
			    $next_instruction = $end_of_memory;
			    $length_of_string = length($call) - 5; #-5 because the .call will be removed
			    while($length_of_string > 0)
			    {
				$count++;
				$length_of_string -= 4;
			    }
			    $end_of_memory += ($count * 32);
			    undef($count);
			}
			elsif($call =~ /\.call fprintf/)
			{
			    $append = " :STOP: FPRINTF";
			    $call =~ /\.call (\w+), caller, arg\((.+;\s+)?(((\$r\d+\.)?\d+\:\w+,?)*)\), ret\(((\$r\d+\.\d+\:\w+,?)*)\)/;
			    $caller = $1;
			    @arg = split(/,/, $3);
			    @ret = split(/,/, $6);
			    for($a=0;$a<=$#arg;$a++)
			    {
				$arg[$a] =~ /(\$([rbl])(\d+)\.)?(\d+)\:/;
				$arg .= $2 . $4;
				if($a < $#arg)
				{
				    $arg .= ",";
				}
			    }
			    for($a=0;$a<=$#ret;$a++)
			    {
				$ret[$a] =~ /(\$([rbl])(\d+)\.)?(\d+)\:/;
				$ret .= $2 . $4;
				if($a < $#ret)
				{
				    $ret .= ",";
				}
			    }
#			    print "$caller, $arg : $ret\n";
#			    exit(0);
			    $call = ".call" . $caller . "\;" . $arg . "\;" . $ret . "\0";
			    undef($ret);
			    undef($arg);
			    undef(@arg);
			    undef(@ret);
			    undef($caller);
			    foreach $key (%Inst_Label)
			    {
				if($Inst_Label{$key} > $instruction_address) # EDIT HERE
				{
				    $Inst_Label{$key}++;
				}
			    }
			    $next_instruction = $end_of_memory;
			    $length_of_string = length($call) - 5; #-5 because the .call will be removed
			    while($length_of_string > 0)
			    {
				$count++;
				$length_of_string -= 4;
			    }
			    $end_of_memory += ($count * 32);
			    undef($count);
			}
			else
			{
			    print "ERROR - Call is not recognised - @_[0] - $call\n";
			    $ok = 0;
			}
		    }
		    elsif($call =~ /exit/)
		    {
			push @nops, "$instruction_address - $syllable - $opcode_name|$call :STOP: $values[3]";
			$nop_syllable = 1 << 31;
			for($nop_count=0;$nop_count<11;$nop_count++)
			{
			    $instruction_address++;
			    foreach $key (%Inst_Label)
			    {
				if($Inst_Label{$key} >= $instruction_address)
				{
				    $Inst_Label{$key}++;
				}
			    }
			    push @nops, "$instruction_address - $nop_syllable - NOP|ADDEDNOP";
			}
			return(@nops);
		    }
		    if($next_instruction ne "")
		    {
			@return_array[0] = "$instruction_address - $syllable - $opcode_name|$call $append";
			$instruction_address++;
			@return_array[1] = "$instruction_address - $next_instruction - 32bit|imm $next_instruction";
			undef($next_instruction);
			return(@return_array);
		    }
		    else
		    {
			return("$instruction_address - $syllable - $opcode_name|$call $append");
		    }
		}
		else
		{
		    return("$instruction_address - $syllable - $opcode_name|$values[1] :STOP: $values[3]");
		}
	    }
	    elsif($opcode_name =~ /BRF?/)
	    {
		if($opcode_name =~ /F$/)
		{
		    $syllable |= 1 << 20;
		}
		$syllable |= $values[0] << 21;
		return("$instruction_address - $syllable - $opcode_name + br $values[0]|$values[2] ^ $values[1]");
	    }
	    else
	    {
		print "ERROR - Unknown Opcode - $opcode_name -  @_[0]\n";
		$ok = 0;
	    }
	}
	elsif($layout =~ /^LL/)
	{
	    #$syllable |= 2 << 21;
	    $syllable |= 4 << 21;
	    $syllable &= 0xffe00000;
	    return("$instruction_address - $syllable - $opcode_name|CALLTOLINKREG :STOP: CALLTOLINKREG")
	}
	elsif($layout =~ /^R$/)
	{
	    $syllable |= 21 << 21;
	    $syllable |= $values[0] << 15;
	    return("$instruction_address - $syllable - $opcode_name|@_[0]");
	}
	else
	{
	    print "ERROR - Unknown Layout - $layout - @_[0]\n";
	    $ok = 0;
	}
    }
    elsif((($format >= 7) && ($format <= 14)) || ($layout =~ /A|O/))
    {
	if($layout !~ /A|O/)
	{
	    $syllable |= $opcode_num << 24;
	}
	else
	{
	    $syllable |= $opcode_num << 21;
	    if($opcode_name =~ /^(s|p)/i)
	    {
		$syllable |= 3 << 6;
	    }
	    else
	    {
		$syllable |= 1 << 7;
	    }
	}
	for($p=0;$p<=$#types;$p++)
	{
	    if($types[$p] eq "a")
	    {
		($imm, $reg) = split(/\^/, $values[$p]);
		$syllable |= $reg;
		if($imm > 0xFFF)
		{
		    print "ERROR - 32bit immediate needed but not realised - @_[0]\n";
		    $ok = 0;
		}
		else
		{
		    $syllable |= $imm << 12;
		}
	    }
	    elsif($types[$p] eq "A")
	    {
		($imm, $reg) = split(/\^/, $values[$p]);
		$syllable |= $reg;
		$next_instruction = $imm;
	    }
	    elsif($types[$p] eq "O")
	    {
		($addr, $reg) = split(/\^/, $values[$p]);
		$syllable |= $reg;
		$next_instruction = $addr;
	    }
	    elsif($types[$p] eq "o")
	    {
		($addr, $reg) = split(/\^/, $values[$p]);
		if($p == 0) ## stw
		{
		    $syllable |= $reg;
		}
		elsif($p == 1) ## ldw
		{
		    $syllable |= $reg;
		}
		else
		{
		    print "ERROR - Something messed up - @_[0]\n";
		    $ok = 0;
		}
		$syllable |= $addr << 12;
	    }
	    elsif(($types[$p] eq "R") || ($types[$p] eq "L"))
	    {
		if(($layout =~ /O/) || ($layout =~ /A/))
		{
		    $syllable |= $values[$p] << 15;
		}
		elsif($p == 0)
		{
		    $syllable |= $values[$p] << 6;
		}
		elsif($p == 1)
		{
		    $syllable |= $values[$p] << 6;
		}
		else
		{
		    print "ERROR - Something messed up - @_[0]\n";
		    $ok = 0;
		}
	    }
	    else
	    {
		print "ERROR - Layout Not Recognised - $layout - @_[0]\n";
		$ok = 0;
	    }
	}
	if($next_instruction ne "")
	{
	    @return_array[0] = "$instruction_address - $syllable - $opcode_name|@_[0]";
	    $instruction_address++;
	    @return_array[1] = "$instruction_address - $next_instruction - 32bit|imm $next_instruction";
	    undef($next_instruction);
	    return(@return_array);
	}
	else
	{
	    return("$instruction_address - $syllable  - $opcode_name|@_[0]");
	}
    }
    else
    {
	$syllable |= $opcode_num << 21;
	if($opcode_name eq "XNOP")
	{
	    $nop_syllable = 1 << 31;
	    push @nops, "$instruction_address - $nop_syllable - NOP|NOP";
	    for($nop_count=1;$nop_count<$values[0];$nop_count++)
	    {
		$instruction_address++;
		foreach $key (%Inst_Label)
		{
		    if($Inst_Label{$key} >= $instruction_address)
		    {
			$Inst_Label{$key}++;
		    }
		}
		push @nops, "$instruction_address - $nop_syllable - NOP|NOP";
	    }
	    return(@nops);
	}
	if($opcode_name eq "RETURN")
	{
	    if(($values[2] <= 0x7FFFF) && ($values[2] >= -0x8000))
	    {
		$syllable |= &twoscomp($values[2],20);
	    }
	    else
	    {
		print "ERROR - RETURN value does not fit in 20 bits - $values[2] - @_[0]\n";
		$ok = 0;
	    }
	    return("$instruction_address - $syllable - $opcode_name|@_[0]");
	}
	$syllable |= $values[0] << 15;
	if($types[1] eq "I")
	{
	    $next_instruction = &twoscomp($values[1],32);
	}
	elsif($types[1] eq "i")
	{
	    $syllable |= &twoscomp($values[1],9) << 6;
	}
	elsif($types[1] eq "B")
	{
	    $syllable |= $values[1] << 12;
	}
	elsif($types[1] eq "F")
	{
	    $temp_op = $_[0];
	    $temp_op =~ s/(\s+=)\s+(.+)/$1 PC_FUNC_$2/;
	    @return_array[0] = "$instruction_address - $syllable - $opcode_name|$temp_op";
	    $instruction_address++;
	    @return_array[1] = "$instruction_address - MOVFUNCNAME$values[1] - 32bit|imm MOVFUNCNAME$values[1]";
	    undef($next_instruction);
	    return(@return_array);
	}
	else
	{
	    $syllable |= $values[1];
	}
	if($types[2] eq "i")
	{
	    $syllable |= &twoscomp($values[2],9) << 6;
	}
	elsif($types[2] eq "R")
	{
	    if(($types[1] eq "B") || ($opcode_name eq "RSUB"))
	    {
		$syllable |= $values[2];
	    }
	    else
	    {
		$syllable |= $values[2] << 6;
	    }
	}
	elsif($types[2] eq "I")
	{
	    $next_instruction = &twoscomp($values[2],32);
	}
	elsif($types[2] eq "")
	{
	}
	else
	{
	    print "ERROR - Unknown Layout - $layout - @_[0]\n";
	    $ok = 0;
	}
	if($types[3] ne "")
	{
	    if($types[3] eq "R")
	    {
		$syllable |= $values[3] << 6;
	    }
	    elsif($types[3] eq "I")
	    {
		$next_instruction = &twoscomp($values[3],32);
	    }
	    else
	    {
		print "ERROR - Unknown Layout - $layout - @_[0]\n";
		$ok = 0;
	    }
	}
    }
    if($next_instruction ne "")
    {
	@return_array[0] = "$instruction_address - $syllable - $opcode_name|@_[0]";
	$instruction_address++;
	@return_array[1] = "$instruction_address - $next_instruction - 32bit|imm $next_instruction";
	undef($next_instruction);
	return(@return_array);
    }
    else
    {
	return("$instruction_address - $syllable  - $opcode_name|@_[0]");
    }
}
sub bin2dec()
{
    @bin = split(//, @_[0]);
    @bin_rev = reverse(@bin);
    $total = 0;
    $current = 1;
    foreach $bit (@bin_rev)
    {
	$total += ($current * $bit);
	$current *= 2;
    }
    return($total);
}
sub return_layout()
{
    @layout = split(/\s+/, @_[0]);
    undef($type);
    undef($value);
    $reg = '([rbl])(\d+)\.(\d+)';
    $hex_num = '([-~]?)0x(\w+)';
    $label = '(\w+\??\.?\w*\.?\d*)';
    $label2 = '(\w+\?\w+(\.\w+)+)';
    $sim_imm = '(-?\d+)';
    $func = '(\w+\??\w*)';
    for($lay=1;$lay<=$#layout;$lay++)
    {
	if($layout[$lay] ne "=")
	{
	    if($layout[$lay] =~ /^$reg,?$/)
	    {
		$type .= uc($1);
		$value .= $3 . ",";
		$clus = $2;
		if($opcode_name =~ /BRF?/)
		{
		    $value .= $clus . ",";
		}
	    }
	    #elsif($layout[$lay] =~ /\(?$hex_num\)?\[$reg\]/)
	    elsif($layout[$lay] =~ /$reg\[$hex_num\]/)
	    {
		$dec = hex($5);
		$reg_num = $3;
		if($4 eq "~")
		{
		    $dec = ($dec+1) * -1;
		}
		elsif($4 eq "-")
		{
		    $dec *= -1;
		}
		if((($opcode_name =~ /^ldw/i) || ($opcode_name =~ /^stw/i)) && ($mem_align))
		{
		    $dec = $dec >> 2;
		}
		elsif((($opcode_name =~ /^ldh/i) || ($opcode_name =~ /^sth/i)) && ($mem_align))
		{
		    $dec = $dec >> 1;
		}
		if(($dec > 0x7FF) || ($dec < -0xFFF))
		{
		    $type .= "O";
		    $dec = &twoscomp($dec,32);
		    $value .= "$dec^$reg_num,";
		}
		else
		{
		    $type .= "o";
		    $dec = &twoscomp($dec,12);
		    $value .= "$dec^$reg_num,";
		}
		undef($dec);
		undef($reg_num);
	    }
	    elsif($layout[$lay] =~ /^\(?$hex_num\)?,?$/)
	    {
		$dec = hex($2);
		if($1 eq "-")
		{
		    $dec *= -1;
		    $type .= &nine_or_thritytwo($dec);
		    $value .= $dec . ",";
		}
		elsif($1 eq "~")
		{
		    $dec = ($dec+1) * -1;
		    $type .= &nine_or_thritytwo($dec);
		    $value .= $dec . ",";
		}
		else
		{
		    $value .= $dec . ",";
		    $type .= &nine_or_thritytwo($dec);
		}
		undef($dec);
	    }
	    #elsif($layout[$lay] =~ /$sim_imm\[$reg\]/)
	    elsif($layout[$lay] =~ /$reg\[$sim_imm\]/)
	    {
		$dec = $4;
		$reg_num = $3;
		if((($opcode_name =~ /^ldw/i) || ($opcode_name =~ /^stw/i)) && ($mem_align))
		{
		    $dec = $dec >> 2;
		}
		elsif((($opcode_name =~ /^ldh/i) || ($opcode_name =~ /^sth/i)) && ($mem_align))
		{
		    $dec = $dec >> 1;
		}
		if(($dec > 0x7FF) || ($dec < -0xFFF))
		{
		    $type .= "O";
		    $dec = &twoscomp($dec,32);
		    $value .= "$dec^$reg_num,";
		}
		else
		{
		    $type .= "o";
		    $dec = &twoscomp($dec,12);
		    $value .= "$dec^$reg_num,";
		}
		undef($dec);
		undef($reg_num);
	    }
	    elsif($layout[$lay] =~ /^$sim_imm/)
	    {
		if(($opcode_name eq "SLCT") || ($opcode_name eq "SLCTF"))
		{
		    $type .= "I";
		}
		else
		{
		    $type .= &nine_or_thritytwo($1);
		}
		$value .= $1 . ",";
	    }
	    #elsif($layout[$lay] =~ /\($label\+$sim_imm\)\[$reg\]/)
	    elsif($layout[$lay] =~ /$reg\[\($label\+$sim_imm\)\]/)
	    {
		$size = ($Data_Label{$4} + $5);
		$reg_num = $3;
		if((($opcode_name =~ /^ldw/i) || ($opcode_name =~ /^stw/i)) && ($mem_align))
		{
		    $size = $size >> 2;
		}
		elsif((($opcode_name =~ /^ldh/i) || ($opcode_name =~ /^sth/i)) && ($mem_align))
		{
		    $size = $size >> 1;
		}
		$value .= "$size^$reg_num,";
		if(($size > 0x7FF) || ($size < -0xFFF))
		{
		    $type .= "A";
		}
		else
		{
		    $type .= "a";
		}
		undef($size);
		undef($reg_num);
	    }
	    elsif($layout[$lay] =~ /\(\(?$label\+$sim_imm\)\+(\d+)/)
	    {
		$num = (($Data_Label{$1} + $2) + $3);
		if((($opcode_name =~ /^ldw/i) || ($opcode_name =~ /^stw/i)) && ($mem_align))
		{
		    $num = $num >> 2;
		}
		elsif((($opcode_name =~ /^ldh/i) || ($opcode_name =~ /^sth/i)) && ($mem_align))
		{
		    $num = $num >> 1;
		}
		undef($dec);
		$type .= &nine_or_thritytwo($num);
		$value .= $num . ",";
	    }
	    elsif($layout[$lay] =~ /\(\(?$label\+$sim_imm\)\+?\(?(~?)(0x\w+)?\)*/)
	    {
		if($3 eq "~")
		{
		    $dec = (hex($4) + 1) * -1;
		}
		else
		{
		    $dec = hex($4);
		}
		$num = (($Data_Label{$1} + $2) + $dec);
		if((($opcode_name =~ /^ldw/i) || ($opcode_name =~ /^stw/i)) && ($mem_align))
		{
		    $num = $num >> 2;
		}
		elsif((($opcode_name =~ /^ldh/i) || ($opcode_name =~ /^sth/i)) && ($mem_align))
		{
		    $num = $num >> 1;
		}
		undef($dec);
		$type .= &nine_or_thritytwo($num);
		$value .= $num . ",";
	    }
	    elsif($layout[$lay] =~ /\(\($label2\+$sim_imm\)([-+]\d+)\)/)
	    {
		$value .= $Data_Label{$1} + $4;
		$type .= &nine_or_thritytwo($Data_Label{$1} + $4);
	    }
	    elsif($layout[$lay] =~ /\($label2\+$sim_imm\)/)
	    {
		$value .= $Data_Label{$1} + $3;
		$type .= &nine_or_thritytwo($Data_Label{$1} + $3);
	    }
	    elsif($layout[$lay] =~ /$func/)
	    {
		$type .= "F";
		$value .= $1 . ",";
	    }
	    else
	    {
		$type .= "U";
		$value .= "U" . ",";
	    }
	}
    }
    return($type . ":" . $value);
}
sub nine_or_thritytwo()
{
    if((@_[0] < 256) && (@_[0] > -257))
    {
	return("i");
    }
    elsif(@_[0] > 0xFFFFFFFF)
    {
	print "Second Pass Failed
There has been an issue somewhere :(\ncalled &nine_or_thritytwo(@_[0])\n";
	exit(0);
    }
    else
    {
	return("I");
    }
}
sub twoscomp()
{
    $power = (2 ** @_[1]);
    if(@_[0] > 2147483647)
    {
	@_[0] = @_[0] - $power;
    }
    if((@_[0] >= 0) && (@_[0] < ($power/2)))
    {
	return(@_[0]);
    }
    elsif((@_[0] < 0) && (@_[0] > ((($power/2)+1)*-1)))
    {
	$twoscom = (($power-1) - ((@_[0]*-1) - 1));
	return($twoscom);
    }
    else
    {
	print "Second Pass Failed
There has been an issue somewhere :(\ncalled &twoscomp(@_[0],@_[1])\n";
	printf("0x%x\n", @_[0]);
	print "$Operations[$i]\n";
	print "$out\n";
	exit(0);
    }
}
sub hex_to_ascii()
{
    $h2a = @_[0];
    ($h2a = shift) =~ s/([a-fA-F0-9]{2})/chr(hex $1)/eg;
    return($h2a);
}
sub print_instructions()
{
    $instruction_size = 0;
    $test_address = 0;
    $return_count = 0;
    open BIG_ENDIAN_INSTRUCTION, "> binaries/iram0.bin" or die
	"Second Pass Failed\nCould not open file (binaries/iram0.bin : $!)\n";

#    open LITTLE_ENDIAN_INSTRUCTION, "> @_[0]\.little" or die
#	"Second Pass Failed\nCould not open file (@_[0].little : $!)\n";

    open IRAM_HEADER, "> @_[2]" or die
	"Second Pass Failed\nCould not open file (@_[2]): $!\n";
    $_[2] =~ /^(\w+)/;
    print IRAM_HEADER "/* inst area */\nchar le1_iram[] = {\n";

    open INST_TXT_FILE, "> @_[1]" or die
	"Second Pass Failed\nCould not open file (@_[1] : $!)\n";

    for($outting=0;$outting<=$#output;$outting++)
    {
	$syllable = 0;

	if($output[$outting] =~ /\/\* FUNCTION \*(.+) \*\//)
	{
	}
	elsif($output[$outting] =~ /^--/)
	{
	    $output[$outting] =~ s/^\-\-(.+)/$1:/;
	    $output[$outting] =~ s/^\s+//;
	}
	elsif($output[$outting] =~ /^\.call/)
	{
	    $where_to_call = $output[$outting];
	    $this_was_a_call = 1;
	}
	else
	{
	    ($address,$syllable,$comment) = split(/\s+-\s+/, $output[$outting]);
	    ($type, $operation) = split(/\|/, $comment);

	    # need to remove this part.
	    ($operation, $pthread_thing) = split(/\s+:STOP:\s+/, $operation);

	    if($type eq "CALL")
	    {
		if($operation !~ /\.call/)
		{
		    $syllable |= &twoscomp((($Inst_Label{$operation} - $test_address) * 4),20);
		    $operation = "call " . $operation;
		}
		else
		{
		    $syllable &= 3 << 30;
		    if($operation =~ /exit/)
		    {
			$syllable |= 0x17A1 << 15;
			$operation = "HALT";
		    }
		    else
		    {
			$operation =~ s/.call//g;
			$syllable |= 1 << 26;
			$syllable |= 20 << 21;
			$syllable |= 1 << 7;
			@call = split(//, $operation);
			for($k=0;$k<=$#call;$k++)
			{
			    $total_1 = &check_total($total_1);
			    $data_line .= sprintf("%02x", ord($call[$k]));
			    $total_1 += 1;
			    $total_1 = &check_total($total_1);
			}
			while($total_1 != 0)
			{
			    $total_1 = &check_total($total_1);
			    $data_line = sprintf("%02x", 0) . $data_line;
			    $total_1 += 1;
			    $total_1 = &check_total($total_1);
			}
			$operation = "call " . $operation;
		    }
		}
	    }
	    elsif($type eq "GOTO")
	    {
		if($operation eq "LINK")
		{
		}
		else
		{
		    $syllable |= &twoscomp((($Inst_Label{$operation} - $test_address) * 4),20);
		    $operation = "goto " . $operation;
		}
	    }
	    elsif($type =~ /BRF?/)
	    {
		($label_temp, $clus_temp) = split(/ \^ /, $operation);
		$syllable |= &twoscomp((($Inst_Label{$label_temp} - $test_address) * 4),16);
		$syllable |= $clus_temp << 16;
		$operation .= " " . $type;
		$abbs_addr = sprintf("0x%x", $Inst_Label{$label_temp} * 4);
		$operation .= " ABS ADDR: $abbs_addr";
	    }
	    $operation =~ s/\0//g;
	    if($debug == 1)
	    {
		printf("%04x - %032b - %08x - %s %s\n", ($address*4),$syllable, $syllable, $type, $operation);
	    }
	    if($type =~ /^NOP/)
	    {
	    }
	    elsif($type =~ /NOP/)
	    {
	    }
	    if($type =~ /32bit/)
	    {
		if($operation =~ /MOVFUNCNAME(.+)/)
		{
		    $syllable = ($Inst_Label{"FUNC_$1"} * 4);
		}
	    }
	    printf(INST_TXT_FILE "%04x - %032b - %08x - %s %s\n", ($address*4),$syllable, $syllable, $type, $operation);

	    $test = sprintf("%08x", $syllable);
	    print BIG_ENDIAN_INSTRUCTION &hex_to_ascii($test);

	    $test = sprintf("0x%02x,", ($syllable >> 24) & 0xff);
	    print IRAM_HEADER $test;
	    $test = sprintf("0x%02x,", ($syllable >> 16) & 0xff);
	    print IRAM_HEADER $test;
	    $test = sprintf("0x%02x,", ($syllable >> 8) & 0xff);
	    print IRAM_HEADER $test;
	    $test = sprintf("0x%02x,", ($syllable) & 0xff);
	    print IRAM_HEADER $test, "\n";

	    $test = sprintf("%08x", $syllable);
	    $test =~ s/(.{2})/$1\;/g;
	    @str = split(/\;/, $test);
	    @str = reverse(@str);
	    undef($test);
	    foreach $str (@str)
	    {
		$test .= $str;
	    }
	    $instruction_size += 4;
#	    print LITTLE_ENDIAN_INSTRUCTION &hex_to_ascii($test);
	    $test_address++;
	}
    }
    close INST_TXT_FILE;
    close BIG_ENDIAN_INSTRUCTION;
#    close LITTLE_ENDIAN_INSTRUCTION;
    $_[3] =~ /^(\w+)/;
    print IRAM_HEADER "};\n#define LE1_INST_SIZE $instruction_size\n";
    close IRAM_HEADER;
}

sub print_data()
{
    open BIG_ENDIAN_DATA, "> binaries/dram.bin" or die
	"Second Pass Failed\nCould not open file (binaries/dram.bin): $!\n";

#    open LITTLE_ENDIAN_DATA, "> @_[0]\.little" or die
#	"Second Pass Failed\nCould not open file (@_[0].little): $!\n";

    open DRAM_HEADER, "> @_[2]" or die
	"Second Pass Failed\nCould not open file (@_[2]): $!\n";
    $_[2] =~ /^(\w+)/;
    #print DRAM_HEADER "/* data area */\n#define " . uc($1) . "_DATA_SIZE " . ($#Memory + 1) * 4 . "\nchar $1\_d[] = {\n";
    print DRAM_HEADER "/* data area */\n#define LE1_DRAM_SIZE " . ($#Memory + 1) * 4 . "\nchar le1_dram[] = {\n";

    open DATA_TXT_FILE, "> @_[1]" or die
	"Second Pass Failed\nCould not open file (@_[1]): $!\n";

    print DATA_TXT_FILE "ADDR - DATA     - VALUE\n";

    open LE1OBJECTS, "> @_[3]" or die
	"Second Pass failed\nCould not open file (@_[3]: $!\n";

    print LE1OBJECTS "/* data memory labels for host */\n\n";
    foreach $key (sort sortdatalabel (keys(%Data_Label)))
    {
	if($Data_Label{$key} ne "")
	{
	    $temp = $key;
	    $temp =~ s/[?\.]/X/g;
	    printf(LE1OBJECTS "#define le1var_%s 0x%x\n", $temp, $Data_Label{$key});
	}
    }

    print LE1OBJECTS "\n/* function labels for the host */\n\n";

    foreach $key (sort sortinstlabel (keys(%Inst_Label)))
    {
	if($Inst_Label{$key} ne "")
	{
	    $temp = $key;
	    $temp =~ s/[?\.]/X/g;
	    $temp =~ s/^FUNC_//g;
	    printf(LE1OBJECTS "#define le1func_%s 0x%x\n", $temp, ($Inst_Label{$key} * 4));
	}
    }
    close LE1OBJECTS;

    $count = 0;
    foreach $data (@Memory)
    {
	if($data !~ /[A-Fa-f0-9]{8}/)
	{
#	    print "NO NUMERICAL DATA: $data\n";
	    if($data =~ /LABEL: (.+)/)
	    {
		if(defined($Inst_Label{"FUNC_$1"}))
		{
		    $temp_value = $Inst_Label{"FUNC_$1"} * 4;
##		    print "Found it: FUNC_$1 - $temp_value - ";
#		    $data = "00000000";
		    $data = sprintf("%08x", $temp_value);
##		    print "data: $data\n";
###		    $data =~ s/(.{2})/$1\;/g;
###		    @str = split(/\;/, $data);
###		    $data = "";
###		    @str = reverse(@str);
###		    foreach $str (@str)
###		    {
###			$data .= $str;
###		    }
#		    print "data: $data\n";
		}
		elsif(defined($Inst_Label{"$1"}))
		{
		    $temp_value = $Inst_Label{"$1"} * 4;
##		    print "Found it: $1 - $temp_value - ";
#		    $data = "00000000";
		    $data = sprintf("%08x", $temp_value);
##		    print "data: $data\n";
###		    $data =~ s/(.{2})/$1\;/g;
###		    @str = split(/\;/, $data);
###		    $data = "";
###		    @str = reverse(@str);
###		    foreach $str (@str)
###		    {
###			$data .= $str;
###		    }
#		    print "data: $data\n";
		}
		else
		{
		    print "Could not find instruciton label\n";
		    $data = "00000000";
		}
	    }
	    else
	    {
		$data = "00000000";
	    }
	}
	$data_little = $data;
	$data_little =~ s/(.{2})/$1\;/g;
	@str = split(/\;/, $data_little);
	foreach $str (@str)
	{
	    print DRAM_HEADER "0x", $str, ",";
	}
#	@str = reverse(@str);
#	undef($data_little);
#	foreach $str (@str)
#	{
#	    $data_little .= $str;
#	}
	$line = &hex_to_ascii($data);
	$line =~ s/\n/^n/g;
	printf(DATA_TXT_FILE "%04x - %s - %s\n", ($count*4), $data, $line);
	$count++;
	print BIG_ENDIAN_DATA &hex_to_ascii($data);
#	print LITTLE_ENDIAN_DATA &hex_to_ascii($data_little);
	print DRAM_HEADER "\n";
    }
    print DRAM_HEADER "};\n";
    close DRAM_HEADER;
    close DATA_TXT_FILE;
#    close LITTLE_ENDIAN_DATA;
    close BIG_ENDIAN_DATA;
}

sub check_total()
{
    if(@_[0] == ($data_align/8))
    {
	push @Memory, $data_line;
	undef($data_line);
	$end_of_memory += ($data_align/8);
	return(0);
    }
    else
    {
	return(@_[0]);
    }
}

sub check_calls()
{
    for($call_check=0;$call_check<=$#output;$call_check++)
    {
	($inst_add, $syll, $opc_na) = split(/ - /, $output[$call_check]);
	if(($opc_na =~ /^CALL\|/) && ($opc_na !~ /exit/))
	{
	    $syll_check = $syll >> 31;
	    if($syll_check != 1)
	    {
		if($output[$call_check+1] =~ /32bit/)
		{
		    push @stored, splice(@output, $call_check, 1);
		    push @stored, splice(@output, $call_check, 1);
		}
		else
		{
		    push @stored, splice(@output, $call_check, 1);
		}
		($inst_add, $syll, $opc_na) = split(/ - /, $stored[0]);
		$start_check = hex($inst_add);
		$times_round = 0;
		while($#stored >= 0)
		{
		    ($inst_add, $syll, $opc_na) = split(/ - /, $output[$call_check]);
		    $syll_check = $syll >> 31;
		    if($syll_check == 1)
		    {
			$syll &= 0x7FFFFFFF;
			$inst_add = sprintf("%04x", ($start_check + $times_round));
			splice(@output, $call_check, 1, "$inst_add - $syll - $opc_na");
			($inst_add, $syll, $opc_na) = split(/ - /, $stored[0]);
			$syll |= 0x80000000;
			$inst_add = sprintf("%04x", ($start_check + $times_round + 1));
			$stored[0] = "$inst_add - $syll - $opc_na";
			if($#stored > 0)
			{
			    ($inst_add, $syll, $opc_na) = split(/ - /, $stored[1]);
			    $inst_add = sprintf("%04x", ($start_check + $times_round + 2));
			    $stored[1] = "$inst_add - $syll - $opc_na";
			}
			splice(@output, $call_check+1, 0, @stored);
			@stored = @empty;
		    }
		    else
		    {
			$inst_add = sprintf("%04x", ($start_check + $times_round));
			splice(@output, $call_check, 1, "$inst_add - $syll - $opc_na");
		    }
		    $call_check++;
		    $times_round += 4;
		}
		undef($times_round);
		undef($call_check);
	    }
	}
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
