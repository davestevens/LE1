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
	else
	{
	    $input_file = $arg;
	}
    }
    print "mem align: $mem_align\n";
    if(-e $input_file)
    {
	($output_file) = split(/\./, $input_file);
	$output_file_inst = $output_file . ".s.bin";
	$output_file_inst_readable = $output_file . ".inst.txt";
	$output_file_data = $output_file . ".data.bin";
	$output_file_data_readable = $output_file . ".data.txt";
	$output_header_file_inst = $output_file . ".inst.forXilinx.h";
	$output_header_file_data = $output_file . ".data.forXilinx.h";
	$output_data_le1_vars = $output_file . "_le1_objects.h";
	&grab_data($input_file);
	&second_pass();
	if($ok == 1)
	{
	    &print_instructions($output_file_inst, $output_file_inst_readable, $output_header_file_inst, $output_header_file_inst);
	    &print_data($output_file_data, $output_file_data_readable, $output_header_file_data, $output_data_le1_vars);
	open LABELS_FILE, "> temp_instruction_labels.h" or die;
	open LABELS_FILE_EXT, "> temp_instruction_labels_ext.h" or die;
	print LABELS_FILE "#ifndef _GUARD_LABELS_FILE\n#define _GUARD_LABELS_FILE\n";
	foreach $key (%Inst_Label)
	{
	    if(($Inst_Label{$key} ne "") && ($key =~ /^FUNC/))
	    {
		printf(LABELS_FILE "unsigned int PC_%s = 0x%x;\n", $key, ($Inst_Label{$key} * 4));
		printf(LABELS_FILE_EXT "extern unsigned int PC_%s;\n", $key);
	    }
	}
	print LABELS_FILE "#endif\n";
	close LABELS_FILE_EXT;
	close LABELS_FILE;
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
	elsif($in_file[$i] =~ /Instruction Labels$/)
	{
	    $i++;
	    while($in_file[$i] !~ /^\n/)
	    {
		chomp($in_file[$i]);
		($address, $label) = split(/ \- /, $in_file[$i]);
		if(defined($address))
		{
		    $Inst_Label{$label} = (hex($address)/4);
		    undef($address);
		}
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
		    $Data_Label{$label} = hex($address);
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
		    $Data_Label{$label} = (hex($address) + $total_data);
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
$hash_define = "#define label0x0_start 0\n";
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

    if($opcode_name =~ /^ASM,(\d+)/)
    {
	$custom_instid = $1;
	$syllable |= $custom_instid << 9;
	$syllable |= 1 << 7;
	$syllable |= 1 << 26;
	for($custom_count=2;$custom_count<=$#ops;$custom_count++)
	{
	    if($ops[$custom_count] eq "=")
	    {
		$left_side = $custom_count - 2;
		$right_side = $#ops - ($custom_count);
		last;
	    }
	}
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
	elsif(($left_side + $right_side) == 3)
	{
	    $syllable &= 0xc0000000;
	    $syllable |= 4 << 26;
	    #$syllable |= $custom_instid << 21;
	    $syllable |= 15 << 21;
	    $syllable |= 0 << 25;
	    #$syllable |= $custom_instid << 12;
	    if($left_side == 1)
	    {
		$syllable |= 1 << 12;
		$ops[4] =~ /$reg2/;
		$syllable |= $3 << 6;
		$ops[5] =~ /$reg2/;
		$syllable |= $3;
	    }
	    else
	    {
		$syllable |= 2 << 12;
		$ops[5] =~ /$reg2/;
		$syllable |= $3;
		$ops[3] =~ /$reg2/;
		$syllable |= $3 << 6;
	    }
	    $ops[2] =~ /$reg2/;
	    $syllable |= $3 << 15;
	}
	if(($left_side + $right_side) != 3)
	{
	    $syllable2 |= ($left_side - 1) << 30;
	    $reg2 = '\$([rbl])(\d+)\.(\d+)';
	    $ops[2] =~ /$reg2/;
	    $syllable |= $3 << 15;
	    for($custom_count2 = 3; $custom_count2 < $custom_count;$custom_count2++)
	    {
		if($custom_count2 == 3)
		{
		    $ops[$custom_count2] =~ /$reg2/;
		    $syllable |= $3;
		}
		else
		{
		    $ops[$custom_count2] =~ /$reg2/;
		    $syllable2 |= $3 << (32 - (($custom_count2 - 4) * 6) - 8);
		}
	    }
	    for($custom_count2 = ($custom_count + 1);$custom_count2<=$#ops;$custom_count2++)
	    {
		if($custom_count2 == 9)
		{
		    $ops[$custom_count2] =~ /$reg2/;
		    $syllable |= $3;
		}
		else
		{
		    $cust_c = $custom_count2 - $custom_count;
		    $ops[$custom_count2] =~ /$reg2/;
		    $syllable2 |= $3 << (($cust_c - 1) * 6);
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
    $test_address = 0;
    open INST_FILE, "> @_[0].big" or die
	"Second Pass Failed\nCould not open file (@_[0].big : $!)\n";
    open INST_FILE2, "> @_[0]\.little" or die
	"Second Pass Failed\nCould not open file (@_[0].little : $!)\n";

    open INST_FILE_HEADER, "> @_[3]" or die
	"Second Pass Failed\nCould not open file (@_[3]): $!\n";
    $_[3] =~ /^(\w+)/;
    print INST_FILE_HEADER "/* inst area */\nchar $1\_i[] = {\n";
    $instruction_size = 0;
    open INST_FILE_READ, "> @_[1]" or die
	"Second Pass Failed\nCould not open file (@_[1] : $!)\n";
    open INST_FILE_READ2, "> @_[1]\.stripped" or die
	"Second Pass Failed\nCould not open file (@_[1].stripped : $!)\n";
    open IMMS, "> immediates.txt" or die;
	"Second Pass Failed\nCould not open file (immediates.txt : $!)\n";
    open INST_DEFINES, "> temp_simulator_defines.h" or die;
	"Second Pass Failed\nCould not open file (temp_simulator_defines.h : $!)\n";
    print INST_DEFINES $hash_define;
#    open SIMULATOR, "> temp_simulator.c" or die
#	"Second Pass Failed\nCould not open file (temp_simulator : $!)\n";
#    print SIMULATOR<<HEADER;
    $simulator_header =<<HEADER;
/* Simulator file, created by assembler */
/**/#include <stdio.h>
/**/#include <string.h>
/**/#include "includes.h"
/**/#include "temp_data_labels_ext.h"
/**/#include "temp_functions.h"
/**/#include "macros.h"
/**/#include "temp_instruction_labels_ext.h"
/**/#include "forq.h"
/**/#include "temp_simulator_defines.h"
extern int find_free_thread(void);
extern unsigned int cntxt, hcntxt;
extern int queue_switch;
extern void _printf(char*, char*);
extern unsigned int check_bundles(unsigned int, unsigned int, unsigned int, unsigned int);

HEADER
    $return_count = 0;
for($outting=0;$outting<=$#output;$outting++)
{
    $syllable = 0;
    #$previous_function = $current_function;
    if($output[$outting] =~ /\/\* FUNCTION \*(.+) \*\//)
    {
	#$current_function = $1;
	print SIMULATOR "/* $fileStart{$1} */\n";
	if($fileStart{$1} ne "")
	{
	    close SIMULATOR;
	    $sim_file = "temp_simulator_" . $fileStart{$1} . ".c";
	    open SIMULATOR, "> $sim_file" or die
		"Second Pass Failed\nCould not open file ($sim_file : $!)\n";
	    print SIMULATOR $simulator_header;
	}
	if($nftr)
	{
	    print SIMULATOR "/* END OF FUNCTION */\n\n";
	    @are_there_args = split(/\n/, $output[$outting]);
	    $are_there_args = "";
	    $non_args = "";
	    foreach $ata (@are_there_args)
	    {
		if($ata =~ /^sim_/)
		{
		    $are_there_args .= "\t\t$ata\n";
		}
		else
		{
		    $non_args .= $ata;
		}
	    }
	    if($are_there_args eq "")
	    {
		print SIMULATOR $output[$outting], "\n";
	    }
	    else
	    {
		print SIMULATOR $non_args, "\n";
	    }
	}
	else
	{
	    @are_there_args = split(/\n/, $output[$outting]);
	    $are_there_args = "";
	    $non_args = "";
	    foreach $ata (@are_there_args)
	    {
		if($ata =~ /^sim_/)
		{
		    $are_there_args .= "\t\t$ata\n";
		}
		else
		{
		    $non_args .= $ata . "\n";
		}
	    }
	    if($are_there_args eq "")
	    {
		print SIMULATOR $output[$outting], "\n";
	    }
	    else
	    {
		print SIMULATOR $non_args, "\n";
		print SIMULATOR $are_there_args, "\n";
	    }
	    $nftr = 1;
	}
    }
    elsif($output[$outting] =~ /^--/)
    {
	$output[$outting] =~ s/^\-\-(.+)/$1:/;
	$output[$outting] =~ s/^\s+//;
	print SIMULATOR "/* ", $output[$outting], " */\n";
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
	if($type eq "CALL")
	{
	    ($operation, $pthread_thing) = split(/\s+:STOP:\s+/, $operation);
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
	    if($pthread_thing ne "")
	    {
		$operation .= " :PTHREAD: $pthread_thing";
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
	    printf(IMMS "%04x - ADDEDNOP\n", ($address * 4));
	}
	elsif($type =~ /NOP/)
	{
	    printf(IMMS "%04x - NOP\n", ($address * 4));
	}
	if($type =~ /32bit/)
	{
	    if($operation =~ /MOVFUNCNAME(.+)/)
	    {
		$syllable = ($Inst_Label{"FUNC_$1"} * 4);
		printf(IMMS "%04x - $syllable\n", ($address *4 ));
	    }
	    else
	    {
		printf(IMMS "%04x - $syllable\n", ($address * 4));
	    }
	}
	printf(INST_FILE_READ "%04x - %032b - %08x - %s %s\n", ($address*4),$syllable, $syllable, $type, $operation);
	printf(INST_FILE_READ2 "%s\n", $operation);
	$args_source[0] = 0;
	$args_source[1] = 0;
	$args_source[2] = 0;
	$dest_type1 = 0;
	$dest_addr1 = 0;
	$dest_data1 = 0;
	$dest_type2 = 0;
	$dest_addr2 = "_NUL_iss";
	$dest_data2 = 0;
	$for_sim = $operation;
	$bundle_count++;
	if($for_sim =~ /return/)
	{
	    $op_addr = sprintf("0x%x", ($test_address * 4));
	    if($sim_needs_a_clock)
	    {
		print SIMULATOR "\n\t/* CLOCK */\n\tvoid *label$op_addr(void)\n\t{\n";
		$current_label_for_hash_define = "label$op_addr";
		push @Functions, "void *label$op_addr(void);";
		if($return_values ne "")
		{
		    print SIMULATOR "if(!this_is_a_goto[cntxt][hcntxt])\n{\n";
		    print SIMULATOR $return_values;
		    print SIMULATOR "}\nelse\n{\nthis_is_a_goto[cntxt][hcntxt] = 0;\n}\n";

		    $return_values = "";
		}
		if($are_there_args ne "")
		{
		    print SIMULATOR $are_there_args;
		    $are_there_args = "";
		}
		print SIMULATOR "\t\tif(!checked[cntxt][hcntxt])\n\t\t{\n\t\t\tif(check_bundles(cntxt, hcntxt, ", $current_label_for_hash_define , "_start, ", $current_label_for_hash_define , "_end))\n\t\t\t{\n\t\t\t\tchecked[cntxt][hcntxt] = 1;\n\t\t\t\treturn 0;\n\t\t\t}\n\t\t}\n\t\tchecked[cntxt][hcntxt] = 0;\n";
		print SIMULATOR "\t\t\n\t\tCYCLE_INCREMENT(cntxt, hcntxt);\n";
		print INST_DEFINES "#define ", $current_label_for_hash_define, "_start ", $test_address, "\n";
		$sim_needs_a_clock = 0;
	    }
	    $op_syll = sprintf("0x%x", ($syllable & 0xffffffff));
	    $sim_op = "RETURN";
	    print SIMULATOR "\t\tif(queue_switch)\n\t\t{\t\t\tPushMessageToQueue(msqid[cntxt][hcntxt], CCount[cntxt][hcntxt], -1, _NUL_iss, 0, $sim_op, $op_addr, sim_l[cntxt][hcntxt][0][0], sim_r[cntxt][hcntxt][0][1], $op_syll, 0, 0, 0, 0, _NUL_iss, 0);\n\t\t}\n";
	    $for_sim =~ /return\s+\$r0\.1\s+=\s+\$r0\.1,\s+\((0x\w+)\),\s+\$l0\.0/;
	    print SIMULATOR "\t\tsim_r[cntxt][hcntxt][0][1] += $1;\n";
	    $return_args = $return_args[$return_count++];
	    $return_args =~ /^\.return ret\((.*)\)/;
	    $temp_return_args = $1;
	    print SIMULATOR "//RET $1\n";
	    @returns_args = split(/,/, $temp_return_args);
	    $returns_count = 0;
	    if($#returns_args > -1)
	    {
		foreach $return_arg (@returns_args)
		{
		    ($return_reg, $return_type) = split(/:/, $return_arg);
		    if($return_reg =~ /\$([rbl])(\d+)\.(\d+)/)
		    {
			print SIMULATOR "\t\tpass_arguments[cntxt][hcntxt].rets.ret[$returns_count] = sim_$1", "[cntxt][hcntxt][$2][$3];\n";
		    }
		    elsif($return_reg =~ /(0x\w+)/)
		    {
			print SIMULATOR "\t\tpass_arguments[cntxt][hcntxt].rets.ret[$returns_count] = $1;\n";
		    }
		    else
		    {
			print SIMULATOR "// UNKNOWN: $return_reg\n";
		    }
		    $returns_count++;
		}
	    }
	    $to_return = "\t\tlifocnt[cntxt][hcntxt]--;\n\t\tunsigned int tmp = lifocnt[cntxt][hcntxt];\n\t\tstrcpy(next_pc[cntxt][hcntxt], where_to_return[cntxt][hcntxt][tmp]);\nreturn 0;\n\t}\n";
	}
	elsif($for_sim =~ /c(\d+)\s+(\w+\.?\w*)\s+(.+)/)
	{
	    $op_addr = sprintf("0x%x", ($test_address * 4));
	    if($sim_needs_a_clock)
	    {
		print SIMULATOR "\n\t/* CLOCK */\n\tvoid *label$op_addr(void)\n\t{\n";
		$current_label_for_hash_define = "label$op_addr";
		push @Functions, "void *label$op_addr(void);";
		if($return_values ne "")
		{
		    print SIMULATOR "if(!this_is_a_goto[cntxt][hcntxt])\n{\n";
		    print SIMULATOR $return_values;
		    print SIMULATOR "}\nelse\n{\nthis_is_a_goto[cntxt][hcntxt] = 0;\n}\n";

		    $return_values = "";
		}
		if($are_there_args ne "")
		{
		    print SIMULATOR $are_there_args;
		    $are_there_args = "";
		}
		print SIMULATOR "\t\tif(!checked[cntxt][hcntxt])\n\t\t{\n\t\t\tif(check_bundles(cntxt, hcntxt, ", $current_label_for_hash_define , "_start, ", $current_label_for_hash_define , "_end))\n\t\t\t{\n\t\t\t\tchecked[cntxt][hcntxt] = 1;\n\t\t\t\treturn 0;\n\t\t\t}\n\t\t}\n\t\tchecked[cntxt][hcntxt] = 0;\n";
		print SIMULATOR "\t\t\n\t\tCYCLE_INCREMENT(cntxt, hcntxt);\n";
		print INST_DEFINES "#define ", $current_label_for_hash_define, "_start ", $test_address, "\n";
		$sim_needs_a_clock = 0;
	    }
	    $sim_cluser = $1;
	    $sim_op = uc($2);
	    $sim_inputs = $3;
	    ($sim_dest, $sim_arg) = split(/\s*=\s*/, $sim_inputs);
	    @sim_dests = split(/\s*,\s*/, $sim_dest);
	    if($sim_dests[0] =~ /^\$([rbl])(\d+)\.(\d+)/)
	    {
		$dest_type1 = "_" . uc($1) . "_iss";
		$dest_addr1 = $3;
	    }
	    elsif($sim_dests[0] =~ /^(\d+)\[(.+)\]$/)
	    {
		$sim_dests[0] = "stack_bottom + " . $2 . " + " . $1;
		$dest_type1 = "_MEM_iss";
		$dest_addr1 = -1;
	    }
	    elsif($sim_dests[0] =~ /^0x(\w+)\[(.+)\]$/)
	    {
		$sim_dests[0] = "stack_bottom + " . $2 . " + 0x" . $1;
		$dest_type1 = "_MEM_iss";
		$dest_addr1 = -1;
	    }
	    elsif($sim_dests[0] =~ /^(\(.+)\)\[(.+)\]$/)
	    {
		$sim_dests[0] = $1 . "+ stack_bottom + " . $2 . ")";
		$dest_type1 = "_MEM_iss";
		$dest_addr1 = -1;
	    }
	    $sim_dests[0] =~ s/\s+$//;
	    $sim_dests[0] =~ s/\$([rbl])(\d+)\.(\d+)/sim_$1\[cntxt\]\[hcntxt\]\[$2\]\[$3\]/g;
	    $sim_dests[0] =~ s/\./X/g;
	    $sim_dests[0] =~ s/\?/X/g;
	    $sim_in .= $sim_dests[0];# . ", ";
	    if($dest_addr1 == -1)
	    {
		$dest_addr1 = $sim_dests[0];
		$dest_addr1 =~ s/stack_bottom\s+\+\s+//;
		$dest_data1 = "FROM_SOURCES";
	    }
	    else
	    {
		$dest_data1 = $sim_dests[0];
	    }
	    if($#sim_dests > 0)
	    {
		if($sim_dests[1] =~ /^\$([rbl])(\d+)\.(\d+)/)
		{
		    $dest_type2 = "_" . uc($1) . "_iss";
		    $dest_addr2 = $3;
		}
		else
		{
		    $dest_type2 = "_MEM_iss";
		    $dest_addr2 = -1;
		}
		$sim_dests[1] =~ s/\s+$//;
		$sim_dests[1] =~ s/\$([rbl])(\d+)\.(\d+)/sim_$1\[cntxt\]\[hcntxt\]\[$2\]\[$3\]/g;
		$sim_dests[1] =~ s/\./X/g;
		$sim_dests[1] =~ s/\?/X/g;
		$sim_in .= ", " . $sim_dests[1];
		if($dest_addr2 == -1)
		{
		    $dest_addr2 = $sim_dests[1];
		    $dest_addr2 =~ s/^(\w+)\[(.+)\]$/$2 + $1/;
		    $dest_data2 = "FROM_SOURCES";
		}
		else
		{
		    $dest_data2 = $sim_dests[1];
		}
	    }
	    @sim_args = split(/\s*,\s*/, $sim_arg);
	    for($sim_count=0;$sim_count<=$#sim_args;$sim_count++)
	    {
		if($sim_count == 0)
		{
		    $sim_in .= ", ";
		}
		$sim_args[$sim_count] =~ s/\s+$//;
		$sim_args[$sim_count] =~ s/\$([rbl])(\d+)\.(\d+)/sim_$1\_prev\[cntxt\]\[hcntxt\]\[$2\]\[$3\]/g;
		$sim_args[$sim_count] =~ s/\./X/g;
		$sim_args[$sim_count] =~ s/\?/X/g;
		if($sim_args[$sim_count] =~ /^(-?\d+)$/)
		{
		    $sim_args[$sim_count] = sprintf("0x%x", ($1 & 0xffffffff));
		    $args_source[$sim_count] = $sim_args[$sim_count];
		}
		elsif($sim_args[$sim_count] =~ /^(\d+)\[(.+)\]$/)
		{
		    $sim_args[$sim_count] = "stack_bottom + " . $2 . " + " . $1;
		    $args_source[$sim_count] = $2 . " + " . $1;
		}
		elsif($sim_args[$sim_count] =~ /^0x(\w+)\[(.+)\]$/)
		{
		    $sim_args[$sim_count] = "stack_bottom + " . $2 . " + 0x" . $1;
		    $args_source[$sim_count] = $2 . " + 0x" . $1;
		}
		elsif($sim_args[$sim_count] =~ /^(\(.+)\)\[(.+)\]$/)
		{
		    $sim_args[$sim_count] = $1 . " + stack_bottom + " . $2 . ")";
		    $args_source[$sim_count] = $1 . " + " . $2 . ")";
		}
		else
		{
		    $args_source[$sim_count] = $sim_args[$sim_count];
		}
		$sim_in .= "$sim_args[$sim_count]";
		if($sim_count < $#sim_args)
		{
		    $sim_in .= ", ";
		}
		if(($sim_count == 0) && ($dest_data1 eq "FROM_SOURCES"))
		{
		    $dest_data1 = $args_source[0];
		}
		if(($sim_count == 0) && ($dest_data2 eq "FROM_SOURCES"))
		{
		    $dest_data2 = $args_source[0];
		}
	    }
	    if($sim_op =~ /(\w+)\.\w+/)
	    {
		$sim_op = $1;
	    }
	    $cp_of_sim_op = $sim_op;
	    $cp_of_sim_op =~ s/^LD(\w+)/LD$1\_iss/;
	    $cp_of_sim_op =~ s/^ST(\w+)/ST$1\_iss/;

	    if($cp_of_sim_op =~ /^ST(\w+)/)
	    {
		# need to make sure all registers are previous ones
		$sim_in =~ s/sim_(\w)\[/sim_$1_prev\[/g;
	    }

	    $op_syll = sprintf("0x%x", ($syllable & 0xffffffff));
	    if(($cp_of_sim_op =~ /^ST(\w+)_iss/) || ($cp_of_sim_op =~ /^LD(\w+)_iss/))
	    {
		$temp_sim_input = "\t\t" . $cp_of_sim_op . "(" . $sim_in . ", cntxt, hcntxt);";
	    }
	    else
	    {
		$temp_sim_input = "\t\t" . $cp_of_sim_op . "(" . $sim_in . ");";
	    }
	    $sim_in = "";
	    print SIMULATOR "$temp_sim_input\n";
	    #print SIMULATOR "/* MEH, PROBABLY HERE */\n";
	    if(($sim_op eq "MOV") && (((($syllable >> 26) & 0xf) == 1) || ((($syllable >> 26) & 0xf) == 2)))
	    {
		print SIMULATOR "\t\tif(queue_switch)\n\t\t{\t\t\tPushMessageToQueue(msqid[cntxt][hcntxt], CCount[cntxt][hcntxt], $dest_addr1, $dest_type1, $dest_data1, $sim_op, $op_addr, sim_l[cntxt][hcntxt][0][0], sim_r[cntxt][hcntxt][0][1], $op_syll, $args_source[1], $args_source[0], $args_source[2], $dest_type2, $dest_addr2, $dest_data2);\n\t\t}\n";
	    }
	    else
	    {
		print SIMULATOR "\t\tif(queue_switch)\n\t\t{\t\t\tPushMessageToQueue(msqid[cntxt][hcntxt], CCount[cntxt][hcntxt], $dest_addr1, $dest_type1, $dest_data1, $sim_op, $op_addr, sim_l[cntxt][hcntxt][0][0], sim_r[cntxt][hcntxt][0][1], $op_syll, $args_source[0], $args_source[1], $args_source[2], $dest_type2, $dest_addr2, $dest_data2);\n\t\t}\n";
	    }
	}
	elsif($for_sim =~ /imm\s+(\d+)/)
	{
	    $bundle_count--;
	    $imm_syll = sprintf("0x%x", ($1 & 0xffffffff));
	    $imm_addr = sprintf("0x%x", ($test_address * 4));
	    print SIMULATOR "\t\t/* Immediate: $imm_syll */\n\t\tif(queue_switch)\n\t\t{\t\t\tPushMessageToQueue(msqid[cntxt][hcntxt], CCount[cntxt][hcntxt], -1, -1, $imm_syll, -1, $imm_addr, -1, -1, $imm_syll, 0, 0, 0, 0, _NUL_iss, 0);\n\t\t}\n";
	    if($need_a_clock_after_imm)
	    {
		$next_pc_address = sprintf("0x%x", (($test_address + 1) * 4));
		print SIMULATOR "\n\t\tBUNDLE_COUNT(cntxt, hcntxt, $bundle_count);\n";
		print INST_DEFINES "#define ", $current_label_for_hash_define, "_end ", $test_address, "\n";
		$bundle_count = 0;
		$need_a_clock_after_imm = 0;
		if($to_branch ne "")
		{
		    print SIMULATOR $to_branch;
		    $to_branch = "";
		}
		if($to_goto ne "")
		{
		    print SIMULATOR $to_goto;
		    $to_goto = "";
		}
		elsif($to_call ne "")
		{
		    print SIMULATOR $to_call;
		    $to_call = "";
		}
		elsif($to_return ne "")
		{
		    print SIMULATOR $to_return;
		    $to_return = "";
		}
		else
		{
		    print SIMULATOR "\t\tstrcpy(next_pc[cntxt][hcntxt], \"label$next_pc_address\"); /* 1 */\n\t\treturn 0;\n\t}\n";
		}
	    }
	}
	elsif($for_sim =~ /imm\s+MOVFUNCNAME(.+)/)
	{
	    $bundle_count--;
	    $imm_syll = sprintf("0x%x", (($Inst_Label{"FUNC_$1"} * 4) & 0xffffffff));
	    $imm_addr = sprintf("0x%x", ($test_address * 4));
	    print SIMULATOR "\t\t/* Immediate: $imm_syll */\n\t\tif(queue_switch)\n\t\t{\t\t\tPushMessageToQueue(msqid[cntxt][hcntxt], CCount[cntxt][hcntxt], -1, -1, $imm_syll, -1, $imm_addr, -1, -1, $imm_syll, 0, 0, 0, 0, _NUL_iss, 0);\n\t\t}\n";
	    if($need_a_clock_after_imm)
	    {
		$next_pc_address = sprintf("0x%x", (($test_address + 1) * 4));
		print SIMULATOR "\n\t\tBUNDLE_COUNT(cntxt, hcntxt, $bundle_count);\n";
		print INST_DEFINES "#define ", $current_label_for_hash_define, "_end ", $test_address, "\n";
		$bundle_count = 0;
		$need_a_clock_after_imm = 0;
		if($to_branch ne "")
		{
		    print SIMULATOR $to_branch;
		    $to_branch = "";
		}
		if($to_goto ne "")
		{
		    print SIMULATOR $to_goto;
		    $to_goto = "";
		}
		elsif($to_call ne "")
		{
		    print SIMULATOR $to_call;
		    $to_call = "";
		}
		elsif($to_return ne "")
		{
		    print SIMULATOR $to_return;
		    $to_return = "";
		}
		else
		{
		    print SIMULATOR "\t\tstrcpy(next_pc[cntxt][hcntxt], \"label$next_pc_address\"); /* 2 */\n\t\treturn 0;\n\t}\n";
		}
	    }
	}
	elsif($for_sim =~ /NOP/)
	{
	    $nop_addr = sprintf("0x%x", ($test_address * 4));
	    $next_pc_address = sprintf("0x%x", (($test_address + 1) * 4));
	    $nop_syll = sprintf("0x%x", ($syllable & 0xffffffff));
	    $current_label_for_hash_define = "label$nop_addr";
	    print SIMULATOR "\t/* NOP */\n\tvoid *label$nop_addr(void)\n\t{\n";
	    print SIMULATOR "\t\tif(!checked[cntxt][hcntxt])\n\t\t{\n\t\t\tif(check_bundles(cntxt, hcntxt, ", $current_label_for_hash_define , "_start, ", $current_label_for_hash_define , "_end))\n\t\t\t{\n\t\t\t\tchecked[cntxt][hcntxt] = 1;\n\t\t\t\treturn 0;\n\t\t\t}\n\t\t}\n\t\tchecked[cntxt][hcntxt] = 0;\n";
	    print SIMULATOR "\t\t\n\t\tCYCLE_INCREMENT(cntxt, hcntxt);\n\t\tNOP(cntxt, hcntxt);\n\t\tif(queue_switch)\n\t\t{\t\t\tPushMessageToQueue(msqid[cntxt][hcntxt], CCount[cntxt][hcntxt], -1, _NUL_iss, 0, NOP, $nop_addr, sim_l[cntxt][hcntxt][0][0], sim_r[cntxt][hcntxt][0][1], $nop_syll, 0, 0, 0, 0, _NUL_iss, 0);\n\t\t}\n\n\t\tBUNDLE_COUNT(cntxt, hcntxt, $bundle_count);\n";
	    print INST_DEFINES "#define ", $current_label_for_hash_define, "_start ", $test_address, "\n";
	    print INST_DEFINES "#define ", $current_label_for_hash_define, "_end ", $test_address, "\n";
	    push @Functions, "void *label$nop_addr(void);";
		$bundle_count = 0;
		$need_a_clock_after_imm = 0;
		if($to_branch ne "")
		{
		    print SIMULATOR $to_branch;
		    $to_branch = "";
		}
		if($to_goto ne "")
		{
		    print SIMULATOR $to_goto;
		    $to_goto = "";
	}
		elsif($to_call ne "")
		{
		    print SIMULATOR $to_call;
		    $to_call = "";
		}
		elsif($to_return ne "")
		{
		    print SIMULATOR $to_return;
		    $to_return = "";
		}
	    else
	    {
		print SIMULATOR "\t\tstrcpy(next_pc[cntxt][hcntxt], \"label$next_pc_address\"); /* 3 */\n\t\treturn 0;\n\t}\n";
	    }
	    $bundle_count = 0;
	}
	elsif($for_sim =~ /goto\s+(.+)/)
	{
	    $op_addr = sprintf("0x%x", ($test_address * 4));
	    if($sim_needs_a_clock)
	    {
		print SIMULATOR "\n\t/* CLOCK */\n\tvoid *label$op_addr(void)\n\t{\n";
		$current_label_for_hash_define = "label$op_addr";
		push @Functions, "void *label$op_addr(void);";
		if($return_values ne "")
		{
		    print SIMULATOR "if(!this_is_a_goto[cntxt][hcntxt])\n{\n";
		    print SIMULATOR $return_values;
		    print SIMULATOR "}\nelse\n{\nthis_is_a_goto[cntxt][hcntxt] = 0;\n}\n";

		    $return_values = "";
		}
		if($are_there_args ne "")
		{
		    print SIMULATOR $are_there_args;
		    $are_there_args = "";
		}
		print SIMULATOR "\t\tif(!checked[cntxt][hcntxt])\n\t\t{\n\t\t\tif(check_bundles(cntxt, hcntxt, ", $current_label_for_hash_define , "_start, ", $current_label_for_hash_define , "_end))\n\t\t\t{\n\t\t\t\tchecked[cntxt][hcntxt] = 1;\n\t\t\t\treturn 0;\n\t\t\t}\n\t\t}\n\t\tchecked[cntxt][hcntxt] = 0;\n";
		print SIMULATOR "\t\t\n\t\tCYCLE_INCREMENT(cntxt, hcntxt);\n";
		print INST_DEFINES "#define ", $current_label_for_hash_define, "_start ", $test_address, "\n";
		$sim_needs_a_clock = 0;
	    }
	    $where_to_go = $1;
	    $sim_op = "GOTO";
	    $op_syll = sprintf("0x%x", ($syllable & 0xffffffff));
	    print SIMULATOR "\t\tif(queue_switch)\n\t\t{\t\t\tPushMessageToQueue(msqid[cntxt][hcntxt], CCount[cntxt][hcntxt], -1, _NUL_iss, 0, $sim_op, $op_addr, sim_l[cntxt][hcntxt][0][0], sim_r[cntxt][hcntxt][0][1], $op_syll, 0, 0, 0, 0, _NUL_iss, 0);\n\t\t}\n";
	    $which_pc_to_goto = sprintf("0x%x", ($Inst_Label{$where_to_go} * 4));
	    $to_goto = "\t\tstrcpy(next_pc[cntxt][hcntxt], \"label$which_pc_to_goto\");\n\t\tthis_is_a_goto[cntxt][hcntxt] = 1;\n\t\treturn 0;\n\t}\n";
	}
	elsif($for_sim =~ /\.?call\s+(.+)/)
	{
	    $op_addr = sprintf("0x%x", ($test_address * 4));
	    $next_pc_address = sprintf("0x%x", (($test_address + 1) * 4));
	    if($sim_needs_a_clock)
	    {
		print SIMULATOR "\n\t/* CLOCK */\n\tvoid *label$op_addr(void)\n\t{\n";
		$current_label_for_hash_define = "label$op_addr";
		push @Functions, "void *label$op_addr(void);";
		if($return_values ne "")
		{
		    print SIMULATOR "if(!this_is_a_goto[cntxt][hcntxt])\n{\n";
		    print SIMULATOR $return_values;
		    print SIMULATOR "}\nelse\n{\nthis_is_a_goto[cntxt][hcntxt] = 0;\n}\n";

		    $return_values = "";
		}
		if($are_there_args ne "")
		{
		    print SIMULATOR $are_there_args;
		    $are_there_args = "";
		}
		print SIMULATOR "\t\tif(!checked[cntxt][hcntxt])\n\t\t{\n\t\t\tif(check_bundles(cntxt, hcntxt, ", $current_label_for_hash_define , "_start, ", $current_label_for_hash_define , "_end))\n\t\t\t{\n\t\t\t\tchecked[cntxt][hcntxt] = 1;\n\t\t\t\treturn 0;\n\t\t\t}\n\t\t}\n\t\tchecked[cntxt][hcntxt] = 0;\n";
		print SIMULATOR "\t\t\n\t\tCYCLE_INCREMENT(cntxt, hcntxt);\n";
		print INST_DEFINES "#define ", $current_label_for_hash_define, "_start ", $test_address, "\n";
		$sim_needs_a_clock = 0;
	    }
	    $sim_func = $1;
	    ($sim_func, $pthread_thing) = split(/\s+\:PTHREAD:\s+/, $sim_func);
	    $sim_op = "CALL";
	    $op_syll = sprintf("0x%x", ($syllable & 0xffffffff));
	    $new_link_reg = sprintf("0x%x", (($test_address + 1) * 4));
	    print SIMULATOR "/* CALL: $for_sim : $where_to_call PTHREAD_THING: $pthread_thing */\n";
	    if($pthread_thing ne "")
	    {
#		print SIMULATOR "\t\t/* THIS NEEDS A PTHREAD OP */\n";
#		print SIMULATOR "\t\tif(queue_switch)\n\t\t{\t\t\tPushMessageToQueue(msqid[cntxt][hcntxt], CCount[cntxt][hcntxt], -1, _NUL_iss, 0, CUSTOM, $op_addr, sim_l[cntxt][hcntxt][0][0], sim_r[cntxt][hcntxt][0][1], $op_syll, 0, 0, 0, 0, _NUL_iss, 0);\n\t\t}\n";
		$where_to_call =~ /\.call\s+(\w+),\s+caller,\s+arg\((.+;\s+)?(.+)/;#\),\s+ret\((.+)\)/;
		($sim_args, $sim_rets) = split(/\),\s+ret\(/, $3);
		$sim_rets =~ s/\)$//;
		$arg_count = 0;
		@sim_args = split(/,/, $sim_args);
		if($pthread_thing eq "CLOCK")
		{
		    print SIMULATOR "/* this is a clock call */\n";
		    @sim_rets = split(/,/, $sim_rets);
		    if($sim_rets[0] =~ /\$([rbl])(\d+)\.(\d+):\w+/)
		    {
			print SIMULATOR 'sim_' . $1 . '[cntxt][hcntxt][' . $2 . '][' . $3 . "] = (unsigned int)Cycle_Count;\n";
		    }
		    else
		    {
			print SIMULATOR "/* couldn't find a return variable */\n";
		    }
		    print SIMULATOR "\t\tif(queue_switch)\n\t\t{\t\t\tPushMessageToQueue(msqid[cntxt][hcntxt], CCount[cntxt][hcntxt], -1, _NUL_iss, 0, CUSTOM, $op_addr, sim_l[cntxt][hcntxt][0][0], sim_r[cntxt][hcntxt][0][1], $op_syll, 0, 0, 0, 0, _NUL_iss, 0);\n\t\t}\n";
		}
		elsif($pthread_thing eq "CALLTOLINKREG")
		{
		    print SIMULATOR "\t\t/* this is a goto link call - $where_to_call */\n";
		    $where_to_call =~ /caller,\s+arg\((.+)/;#\),\s+ret\((.+)\)/;
		    ($sim_args, $sim_rets) = split(/\),\s+ret\(/, $1);
		    $sim_rets =~ s/\)$//;
		    $arg_count = 0;
		    @sim_args = split(/,/, $sim_args);
		    foreach $sim_arg (@sim_args)
		    {
			if($sim_arg =~ /\$([rbl])(\d+)\.(\d+):\w+/)
			{
			    print SIMULATOR "\t\tpass_arguments[cntxt][hcntxt].args.arg[$arg_count] = sim_$1" . "\[cntxt\]\[hcntxt\]\[$2\]\[$3\];\n";
			    $arg_count++;
			}
		    }
		    $which_pc_to_call = sprintf("0x%x", ($Inst_Label{$sim_func} * 4));
		    $where_to_return_to = sprintf("0x%x", (($test_address + 1) * 4));
		    $to_goto =<<GOTO;
\t\tsim_l[cntxt][hcntxt][0][0] = $new_link_reg;
\t\tchar str[20];
\t\tsprintf(str, "label0x\%x", sim_l_prev[cntxt][hcntxt][0][0]);
\t\tstrcpy(next_pc[cntxt][hcntxt], str);
\t\tunsigned int tmp = lifocnt[cntxt][hcntxt];
\t\twhere_to_return[cntxt][hcntxt][tmp] = \"label$where_to_return_to\";
\t\tlifocnt[cntxt][hcntxt]++;
\t\tif(queue_switch)
\t\t{
\t\t\tPushMessageToQueue(msqid[cntxt][hcntxt], CCount[cntxt][hcntxt], -1, _NUL_iss, 0, CUSTOM, $op_addr, sim_l[cntxt][hcntxt][0][0], sim_r[cntxt][hcntxt][0][1], $op_syll, 0, 0, 0, 0, _NUL_iss, 0);
\t\t}
\t\treturn 0;
\t}
GOTO
		    $ret_count = 0;
		    @sim_rets = split(/,/, $sim_rets);
		    $return_values = "";
		    if($#sim_rets == -1)
		    {
			$return_values .= "\t\t/* no return values */\n";
		    }
		    foreach $sim_ret (@sim_rets)
		    {
			if($sim_ret  =~ /\$([rbl])(\d+)\.(\d+):\w+/)
			{
			    $return_values .= "\t\tsim_$1\[cntxt\]\[hcntxt\]\[$2\]\[$3\] = pass_arguments[cntxt][hcntxt].rets.ret[$ret_count];\n";
			    $return_values .= "\t\tsim_$1\_prev\[cntxt\]\[hcntxt\]\[$2\]\[$3\] = pass_arguments[cntxt][hcntxt].rets.ret[$ret_count];\n";
			    $ret_count++;
			}
		    }
		    $where_to_call = "";
		}
                elsif($pthread_thing eq "PRINTF")
                {
                    print SIMULATOR "/* this is a printf */\n";
		    $sim_args[0] =~ /\$([rbl])(\d+)\.(\d+):\w+/;
		    # need to check fo %s and %c as these come from memory and need the stack_bottom adding
		    &token_string();
		    print SIMULATOR "\t\tprintf((char *)(stack_bottom + ";
                    for($weee=0;$weee<=$#sim_args;$weee++)
                    {
                        $sim_args[$weee] =~ /\$([rbl])(\d+)\.(\d+):\w+/;
                        print SIMULATOR "sim_$1" . "\[cntxt\]\[hcntxt\]\[$2\]\[$3\]";
                        if($weee == 0)
                        {
                            print SIMULATOR ")";
                        }
			else
			{
			    print SIMULATOR " + check_args[", $weee - 1, "]";
			}
                        if($weee == $#sim_args)
                        {
                        }
                        else
                        {
                            print SIMULATOR ",\n\t\t";
                        }
                    }
                    print SIMULATOR "\t\t);\n";
		    print SIMULATOR "\t\tif(queue_switch)\n\t\t{\t\t\tPushMessageToQueue(msqid[cntxt][hcntxt], CCount[cntxt][hcntxt], -1, _NUL_iss, 0, CUSTOM, $op_addr, sim_l[cntxt][hcntxt][0][0], sim_r[cntxt][hcntxt][0][1], $op_syll, 0, 0, 0, 0, _NUL_iss, 0);\n\t\t}\n";
                }
                elsif($pthread_thing eq "FOPEN")
		{
                    print SIMULATOR "/* this is an fopen */\n";
		    # need to get ret
		    @sim_rets = split(/,/, $sim_rets);
		    $sim_rets[0] =~ /\$([rbl])(\d+)\.(\d+):\w+/;
		    print SIMULATOR "\t\tsim_$1" . "\[cntxt\]\[hcntxt\]\[$2\]\[$3\] = ";

		    $sim_args[0] =~ /\$([rbl])(\d+)\.(\d+):\w+/;
		    $args11 = $1;
		    $args12 = $2;
		    $args13 = $3;
		    $sim_args[1] =~ /\$([rbl])(\d+)\.(\d+):\w+/;
		    $args21 = $1;
		    $args22 = $2;
		    $args23 = $3;
		    print SIMULATOR "fopen( (char*) (stack_bottom + sim_$args11\[cntxt\]\[hcntxt\]\[$args12\]\[$args13\]), (char*) (stack_bottom + sim_$args21\[cntxt\]\[hcntxt\]\[$args22\]\[$args23\]) );\n";

		    $sim_rets[0] =~ /\$([rbl])(\d+)\.(\d+):\w+/;
		    # need to take stack_bottom from file pointer so that loads/stores use the correct address
		    print SIMULATOR "\t\t//printf(\"fp before: %p\\n\", sim_$1" . "\[cntxt\]\[hcntxt\]\[$2\]\[$3\]);\n";
		    print SIMULATOR "\t\tsim_$1" . "\[cntxt\]\[hcntxt\]\[$2\]\[$3\] -= (unsigned int)stack_bottom;\n";
		    print SIMULATOR "\t\t//printf(\"fp after: %p\\n\", sim_$1" . "\[cntxt\]\[hcntxt\]\[$2\]\[$3\]);\n";
		    print SIMULATOR "\t\t//printf(\"fp after: %p\\n\", (sim_$1" . "\[cntxt\]\[hcntxt\]\[$2\]\[$3\] + stack_bottom));\n";
		    print SIMULATOR "\t\tif(queue_switch)\n\t\t{\t\t\tPushMessageToQueue(msqid[cntxt][hcntxt], CCount[cntxt][hcntxt], -1, _NUL_iss, 0, CUSTOM, $op_addr, sim_l[cntxt][hcntxt][0][0], sim_r[cntxt][hcntxt][0][1], $op_syll, 0, 0, 0, 0, _NUL_iss, 0);\n\t\t}\n";
		}
                elsif($pthread_thing eq "FSCANF")
		{
                    print SIMULATOR "/* this is an fscanf */\n";
		    @sim_rets = split(/,/, $sim_rets);
		    $sim_rets[0] =~ /\$([rbl])(\d+)\.(\d+):\w+/;
		    $ret1 = $1;
		    $ret2 = $2;
		    $ret3 = $3;
		    
		    $sim_args[1] =~ /\$([rbl])(\d+)\.(\d+):\w+/;
		    # need to check fo %s and %c as these come from memory and need the stack_bottom adding
		    &token_string_scanf();
		    print SIMULATOR "\t\tsim_$ret1\[cntxt\]\[hcntxt\]\[$ret2\]\[$ret3\] = ";
                    print SIMULATOR "fscanf( (stack_bottom + ";
                    for($weee=0;$weee<=$#sim_args;$weee++)
                    {
                        if($sim_args[$weee] =~ /\$([rbl])(\d+)\.(\d+):\w+/)
			{
			        if($weee == 0)
				{
				    print SIMULATOR "sim_$1\[cntxt\]\[hcntxt\]\[$2\]\[$3\])";
				}
				    elsif($weee == 1)
				    {
					print SIMULATOR "(char *)(stack_bottom + sim_$1\[cntxt\]\[hcntxt\]\[$2\]\[$3\])";
				    }
				    else
				    {
					print SIMULATOR "(unsigned int)returnValOrAddr(sim_$1", '[cntxt][hcntxt][', $2, '][', $3, '], check_args[',( $weee - 2), '], &temp[', ($weee - 2), '])';
				    }

				    if($weee == $#sim_args)
				    {
				    }
				    else
				    {
					print SIMULATOR ",\n\t\t";
				    }
			}
                    }
                    print SIMULATOR "\t\t);\n";

                    for($weee=2;$weee<=$#sim_args;$weee++)
                    {
                        if($sim_args[$weee] =~ /\$([rbl])(\d+)\.(\d+):\w+/)
			{
			    print SIMULATOR "\t\tstoreValues(sim_$1\[cntxt\]\[hcntxt\]\[$2\]\[$3\], check_args\[", ($weee - 2), "\], temp\[", ($weee - 2), "\]);\n";
			}
                    }
		    
		    print SIMULATOR "\n";
		    print SIMULATOR "\t\tif(queue_switch)\n\t\t{\t\t\tPushMessageToQueue(msqid[cntxt][hcntxt], CCount[cntxt][hcntxt], -1, _NUL_iss, 0, CUSTOM, $op_addr, sim_l[cntxt][hcntxt][0][0], sim_r[cntxt][hcntxt][0][1], $op_syll, 0, 0, 0, 0, _NUL_iss, 0);\n\t\t}\n";
		}
                elsif($pthread_thing eq "FCLOSE")
		{
                    print SIMULATOR "/* this is an fclose */\n";
		    # need to get ret
		    @sim_rets = split(/,/, $sim_rets);
		    $sim_rets[0] =~ /\$([rbl])(\d+)\.(\d+):\w+/;
		    print SIMULATOR "\t\tsim_$1" . "\[cntxt\]\[hcntxt\]\[$2\]\[$3\] = ";

		    $sim_args[0] =~ /\$([rbl])(\d+)\.(\d+):\w+/;

		    print SIMULATOR "fclose( (char*) (stack_bottom + sim_$1\[cntxt\]\[hcntxt\]\[$2\]\[$3\]) );\n";
		    print SIMULATOR "\t\tif(queue_switch)\n\t\t{\t\t\tPushMessageToQueue(msqid[cntxt][hcntxt], CCount[cntxt][hcntxt], -1, _NUL_iss, 0, CUSTOM, $op_addr, sim_l[cntxt][hcntxt][0][0], sim_r[cntxt][hcntxt][0][1], $op_syll, 0, 0, 0, 0, _NUL_iss, 0);\n\t\t}\n";
		}
	    elsif($pthread_thing eq "FEOF")
	    {
		print SIMULATOR "/* this is an feof */\n";
		@sim_rets = split(/,/, $sim_rets);
		$sim_rets[0] =~ /\$([rbl])(\d+)\.(\d+):\w+/;
		print SIMULATOR "\t\tsim_$1" . "\[cntxt\]\[hcntxt\]\[$2\]\[$3\] = ";
		$tempy = 'sim_' . $1 . '[cntxt][hcntxt][' . $2 . '][' . $3 . ']';
		
		$sim_args[0] =~ /\$([rbl])(\d+)\.(\d+):\w+/;

		print SIMULATOR "feof( (stack_bottom + sim_$1\[cntxt\]\[hcntxt\]\[$2\]\[$3\]) );\n";
		print SIMULATOR "\t\tif(queue_switch)\n\t\t{\t\t\tPushMessageToQueue(msqid[cntxt][hcntxt], CCount[cntxt][hcntxt], -1, _NUL_iss, 0, CUSTOM, $op_addr, sim_l[cntxt][hcntxt][0][0], sim_r[cntxt][hcntxt][0][1], $op_syll, 0, 0, 0, 0, _NUL_iss, 0);\n\t\t}\n";
	    }
	    elsif($pthread_thing eq "FFLUSH")
	    {
		print SIMULATOR "/* this is an fflush */\n";
		@sim_rets = split(/,/, $sim_rets);
		$sim_rets[0] =~ /\$([rbl])(\d+)\.(\d+):\w+/;
		print SIMULATOR "\t\tsim_$1" . "\[cntxt\]\[hcntxt\]\[$2\]\[$3\] = ";
		$tempy = 'sim_' . $1 . '[cntxt][hcntxt][' . $2 . '][' . $3 . ']';
		
		$sim_args[0] =~ /\$([rbl])(\d+)\.(\d+):\w+/;

		print SIMULATOR "fflush( (stack_bottom + sim_$1\[cntxt\]\[hcntxt\]\[$2\]\[$3\]) );\n";
		print SIMULATOR "\t\tif(queue_switch)\n\t\t{\t\t\tPushMessageToQueue(msqid[cntxt][hcntxt], CCount[cntxt][hcntxt], -1, _NUL_iss, 0, CUSTOM, $op_addr, sim_l[cntxt][hcntxt][0][0], sim_r[cntxt][hcntxt][0][1], $op_syll, 0, 0, 0, 0, _NUL_iss, 0);\n\t\t}\n";
	    }
	    elsif($pthread_thing eq "FGETC")
	    {
		print SIMULATOR "/* this is an fgetc */\n";
		@sim_rets = split(/,/, $sim_rets);
		$sim_rets[0] =~ /\$([rbl])(\d+)\.(\d+):\w+/;
		print SIMULATOR "\t\tsim_$1" . "\[cntxt\]\[hcntxt\]\[$2\]\[$3\] = ";
		$sim_args[0] =~ /\$([rbl])(\d+)\.(\d+):\w+/;
		print SIMULATOR "fgetc( (stack_bottom + sim_$1\[cntxt\]\[hcntxt\]\[$2\]\[$3\]) );\n";
		print SIMULATOR "\t\tif(queue_switch)\n\t\t{\t\t\tPushMessageToQueue(msqid[cntxt][hcntxt], CCount[cntxt][hcntxt], -1, _NUL_iss, 0, CUSTOM, $op_addr, sim_l[cntxt][hcntxt][0][0], sim_r[cntxt][hcntxt][0][1], $op_syll, 0, 0, 0, 0, _NUL_iss, 0);\n\t\t}\n";
	    }
	    elsif($pthread_thing eq "FGETS")
	    {
		print SIMULATOR "/* this is an fgets */\n";
		@sim_rets = split(/,/, $sim_rets);
		$sim_rets[0] =~ /\$([rbl])(\d+)\.(\d+):\w+/;
		print SIMULATOR "\t\tsim_$1" . "\[cntxt\]\[hcntxt\]\[$2\]\[$3\] = ";
		print SIMULATOR "fgets( ";
		$sim_args[0] =~ /\$([rbl])(\d+)\.(\d+):\w+/;
		print SIMULATOR "(stack_bottom + sim_$1\[cntxt\]\[hcntxt\]\[$2\]\[$3\]), ";
		$sim_args[1] =~ /\$([rbl])(\d+)\.(\d+):\w+/;
		print SIMULATOR "(sim_$1\[cntxt\]\[hcntxt\]\[$2\]\[$3\]), ";
		$sim_args[2] =~ /\$([rbl])(\d+)\.(\d+):\w+/;
		print SIMULATOR "(stack_bottom + sim_$1\[cntxt\]\[hcntxt\]\[$2\]\[$3\]) );\n";
		print SIMULATOR "\t\tif(queue_switch)\n\t\t{\t\t\tPushMessageToQueue(msqid[cntxt][hcntxt], CCount[cntxt][hcntxt], -1, _NUL_iss, 0, CUSTOM, $op_addr, sim_l[cntxt][hcntxt][0][0], sim_r[cntxt][hcntxt][0][1], $op_syll, 0, 0, 0, 0, _NUL_iss, 0);\n\t\t}\n";
	    }
	    elsif($pthread_thing eq "FPUTC")
	    {
		print SIMULATOR "/* this is an fputc */\n";
		@sim_rets = split(/,/, $sim_rets);
		$sim_rets[0] =~ /\$([rbl])(\d+)\.(\d+):\w+/;
		print SIMULATOR "\t\tsim_$1" . "\[cntxt\]\[hcntxt\]\[$2\]\[$3\] = ";
		print SIMULATOR "fputc( ";
		$sim_args[0] =~ /\$([rbl])(\d+)\.(\d+):\w+/;
		print SIMULATOR "(sim_$1\[cntxt\]\[hcntxt\]\[$2\]\[$3\]), ";
		$sim_args[1] =~ /\$([rbl])(\d+)\.(\d+):\w+/;
		print SIMULATOR "(stack_bottom + sim_$1\[cntxt\]\[hcntxt\]\[$2\]\[$3\]) );\n";
		print SIMULATOR "\t\tif(queue_switch)\n\t\t{\t\t\tPushMessageToQueue(msqid[cntxt][hcntxt], CCount[cntxt][hcntxt], -1, _NUL_iss, 0, CUSTOM, $op_addr, sim_l[cntxt][hcntxt][0][0], sim_r[cntxt][hcntxt][0][1], $op_syll, 0, 0, 0, 0, _NUL_iss, 0);\n\t\t}\n";
	    }
	    elsif($pthread_thing eq "FPUTS")
	    {
		print SIMULATOR "/* this is an fputs */\n";
		@sim_rets = split(/,/, $sim_rets);
		$sim_rets[0] =~ /\$([rbl])(\d+)\.(\d+):\w+/;
		print SIMULATOR "\t\tsim_$1" . "\[cntxt\]\[hcntxt\]\[$2\]\[$3\] = ";
		print SIMULATOR "fputs( ";
		$sim_args[0] =~ /\$([rbl])(\d+)\.(\d+):\w+/;
		print SIMULATOR "(stack_bottom + sim_$1\[cntxt\]\[hcntxt\]\[$2\]\[$3\]), ";
		$sim_args[1] =~ /\$([rbl])(\d+)\.(\d+):\w+/;
		print SIMULATOR "(stack_bottom + sim_$1\[cntxt\]\[hcntxt\]\[$2\]\[$3\]) );\n";
		print SIMULATOR "\t\tif(queue_switch)\n\t\t{\t\t\tPushMessageToQueue(msqid[cntxt][hcntxt], CCount[cntxt][hcntxt], -1, _NUL_iss, 0, CUSTOM, $op_addr, sim_l[cntxt][hcntxt][0][0], sim_r[cntxt][hcntxt][0][1], $op_syll, 0, 0, 0, 0, _NUL_iss, 0);\n\t\t}\n";
	    }
	    elsif($pthread_thing eq "FREAD")
	    {
		print SIMULATOR "/* this is an fread */\n";
		@sim_rets = split(/,/, $sim_rets);
		$sim_rets[0] =~ /\$([rbl])(\d+)\.(\d+):\w+/;
		print SIMULATOR "\t\tsim_$1" . "\[cntxt\]\[hcntxt\]\[$2\]\[$3\] = ";
		print SIMULATOR "fread( ";
		$sim_args[0] =~ /\$([rbl])(\d+)\.(\d+):\w+/;
		print SIMULATOR "(stack_bottom + sim_$1\[cntxt\]\[hcntxt\]\[$2\]\[$3\]), ";
		$sim_args[1] =~ /\$([rbl])(\d+)\.(\d+):\w+/;
		print SIMULATOR "(sim_$1\[cntxt\]\[hcntxt\]\[$2\]\[$3\]), ";
		$sim_args[2] =~ /\$([rbl])(\d+)\.(\d+):\w+/;
		print SIMULATOR "(sim_$1\[cntxt\]\[hcntxt\]\[$2\]\[$3\]), ";
		$sim_args[3] =~ /\$([rbl])(\d+)\.(\d+):\w+/;
		print SIMULATOR "(stack_bottom + sim_$1\[cntxt\]\[hcntxt\]\[$2\]\[$3\]) );\n";
		print SIMULATOR "\t\tif(queue_switch)\n\t\t{\t\t\tPushMessageToQueue(msqid[cntxt][hcntxt], CCount[cntxt][hcntxt], -1, _NUL_iss, 0, CUSTOM, $op_addr, sim_l[cntxt][hcntxt][0][0], sim_r[cntxt][hcntxt][0][1], $op_syll, 0, 0, 0, 0, _NUL_iss, 0);\n\t\t}\n";
	    }
	    elsif($pthread_thing eq "FWRITE")
	    {
		print SIMULATOR "/* this is an fwrite */\n";
		@sim_rets = split(/,/, $sim_rets);
		$sim_rets[0] =~ /\$([rbl])(\d+)\.(\d+):\w+/;
		print SIMULATOR "\t\tsim_$1" . "\[cntxt\]\[hcntxt\]\[$2\]\[$3\] = ";
		print SIMULATOR "fwrite( ";
		$sim_args[0] =~ /\$([rbl])(\d+)\.(\d+):\w+/;
		print SIMULATOR "(stack_bottom + sim_$1\[cntxt\]\[hcntxt\]\[$2\]\[$3\]), ";
		$sim_args[1] =~ /\$([rbl])(\d+)\.(\d+):\w+/;
		print SIMULATOR "(sim_$1\[cntxt\]\[hcntxt\]\[$2\]\[$3\]), ";
		$sim_args[2] =~ /\$([rbl])(\d+)\.(\d+):\w+/;
		print SIMULATOR "(sim_$1\[cntxt\]\[hcntxt\]\[$2\]\[$3\]), ";
		$sim_args[3] =~ /\$([rbl])(\d+)\.(\d+):\w+/;
		print SIMULATOR "(stack_bottom + sim_$1\[cntxt\]\[hcntxt\]\[$2\]\[$3\]) );\n";
		print SIMULATOR "\t\tif(queue_switch)\n\t\t{\t\t\tPushMessageToQueue(msqid[cntxt][hcntxt], CCount[cntxt][hcntxt], -1, _NUL_iss, 0, CUSTOM, $op_addr, sim_l[cntxt][hcntxt][0][0], sim_r[cntxt][hcntxt][0][1], $op_syll, 0, 0, 0, 0, _NUL_iss, 0);\n\t\t}\n";
	    }
	    elsif($pthread_thing eq "SSCANF")
	    {
		print SIMULATOR "/* this is a sscanf */\n";
		@sim_rets = split(/,/, $sim_rets);
		$sim_rets[0] =~ /\$([rbl])(\d+)\.(\d+):\w+/;
		$ret1 = $1;
		$ret2 = $2;
		$ret3 = $3;

		$sim_args[1] =~ /\$([rbl])(\d+)\.(\d+):\w+/;
		# need to check fo %s and %c as these come from memory and need the stack_bottom adding
		&token_string_scanf();
		print SIMULATOR "\t\tsim_$ret1\[cntxt\]\[hcntxt\]\[$ret2\]\[$ret3\] = ";
		print SIMULATOR "sscanf( (stack_bottom + ";
		for($weee=0;$weee<=$#sim_args;$weee++)
		{
                        if($sim_args[$weee] =~ /\$([rbl])(\d+)\.(\d+):\w+/)
			{
			        if($weee == 0)
				{
				    print SIMULATOR "sim_$1\[cntxt\]\[hcntxt\]\[$2\]\[$3\])";
				}
				    elsif($weee == 1)
				    {
					print SIMULATOR "(char *)(stack_bottom + sim_$1\[cntxt\]\[hcntxt\]\[$2\]\[$3\])";
				    }
				    else
				    {
					print SIMULATOR "(unsigned int)returnValOrAddr(sim_$1", '[cntxt][hcntxt][', $2, '][', $3, '], check_args[',( $weee - 2), '], &temp[', ($weee - 2), '])';
				    }

				    if($weee == $#sim_args)
				    {
				    }
				    else
				    {
					print SIMULATOR ",\n\t\t";
				    }
			}
		}
		print SIMULATOR "\t\t);\n";


		for($weee=2;$weee<=$#sim_args;$weee++)
		{
                        if($sim_args[$weee] =~ /\$([rbl])(\d+)\.(\d+):\w+/)
			{
			    print SIMULATOR "\t\tstoreValues(sim_$1\[cntxt\]\[hcntxt\]\[$2\]\[$3\], check_args\[", ($weee - 2), "\], temp\[", ($weee - 2), "\]);\n";
			}
		}
		
		print SIMULATOR "\n";
		print SIMULATOR "\t\tif(queue_switch)\n\t\t{\t\t\tPushMessageToQueue(msqid[cntxt][hcntxt], CCount[cntxt][hcntxt], -1, _NUL_iss, 0, CUSTOM, $op_addr, sim_l[cntxt][hcntxt][0][0], sim_r[cntxt][hcntxt][0][1], $op_syll, 0, 0, 0, 0, _NUL_iss, 0);\n\t\t}\n";
	    }
	    elsif($pthread_thing eq "SPRINTF")
	    {
		print SIMULATOR "/* this is an sprintf */\n";
		@sim_rets = split(/,/, $sim_rets);
		$sim_rets[0] =~ /\$([rbl])(\d+)\.(\d+):\w+/;
		$ret1 = $1;
		$ret2 = $2;
		$ret3 = $3;

		$sim_args[1] =~ /\$([rbl])(\d+)\.(\d+):\w+/;
		# need to check fo %s and %c as these come from memory and need the stack_bottom adding
		&token_string();
		print SIMULATOR "\t\tsim_$ret1\[cntxt\]\[hcntxt\]\[$ret2\]\[$ret3\] = ";
		print SIMULATOR "sprintf((stack_bottom + ";
		for($weee=0;$weee<=$#sim_args;$weee++)
		{
                        if($sim_args[$weee] =~ /\$([rbl])(\d+)\.(\d+):\w+/)
			{
			    print SIMULATOR "sim_$1" . "\[cntxt\]\[hcntxt\]\[$2\]\[$3\]";
			        if($weee == 0)
				{
				    print SIMULATOR ")";
				}
			        elsif($weee == 1)
				{
				    print SIMULATOR " + stack_bottom)";
				}
			        else
				{
				    print SIMULATOR " + check_args[", $weee - 2, "]";
				}
			        if($weee == $#sim_args)
				{
				}
			        elsif($weee == 0)
				{
				    print SIMULATOR ",\n\t\t(char *)(";
				}
			        else
				{
				    print SIMULATOR ",\n\t\t";
				}
			}
			else
			{
			    $sim_args[$weee] =~ /(\d+):\w+/;
			    print SIMULATOR "$1";
			        if($weee == 0)
				{
				    print SIMULATOR ")";
				}
			        else
				{
				    print SIMULATOR " + check_args[", $weee - 1, "]";
				}
			        if($weee == $#sim_args)
				{
				}
			        else
				{
				    print SIMULATOR ",\n\t\t";
				}    
			}
		}
		print SIMULATOR "\t\t);\n";
		print SIMULATOR "\t\tif(queue_switch)\n\t\t{\t\t\tPushMessageToQueue(msqid[cntxt][hcntxt], CCount[cntxt][hcntxt], -1, _NUL_iss, 0, CUSTOM, $op_addr, sim_l[cntxt][hcntxt][0][0], sim_r[cntxt][hcntxt][0][1], $op_syll, 0, 0, 0, 0, _NUL_iss, 0);\n\t\t}\n";
	    }

                elsif($pthread_thing eq "FPRINTF")
                {
                    print SIMULATOR "/* this is an fprintf */\n";
		    @sim_rets = split(/,/, $sim_rets);
		    $sim_rets[0] =~ /\$([rbl])(\d+)\.(\d+):\w+/;
		    $ret1 = $1;
		    $ret2 = $2;
		    $ret3 = $3;

		    $sim_args[1] =~ /\$([rbl])(\d+)\.(\d+):\w+/;
		    # need to check fo %s and %c as these come from memory and need the stack_bottom adding
		    &token_string();
		    print SIMULATOR "\t\tsim_$ret1\[cntxt\]\[hcntxt\]\[$ret2\]\[$ret3\] = ";
                    print SIMULATOR "fprintf((stack_bottom + ";
                    for($weee=0;$weee<=$#sim_args;$weee++)
                    {
                        if($sim_args[$weee] =~ /\$([rbl])(\d+)\.(\d+):\w+/)
			{
			    print SIMULATOR "sim_$1" . "\[cntxt\]\[hcntxt\]\[$2\]\[$3\]";
			        if($weee == 0)
				{
				    print SIMULATOR ")";
				}
			        elsif($weee == 1)
				{
				    print SIMULATOR " + stack_bottom)";
				}
			        else
				{
				    print SIMULATOR " + check_args[", $weee - 2, "]";
				}
			        if($weee == $#sim_args)
				{
				}
			        elsif($weee == 0)
				{
				    print SIMULATOR ",\n\t\t(char *)(";
				}
			        else
				{
				    print SIMULATOR ",\n\t\t";
				}
			}
			else
			{
			    $sim_args[$weee] =~ /(\d+):\w+/;
			    print SIMULATOR "$1";
			        if($weee == 0)
				{
				    print SIMULATOR ")";
				}
			        else
				{
				    print SIMULATOR " + check_args[", $weee - 2, "]";
				}
			        if($weee == $#sim_args)
				{
				}
			        else
				{
				    print SIMULATOR ",\n\t\t";
				}    
			}
                    }
                    print SIMULATOR "\t\t);\n";
		    print SIMULATOR "\t\tif(queue_switch)\n\t\t{\t\t\tPushMessageToQueue(msqid[cntxt][hcntxt], CCount[cntxt][hcntxt], -1, _NUL_iss, 0, CUSTOM, $op_addr, sim_l[cntxt][hcntxt][0][0], sim_r[cntxt][hcntxt][0][1], $op_syll, 0, 0, 0, 0, _NUL_iss, 0);\n\t\t}\n";
                }
		else
		{
		    print "UNKNOWN PTHREAD COMMAND: $pthread_thing\n";
		    exit(0);
		}

#		print SIMULATOR "\t\tif(queue_switch)\n\t\t{\t\t\tPushMessageToQueue(msqid[cntxt][hcntxt], CCount[cntxt][hcntxt], -1, _NUL_iss, 0, CUSTOM, $op_addr, sim_l[cntxt][hcntxt][0][0], sim_r[cntxt][hcntxt][0][1], $op_syll, 0, 0, 0, 0, _NUL_iss, 0);\n\t\t}\n";
	    }
	    else
	    {
		print SIMULATOR "/* THIS IS A NON PTHREAD OP */\n";
		print SIMULATOR "\t\tsim_l[cntxt][hcntxt][0][0] = $new_link_reg;\n";
		print SIMULATOR "\t\tif(queue_switch)\n\t\t{\t\t\tPushMessageToQueue(msqid[cntxt][hcntxt], CCount[cntxt][hcntxt], -1, _NUL_iss, 0, $sim_op, $op_addr, sim_l[cntxt][hcntxt][0][0], sim_r[cntxt][hcntxt][0][1], $op_syll, 0, 0, 0, 0, _NUL_iss, 0);\n\t\t}\n";
		$where_to_call =~ /\.call\s+(\w+),\s+caller,\s+arg\((.+)/;#\),\s+ret\((.+)\)/;
		($sim_args, $sim_rets) = split(/\),\s+ret\(/, $2);
		$sim_rets =~ s/\)$//;
		$arg_count = 0;
		@sim_args = split(/,/, $sim_args);
		foreach $sim_arg (@sim_args)
		{
		    if($sim_arg =~ /\$([rbl])(\d+)\.(\d+):\w+/)
		    {
			print SIMULATOR "\t\tpass_arguments[cntxt][hcntxt].args.arg[$arg_count] = sim_$1" . "\[cntxt\]\[hcntxt\]\[$2\]\[$3\];\n";
			$arg_count++;
		    }
		}
	    print SIMULATOR<<SETUP;
\t\tpass_arguments[cntxt][hcntxt].context = cntxt;
\t\tpass_arguments[cntxt][hcntxt].hypercontext = hcntxt;
\t\tpass_arguments[cntxt][hcntxt].called_from = ((cntxt << 4) | hcntxt);
SETUP
    $which_pc_to_call = sprintf("0x%x", ($Inst_Label{$sim_func} * 4));
		$where_to_return_to = sprintf("0x%x", (($test_address + 1) * 4));
    $to_call = "\n\t\tstrcpy(next_pc[cntxt][hcntxt], \"label$which_pc_to_call\");\n\t\tunsigned int tmp = lifocnt[cntxt][hcntxt];\n\t\twhere_to_return[cntxt][hcntxt][tmp] = \"label$where_to_return_to\";\n\t\tlifocnt[cntxt][hcntxt]++;\n\t\treturn 0;\n\t}\n";
		$ret_count = 0;
		@sim_rets = split(/,/, $sim_rets);
		$return_values = "";
		if($#sim_rets == -1)
		{
		    $return_values .= "\t\t/* no return values */\n";
		}
		foreach $sim_ret (@sim_rets)
		{
		    if($sim_ret  =~ /\$([rbl])(\d+)\.(\d+):\w+/)
		    {
			$return_values .= "\t\tsim_$1\[cntxt\]\[hcntxt\]\[$2\]\[$3\] = pass_arguments[cntxt][hcntxt].rets.ret[$ret_count];\n";
			$return_values .= "\t\tsim_$1\_prev\[cntxt\]\[hcntxt\]\[$2\]\[$3\] = pass_arguments[cntxt][hcntxt].rets.ret[$ret_count];\n";
			$ret_count++;
		    }
		}
		$where_to_call = "";
	    }
	}
	elsif($for_sim =~ /HALT/)
	{
	    $op_addr = sprintf("0x%x", ($test_address * 4));
	    if($sim_needs_a_clock)
	    {
		print SIMULATOR "\n\t/* CLOCK */\n\tvoid *label$op_addr(void)\n\t{\n";
		$current_label_for_hash_define = "label$op_addr";
		push @Functions, "void *label$op_addr(void);";
		if($return_values ne "")
		{
		    print SIMULATOR "if(!this_is_a_goto[cntxt][hcntxt])\n{\n";
		    print SIMULATOR $return_values;
		    print SIMULATOR "}\nelse\n{\nthis_is_a_goto[cntxt][hcntxt] = 0;\n}\n";

		    $return_values = "";
		}
		if($are_there_args ne "")
		{
		    print SIMULATOR $are_there_args;
		    $are_there_args = "";
		}
		print SIMULATOR "\t\tif(!checked[cntxt][hcntxt])\n\t\t{\n\t\t\tif(check_bundles(cntxt, hcntxt, ", $current_label_for_hash_define , "_start, ", $current_label_for_hash_define , "_end))\n\t\t\t{\n\t\t\t\tchecked[cntxt][hcntxt] = 1;\n\t\t\t\treturn 0;\n\t\t\t}\n\t\t}\n\t\tchecked[cntxt][hcntxt] = 0;\n";
		print SIMULATOR "\t\t\n\t\tCYCLE_INCREMENT(cntxt, hcntxt);\n";
		print INST_DEFINES "#define ", $current_label_for_hash_define, "_start ", $test_address, "\n";
		$sim_needs_a_clock = 0;
	    }
	    ($sim_func, $pthread_thing) = split(/\s+\:PTHREAD:\s+/, $for_sim);
	    $op_syll = sprintf("0x%x", ($syllable & 0xffffffff));
	    $sim_op = "HALT";
	    print SIMULATOR "\t\tif(queue_switch)\n\t\t{\t\t\tPushMessageToQueue(msqid[cntxt][hcntxt], CCount[cntxt][hcntxt], -1, _NUL_iss, 0, $sim_op, $op_addr, sim_l[cntxt][hcntxt][0][0], sim_r[cntxt][hcntxt][0][1], $op_syll, 0, 0, 0, 0, _NUL_iss, 0);\n\t\t}\n";
	    $return_args = $return_args[$return_count++];
	    $return_args =~ /^\.return ret\((.*)\)/;
	    $temp_return_args = $1;
	    print SIMULATOR "//RET $1\n";
	    @returns_args = split(/,/, $temp_return_args);
	    $returns_count = 0;
	    if($#returns_args > -1)
	    {
		foreach $return_arg (@returns_args)
		{
		    ($return_reg, $return_type) = split(/:/, $return_arg);
		    if($return_reg =~ /\$([rbl])(\d+)\.(\d+)/)
		    {
			print SIMULATOR "\t\tpass_arguments[cntxt][hcntxt].rets.ret[$returns_count] = sim_$1", "[cntxt][hcntxt][$2][$3];\n";
		    }
		    elsif($return_reg =~ /(0x\w+)/)
		    {
			print SIMULATOR "\t\tpass_arguments[cntxt][hcntxt].rets.ret[$returns_count] = $1;\n";
		    }
		    else
		    {
			print SIMULATOR "// UNKNOWN: $return_reg\n";
		    }
		    $returns_count++;
		}
	    }
	    $to_return = "strcpy(next_pc[cntxt][hcntxt], where_to_return[cntxt][hcntxt][0]);\nreturn 0;\n}\n";
	}
	elsif($for_sim =~ /BRF?/)
	{
	    $op_addr = sprintf("0x%x", ($test_address * 4));
	    $next_pc_address = sprintf("0x%x", (($test_address + 1) * 4));
	    if($sim_needs_a_clock)
	    {
		print SIMULATOR "\n\t/* CLOCK */\n\tvoid *label$op_addr(void)\n\t{\n";
		$current_label_for_hash_define = "label$op_addr";
		push @Functions, "void *label$op_addr(void);";
		if($return_values ne "")
		{
		    print SIMULATOR "if(!this_is_a_goto[cntxt][hcntxt])\n{\n";
		    print SIMULATOR $return_values;
		    print SIMULATOR "}\nelse\n{\nthis_is_a_goto[cntxt][hcntxt] = 0;\n}\n";

		    $return_values = "";
		}
		if($are_there_args ne "")
		{
		    print SIMULATOR $are_there_args;
		    $are_there_args = "";
		}
		print SIMULATOR "\t\tif(!checked[cntxt][hcntxt])\n\t\t{\n\t\t\tif(check_bundles(cntxt, hcntxt, ", $current_label_for_hash_define , "_start, ", $current_label_for_hash_define , "_end))\n\t\t\t{\n\t\t\t\tchecked[cntxt][hcntxt] = 1;\n\t\t\t\treturn 0;\n\t\t\t}\n\t\t}\n\t\tchecked[cntxt][hcntxt] = 0;\n";
		print SIMULATOR "\t\t\n\t\tCYCLE_INCREMENT(cntxt, hcntxt);\n";
		print INST_DEFINES "#define ", $current_label_for_hash_define, "_start ", $test_address, "\n";
		$sim_needs_a_clock = 0;
	    }
	    $op_syll = sprintf("0x%x", ($syllable & 0xffffffff));
	    $for_sim =~ /(.+)\s+\^\s+(\d+)\s+BR(F?)\s+\+\s+br\s+(\d+)\s+ABS\s+ADDR:\s(\w+)/;
	    $where_to_go = $1;
	    $branch_clus = $2;
	    $branch_reg = $4;
	    $F_or_not = $3;
	$abs_addr = $5;
	    $where_to_go =~ s/\./X/g;
	    $where_to_go =~ s/\?/X/g;
	    if($F_or_not eq "F")
	    {
		$pos_or_neg = "!";
		$sim_op = "BRANCHF";
	    }
	    else
	    {
		$pos_or_neg = "";
		$sim_op = "BRANCH";
	    }
	    print SIMULATOR "\t\tif(queue_switch)\n\t\t{\t\t\tPushMessageToQueue(msqid[cntxt][hcntxt], CCount[cntxt][hcntxt], $branch_reg, _B_iss, sim_b_prev[cntxt][hcntxt][$branch_clus][$branch_reg], $sim_op, $op_addr, sim_l[cntxt][hcntxt][0][0], sim_r[cntxt][hcntxt][0][1], $op_syll, 0, 0, 0, 0, _NUL_iss, 0);\n\t\t}\n";
	    $to_branch = <<BRANCH;
\t\tif($pos_or_neg(sim_b_prev[cntxt][hcntxt][$branch_clus][$branch_reg]))
\t\t{
\t\t\tBRANCH_TAKEN(cntxt, hcntxt);
\t\t\tstrcpy(next_pc[cntxt][hcntxt], \"label$abs_addr\");
\t\t\treturn 0;
\t\t}
\t\telse
\t\t{
\t\t\tBRANCH_NOT_TAKEN(cntxt, hcntxt);
\t\t}
BRANCH
	}
	elsif($for_sim =~ /(asm\d*),(\d+)(.+)/)
	{
	    $op_addr = sprintf("0x%x", ($test_address * 4));
	    if($sim_needs_a_clock)
	    {
		print SIMULATOR "\n\t/* CLOCK */\n\tvoid *label$op_addr(void)\n\t{\n";
		$current_label_for_hash_define = "label$op_addr";
		push @Functions, "void *label$op_addr(void);";
		if($return_values ne "")
		{
		    print SIMULATOR "if(!this_is_a_goto[cntxt][hcntxt])\n{\n";
		    print SIMULATOR $return_values;
		    print SIMULATOR "}\nelse\n{\nthis_is_a_goto[cntxt][hcntxt] = 0;\n}\n";

		    $return_values = "";
		}
		if($are_there_args ne "")
		{
		    print SIMULATOR $are_there_args;
		    $are_there_args = "";
		}
		print SIMULATOR "\t\tif(!checked[cntxt][hcntxt])\n\t\t{\n\t\t\tif(check_bundles(cntxt, hcntxt, ", $current_label_for_hash_define , "_start, ", $current_label_for_hash_define , "_end))\n\t\t\t{\n\t\t\t\tchecked[cntxt][hcntxt] = 1;\n\t\t\t\treturn 0;\n\t\t\t}\n\t\t}\n\t\tchecked[cntxt][hcntxt] = 0;\n";
		print SIMULATOR "\t\t\n\t\tCYCLE_INCREMENT(cntxt, hcntxt);\n";
		print INST_DEFINES "#define ", $current_label_for_hash_define, "_start ", $test_address, "\n";
		$sim_needs_a_clock = 0;
	    }
	    $custom_inst_type = $1;
	    $custom_inst_num = $2;
	    $custom_inst_regs = $3;
	    $custom_inst_regs =~ s/\s+$//;
	    $op_syll = sprintf("0x%x", ($syllable & 0xffffffff));
	    if($custom_inst_type eq "asm")
	    {
		($cust_r, $cust_a) = split(/\s*=\s*/, $custom_inst_regs);
		(@cust_r) = split(/\s*,\s*/, $cust_r);
		(@cust_a) = split(/\s*,\s*/, $cust_a);
		$custom_inst_aloc = "casm" . ($#cust_a + 1) .  ($#cust_r + 1);
		if($custom_inst_aloc eq "casm61")
		{
		    print "CUSTOM INST: $custom_inst_aloc\n";
		}
		elsif($custom_inst_aloc eq "casm52")
		{
		    print "CUSTOM INST: $custom_inst_aloc\n";
		}
		elsif($custom_inst_aloc eq "cas43")
		{
		    print "CUSTOM INST: $custom_inst_aloc\n";
		}
		elsif($custom_inst_aloc eq "casm34")
		{
		    print "CUSTOM INST: $custom_inst_aloc\n";
		}
		elsif($custom_inst_aloc eq "casm51")
		{
		    print "CUSTOM INST: $custom_inst_aloc\n";
		}
		elsif($custom_inst_aloc eq "casm42")
		{
		    print "CUSTOM INST: $custom_inst_aloc\n";
		}
		elsif($custom_inst_aloc eq "casm33")
		{
		    print "CUSTOM INST: $custom_inst_aloc\n";
		}
		elsif($custom_inst_aloc eq "casm24")
		{
		    print "CUSTOM INST: $custom_inst_aloc\n";
		}
		elsif($custom_inst_aloc eq "casm41")
		{
		    print "CUSTOM INST: $custom_inst_aloc\n";
		}
		elsif($custom_inst_aloc eq "casm32")
		{
		    print "CUSTOM INST: $custom_inst_aloc\n";
		    if($custom_inst_num == 0)
		    {
			print "VTHREAD_CREATE: $custom_instid\n";
			print SIMULATOR "/* CUSTOM INSTRUCTION: VTHREAD_CREATE */\n";
			print SIMULATOR "\t\tif(queue_switch)\n\t\t{\t\t\tPushMessageToQueue(msqid[cntxt][hcntxt], CCount[cntxt][hcntxt], -1, _NUL_iss, -1, CUSTOM, $op_addr, sim_l[cntxt][hcntxt][0][0], sim_r[cntxt][hcntxt][0][1], $op_syll, 0, 0, 0, -1, _NUL_iss, -1);\n\t\t}\n";
			($custom_rets, $custom_args) = split(/\s+=\s+/, $custom_inst_regs);
			@custom_rets = split(/\s*,\s*/, $custom_rets);
			@custom_args = split(/\s*,\s*/, $custom_args);
			for($cust_r = 0; $cust_r <= $#custom_rets; $cust_r++)
			{
			    $custom_rets[$cust_r] =~ s/\$([rbl])(\d+)\.(\d+)/sim_$1\[cntxt\]\[hcntxt\]\[$2\]\[$3\]/g;
			}
			$custom_args[2] =~ s/\$([rbl])(\d+)\.(\d+)/sim_$1\[cntxt\]\[hcntxt\]\[$2\]\[$3\]/g;
			$custom_args[1] =~ s/\$([rbl])(\d+)\.(\d+)/sim_$1\[cntxt\]\[hcntxt\]\[$2\]\[$3\]/g;
			print SIMULATOR<<CUST;
\t\tunsigned int temp_cntxt, temp_hcntxt;
\t\tint new_free_thread = find_free_thread();
\t\tif(new_free_thread == -1)
\t\t{
\t\t\tprintf("THRE ARE NO MORE FREE THREADS TO USE\\n");
\t\t\t$custom_rets[0] = 1;
\t\t}
\t\telse
\t\t{
\t\t$custom_rets[0] = 0;
\t\t}
\t\ttemp_cntxt = (new_free_thread & 0x7f0) >> 4;
\t\ttemp_hcntxt = (new_free_thread & 0xf);
\t\tnew_thread[temp_cntxt][temp_hcntxt] = 1;
\t\tparent[temp_cntxt][temp_hcntxt] = new_free_thread;;
\t\tpass_arguments[temp_cntxt][temp_hcntxt].args.arg[0] = $custom_args[2];
\t\tchar str[20];
\t\tsprintf(str, "label0x\%x", $custom_args[1]);
\t\tstrcpy(next_pc[temp_cntxt][temp_hcntxt], str);
\t\t$custom_rets[$#custom_rets] = new_free_thread;
CUST
		    }
		    else
		    {
			print SIMULATOR "/* UNKNOWN CUSTOM INSTRUCTION: $custom_inst_type,$custom_inst_num $custom_inst_regs */\n";
		    }
		}
		elsif($custom_inst_aloc eq "casm23")
		{
		    print "CUSTOM INST: $custom_inst_aloc\n";
		}
		elsif($custom_inst_aloc eq "casm14")
		{
		    print "CUSTOM INST: $custom_inst_aloc\n";
		}
		elsif($custom_inst_aloc eq "casm31")
		{
		    print "CUSTOM INST: $custom_inst_aloc\n";
		}
		elsif($custom_inst_aloc eq "casm22")
		{
		    print "CUSTOM INST: $custom_inst_aloc\n";
		}
		elsif($custom_inst_aloc eq "casm13")
		{
		    print "CUSTOM INST: $custom_inst_aloc\n";
		}
		elsif($custom_inst_aloc eq "casm12")
		{
		    print "CUSTOM INST: $custom_inst_aloc\n";
		    if($custom_inst_num == 0)
		    {
			print "VTHREAD_JOIN: $custom_instid\n";
			print SIMULATOR "/* CUSTOM INSTRUCTION: VTHREAD_JOIN */\n";
			print SIMULATOR "\t\tif(queue_switch)\n\t\t{\t\t\tPushMessageToQueue(msqid[cntxt][hcntxt], CCount[cntxt][hcntxt], -1, _NUL_iss, -1, CUSTOM, $op_addr, sim_l[cntxt][hcntxt][0][0], sim_r[cntxt][hcntxt][0][1], $op_syll, 0, 0, 0, -1, _NUL_iss, -1);\n\t\t}\n";
			($custom_rets, $custom_args) = split(/\s+=\s+/, $custom_inst_regs);
			@custom_rets = split(/\s*,\s*/, $custom_rets);
			@custom_args = split(/\s*,\s*/, $custom_args);
			for($cust_r = 0; $cust_r <= $#custom_rets; $cust_r++)
			{
			    $custom_rets[$cust_r] =~ s/\$([rbl])(\d+)\.(\d+)/sim_$1\[cntxt\]\[hcntxt\]\[$2\]\[$3\]/g;
			}
			$custom_args[0] =~ s/\$([rbl])(\d+)\.(\d+)/sim_$1\[cntxt\]\[hcntxt\]\[$2\]\[$3\]/g;
			print SIMULATOR "\n\t\tjoin[cntxt][hcntxt] = $custom_args[0];\n";
			print SIMULATOR "\t\t$custom_rets[0] = 0;\n\n";
		    }
		    else
		    {
			print SIMULATOR "/* UNKNOWN CUSTOM INSTRUCTION: $custom_inst_type,$custom_inst_num $custom_inst_regs */\n";
		    }
		}
		elsif($custom_inst_aloc eq "casm21")
		{
		    print "CUSTOM INST: $custom_inst_aloc\n";
		}
		else
		{
		    print SIMULATOR "/* UNKNOWN CUSTOM INSTRUCTION: $custom_inst_type,$custom_inst_num $custom_inst_regs */\n";
		}
	    }
	    else
	    {
		print SIMULATOR "/* UNKNOWN CUSTOM INSTRUCTION: $custom_inst_type,$custom_inst_num $custom_inst_regs */\n";
	    }
	}
	elsif($for_sim =~ /EXTRA32BITS\s+(\d+)/)
	{
	    $bundle_count--;
	    $imm_syll = sprintf("0x%x", ($1 & 0xffffffff));
	    $imm_addr = sprintf("0x%x", ($test_address * 4));
	    print SIMULATOR "\t\t/* Immediate EXTRA32BITS: $imm_syll */\n\t\tif(queue_switch)\n\t\t{\t\t\tPushMessageToQueue(msqid[cntxt][hcntxt], CCount[cntxt][hcntxt], -1, -1, $imm_syll, -1, $imm_addr, -1, -1, $imm_syll, 0, 0, 0, 0, _NUL_iss, 0);\n\t\t}\n";
	    if($need_a_clock_after_imm)
	    {
		$next_pc_address = sprintf("0x%x", (($test_address + 1) * 4));
		print SIMULATOR "\n\t\tBUNDLE_COUNT(cntxt, hcntxt, $bundle_count);\n";
		print INST_DEFINES "#define ", $current_label_for_hash_define, "_end ", $test_address, "\n";
		$bundle_count = 0;
		$need_a_clock_after_imm = 0;
		if($to_branch ne "")
		{
		    print SIMULATOR $to_branch;
		    $to_branch = "";
		}
		if($to_goto ne "")
		{
		    print SIMULATOR $to_goto;
		    $to_goto = "";
		}
		elsif($to_call ne "")
		{
		    print SIMULATOR $to_call;
		    $to_call = "";
		}
		elsif($to_return ne "")
		{
		    print SIMULATOR $to_return;
		    $to_return = "";
		}
		else
		{
		    print SIMULATOR "\t\tstrcpy(next_pc[cntxt][hcntxt], \"label$next_pc_address\"); /* 4 */\n\t\treturn 0;\n\t}\n";
		}
	    }
	}
    elsif($for_sim =~ /LINK/)
    {
	    $op_addr = sprintf("0x%x", ($test_address * 4));
	    $sim_op = "GOTO";
	    $op_syll = sprintf("0x%x", ($syllable & 0xffffffff));
	    if($sim_needs_a_clock)
	    {
		print SIMULATOR "\n\t/* CLOCK */\n\tvoid *label$op_addr(void)\n\t{\n";
		$current_label_for_hash_define = "label$op_addr";
		push @Functions, "void *label$op_addr(void);";
		if($return_values ne "")
		{
		    print SIMULATOR "if(!this_is_a_goto[cntxt][hcntxt])\n{\n";
		    print SIMULATOR $return_values;
		    print SIMULATOR "}\nelse\n{\nthis_is_a_goto[cntxt][hcntxt] = 0;\n}\n";

		    $return_values = "";
		}
		if($are_there_args ne "")
		{
		    print SIMULATOR $are_there_args;
		    $are_there_args = "";
		}
		print SIMULATOR "\t\tif(!checked[cntxt][hcntxt])\n\t\t{\n\t\t\tif(check_bundles(cntxt, hcntxt, ", $current_label_for_hash_define , "_start, ", $current_label_for_hash_define , "_end))\n\t\t\t{\n\t\t\t\tchecked[cntxt][hcntxt] = 1;\n\t\t\t\treturn 0;\n\t\t\t}\n\t\t}\n\t\tchecked[cntxt][hcntxt] = 0;\n";
		print SIMULATOR "\t\t\n\t\tCYCLE_INCREMENT(cntxt, hcntxt);\n";
		print INST_DEFINES "#define ", $current_label_for_hash_define, "_start ", $test_address, "\n";
		$sim_needs_a_clock = 0;
	    }
	    print SIMULATOR "\t\tif(queue_switch)\n\t\t{\t\t\tPushMessageToQueue(msqid[cntxt][hcntxt], CCount[cntxt][hcntxt], -1, _NUL_iss, 0, $sim_op, $op_addr, sim_l[cntxt][hcntxt][0][0], sim_r[cntxt][hcntxt][0][1], $op_syll, 0, 0, 0, 0, _NUL_iss, 0);\n\t\t}\n";
		    $to_call =<<GOTO;
\t\t/* THIS IS A GOTO LINK */
\t\tchar str[20];
\t\tsprintf(str, "label0x\%x", sim_l_prev[cntxt][hcntxt][0][0]);
\t\tstrcpy(next_pc[cntxt][hcntxt], str);
\t\treturn 0;
\t}
GOTO
    }
	else
	{
	    print SIMULATOR "UNKNOWN: $for_sim\n";
	}
	$test = sprintf("%08x", $syllable);
	print INST_FILE &hex_to_ascii($test);

	$test = sprintf("0x%02x,", ($syllable >> 24) & 0xff);
	print INST_FILE_HEADER $test;
	$test = sprintf("0x%02x,", ($syllable >> 16) & 0xff);
	print INST_FILE_HEADER $test;
	$test = sprintf("0x%02x,", ($syllable >> 8) & 0xff);
	print INST_FILE_HEADER $test;
	$test = sprintf("0x%02x,", ($syllable) & 0xff);
	print INST_FILE_HEADER $test, "\n";

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
	print INST_FILE2 &hex_to_ascii($test);
	$test_address++;
    }
    if(($syllable & 0x80000000) >> 31)
    {
	$sim_needs_a_clock = 1;
	if($for_sim =~ /NOP/)
	{
	}
	elsif($this_was_a_goto)
	{
	    $this_was_a_goto = 0;
	}
	elsif($output[$outting+1] =~ /imm\s+\w+/)
	{
	    $need_a_clock_after_imm = 1;
	}
	elsif($output[$outting+1] =~ /EXTRA32BITS/)
	{
	    $need_a_clock_after_imm = 1;
	}
	elsif($output[$outting] =~ /imm\s+\w+/)
	{
	    ($temp_address,$temp_syllable,$temp_comment) = split(/\s+-\s+/, $output[$outting-1]);
	    if(($temp_syllable & 0x80000000) >> 31)
	    {
	    }
	    else
	    {
		$sim_needs_a_clock = 0;
	    }
	}
	else
	{
	    $next_pc_address = sprintf("0x%x", (($test_address) * 4));
	    print SIMULATOR "\n\t\tBUNDLE_COUNT(cntxt, hcntxt, $bundle_count);\n";
	    print INST_DEFINES "#define ", $current_label_for_hash_define, "_end ", $test_address - 1, "\n";
		$bundle_count = 0;
		$need_a_clock_after_imm = 0;
		if($to_branch ne "")
		{
		    print SIMULATOR $to_branch;
		    $to_branch = "";
		}
		if($to_goto ne "")
		{
		    print SIMULATOR $to_goto;
		    $to_goto = "";
		}
		elsif($to_call ne "")
		{
		    print SIMULATOR $to_call;
		    $to_call = "";
		}
		elsif($to_return ne "")
		{
		    print SIMULATOR $to_return;
		    $to_return = "";
		}
	    else
	    {
		print SIMULATOR "\t\tstrcpy(next_pc[cntxt][hcntxt], \"label$next_pc_address\"); /* 5 */\n\t\treturn 0;\n\t}\n";
	    }
	}
    }
}
close INST_FILE_READ2;
close INST_FILE_READ;
close INST_FILE;
close INST_FILE2;
$_[3] =~ /^(\w+)/;
print INST_FILE_HEADER "};\n#define " . uc($1) . "_INST_SIZE $instruction_size\n";
close INST_FILE_HEADER;
close IMMS;
close SIMULATOR;
close INST_DEFINES;
open FUNCS, "> temp_functions.h" or die
    "ERROR:\nCould not open file: temp_functions.h\n\n";
print FUNCS "#ifndef _GUARD_FUNCS\n#define _GUARD_FUNCS\n";
foreach $Func (@Functions)
{
    print FUNCS $Func, "\n";
}
print FUNCS "#endif\n";
close FUNCS;
open HASH, "> temp_labels_hash.h" or die
    "ERROR:\nCould not open file: temp_labels_hash.csc.\n\n";
print HASH "#ifndef _GUARD_LABELS_HASH\n#define _GUARD_LABELS_HASH\n";
$num_of_funcs = $#Functions + 1;
	    print HASH<<END;
/**/#include <stdio.h>
/**/#include "hashtbl.h"
/**/#include "temp_functions.h"
HASHTBL *hashtbl;
void build_hashtable(void)
{
/* create the hash table */
\tif(!(hashtbl=hashtbl_create($num_of_funcs, NULL)))
\t{
\t\tfprintf(stderr, "ERROR: hashtbl_create() failed\\n");
\t\texit(EXIT_FAILURE);
\t}
END
foreach $Func (@Functions)
{
    $Func =~ /^void\s+\*(label0x\w+)/;
    print HASH "\thashtbl_insert(hashtbl, \"$1\", $1);\n";
}
    print HASH<<END;
return;
}
END
    print HASH "#endif\n";
close HASH;
}
sub print_data()
{
    open DATA_FILE, "> @_[0].big" or die
	"Second Pass Failed\nCould not open file (@_[0].big): $!\n";
    open DATA_FILE2, "> @_[0]\.little" or die
	"Second Pass Failed\nCould not open file (@_[0].little): $!\n";
    open DATA_FILE_HEADER, "> @_[2]" or die
	"Second Pass Failed\nCould not open file (@_[2]): $!\n";
    $_[2] =~ /^(\w+)/;
    print DATA_FILE_HEADER "/* data area */\n#define " . uc($1) . "_DATA_SIZE " . ($#Memory + 1) * 4 . "\nchar $1\_d[] = {\n";
    open DATA_FILE_READ, "> @_[1]" or die
	"Second Pass Failed\nCould not open file (@_[1]): $!\n";
    open DATA_SIM, "> temp_data.h" or die "ERROR:\nCould not open file: temp_data.h\n\n";
print DATA_SIM "#ifndef _GUARD_DATA\n#define _GUARD_DATA\n";
    $size_of_array = ($#Memory + 1) * 4;
    print DATA_SIM<<HEADER;
/* data section required by the simulator */
unsigned int size_of_memory = $size_of_array;
unsigned char Sim_Memory[$size_of_array] = {
HEADER
    print DATA_FILE_READ "ADDR - DATA     - VALUE\n";

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
	    print DATA_SIM "\t\t\t0x", $str, ",\n";
	    print DATA_FILE_HEADER "0x", $str, ",";
	}
	@str = reverse(@str);
	undef($data_little);
	foreach $str (@str)
	{
	    $data_little .= $str;
#	    print DATA_SIM "\t\t\t0x", $str, ",\n";
	}
	$line = &hex_to_ascii($data);
	$line =~ s/\n/^n/g;
	printf(DATA_FILE_READ "%04x - %s - %s\n", ($count*4), $data, $line);
	$count++;
	print DATA_FILE &hex_to_ascii($data);
	print DATA_FILE2 &hex_to_ascii($data_little);
	print DATA_FILE_HEADER "\n";
    }
print DATA_SIM "};\n";
print DATA_FILE_HEADER "};\n";
close DATA_FILE_HEADER;
    close DATA_FILE_READ;
    close DATA_FILE2;
    close DATA_FILE;
print DATA_SIM "#endif\n";
close DATA_SIM;
    open DATALABELS, "> temp_data_labels.h" or die "ERROR:\nCould not open file: temp_data_labels.h\n\n";
    open DATALABELS_EXT, "> temp_data_labels_ext.h" or die "ERROR:\nCould not open file: temp_data_labels_ext.h\n\n";
print DATALABELS "#ifndef _GUARD_DATA_LABELS\n#define _GUARD_DATA_LABELS\n";
    foreach $key (keys(%Data_Label))
    {
	if($Data_Label{$key} >= 0)
	{
	    $label_name = $key;
	    $label_name =~ s/\./X/g;
	    $label_name =~ s/\?/X/g;
	    print DATALABELS "unsigned int $label_name = $Data_Label{$key};\n";
	    print DATALABELS_EXT "extern unsigned int $label_name;\n";
	}
    }
print DATALABELS "#endif\n";
    close DATALABELS;
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
sub print_stalled()
{
print SIMULATOR <<STALL;
\t\t/* after a load or store this will need to be added */
\t\t{
\t\t\tstalled$_[0]:
\t\t\t
\t\t\tif(stalled[cntxt][hcntxt])
\t\t\t{
\t\t\t\tCYCLE_INCREMENT(cntxt, hcntxt); 
\t\t\t\t//printf("STALLED FOR THIS CYCLE: [%d][%d]\\n", cntxt, hcntxt);
\t\t\t\tSCount[cntxt][hcntxt]++;
\t\t\t\tBUNDLE_COUNT(cntxt, hcntxt, 0);
\t\t\t\t// then output a stall
\t\t\t\twait[cntxt][hcntxt] = 0;
\t\t\t\tgoto stalled$_[0];
\t\t\t}
\t\t\telse
\t\t\t{
\t\t\t\t//printf("NOT STALLED: [%d][%d]\\n", cntxt. hcntxt);
\t\t\t}
\t\t}
STALL
}

sub token_string()
{
    print SIMULATOR<<ALL;
    int check_args[10], count = 0, check = 0;
    char *point;

    point = (stack_bottom + sim_$1\[cntxt\]\[hcntxt\]\[$2\]\[$3\]);

    do {
	if(check)
	{
	    if(*point == 's')
	    {
		check_args[count] = (unsigned int)stack_bottom;
	    }
	    else
	    {
		check_args[count] = 0;
	    }
	    check = 0;
	    count++;
	}
	
	if(*point == '%')
	{
	    check = 1;
	}
    } while(*point++ != '\\0');
ALL
#print SIMULATOR "\t\tprintf(\"[THREADID: %02d] \", ((cntxt << 4) | hcntxt));\n";
}

sub token_string_scanf()
{
    print SIMULATOR<<ALL;
    int check_args[10], count = 0, check = 0, temp[10];
    char *point;

    point = (stack_bottom + sim_$1\[cntxt\]\[hcntxt\]\[$2\]\[$3\]);

    do {
	if(check)
	{
	    if(*point == 's')
	    {
		check_args[count] = (unsigned int)stack_bottom;
	    }
	    else
	    {
		check_args[count] = 0;
	    }
	    check = 0;
	    count++;
	}
	
	if(*point == '%')
	{
	    check = 1;
	}
    } while(*point++ != '\\0');
ALL
#print SIMULATOR "\t\tprintf(\"[THREADID: %02d] \", ((cntxt << 4) | hcntxt));\n";
}

sub sortdatalabel()
{
    $Data_Label{$a} <=> $Data_Label{$b};
}

sub sortinstlabel()
{
    $Inst_Label{$a} <=> $Inst_Label{$b};
}
