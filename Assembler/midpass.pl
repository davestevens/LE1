#!/usr/bin/perl

###############################################################################
#                               LE1 Tool-Chain                                #
#                            Assembler/midpass.pl                             #
#                           Dave Stevens - A767169                            #
#                          Loughborough University                            #
#                              D.Stevens.ac.uk                                #
###############################################################################
$dram_base_offset = 0;
foreach $arg (@ARGV)
  {
    if($arg =~ /-o(\w+)/)
      {
	$outputname = $1;
      }
    elsif($arg =~ /-DRAM_OFFSET=0x(\w+)/)
    {
	$dram_base_offset = hex($1);
    }
    else
      {
	push @files, $arg;
      }
  }
if($#files < 1)
  {
    print "You entered 1 or less files, you don't need this pass for that\n";
    exit(0);
  }
for($i=0;$i<=$#files;$i++)
  {
    open FILE, "< $files[$i]" or die;
    while( <FILE> )
      {
	if(/^-- FUNC_main\n/)
	  {
	    if($main eq "")
	      {
		$main = $files[$i];
		splice(@files, $i, 1);
		$i--;
	      }
	    else
	      {
	      print "ERROR:\nLooking at $files[$i] : ALREADY FOUND MAIN IN \"$main\"\n";
		exit(0);
	      }
	  }
      }
    close FILE;
  }
if($main eq "")
  {
    print "ERROR:\nCould not find a main anywhere :(\n";
    exit(0);
  }
splice(@files, 0, 0, $main);
$instruction_total = 0;
$data_total = 0;
$data_current = 0;
$bss_total = 0;
$bss_current = 0;

%supported_functions = ( "FUNC_printf", 1,
			 "FUNC__feof", 1,
			 "FUNC_fopen", 1,
			 "FUNC_fclose", 1,
			 "FUNC_fscanf", 1,
			 "FUNC_clock", 1,
			 "FUNC_exit", 1,
			 "FUNC_fflush", 1,
			 "FUNC_fprintf", 1,
			 "FUNC_fgetc", 1,
			 "FUNC_fgets", 1,
			 "FUNC_fputc", 1,
			 "FUNC_fputs", 1,
			 "FUNC_fread", 1,
			 "FUNC_fwrite", 1,
			 "FUNC_sscanf", 1,
			 "FUNC_sprintf", 1,
    );

foreach $file (@files)
  {
    $order .= "$file ";
    if($file =~ /\//)
      {
	@f = split(/\//, $file);
	$filename = $f[$#f];
      }
    else
      {
	$filename = $file;
      }
    @i = split(/\./, $filename);
    $filename = $i[0];
    open FILE, "< $file" or die "Could not open file ($file: $!)\n";
    @current_file = <FILE>;
    close FILE;
    for($i=0;$i<=$#current_file;$i++)
      {
	if($current_file[$i] =~ s/(L\d+\?\d+)/$filename\_$1/)
	  {
	  }
	elsif($current_file[$i] =~ s/(_\?\d+\.\w+\.TAG\.\d+\.\d+)/$filename\_$1/)
	{
#	    print "$current_file[$i]";
	}
      }
for($i=0;$i<=$#current_file;$i++)
{
  if($current_file[$i] =~ /\#\# Operations - (\d+)/)
    {
      $no_of_instrs = $1;
      $i++;
      while(($current_file[$i] !~ /^\n/) && ($i <= $#current_file))
	{
	  push @operations, $current_file[$i];
	  $i++;
	}
    }
  if($current_file[$i] =~ /\#\#ImportObject/)
    {
      $i++;
      while(($current_file[$i] !~ /^\n/) && ($i <= $#current_file))
	{
	  push @importobjects, $current_file[$i];
	  $i++;
	}
    }
  if($current_file[$i] =~ /\#\#Import/)
    {
      $i++;
      while(($current_file[$i] !~ /^\n/) && ($i <= $#current_file))
	{
	  push @imports, $current_file[$i];
	  $i++;
	}
    }
  if($current_file[$i] =~ /\#\#Instruction Labels/)
    {
      $i++;
      while(($current_file[$i] !~ /^\n/) && ($i <= $#current_file))
	{
	  ($address, $label) = split(/ - /, $current_file[$i]);
	  $test = hex($address) + $instruction_total;
	  $test2 = sprintf("%04x", $test);
	  push @inst_labels, "$test2 - $label";#$current_file[$i];
	  $i++;
	}
    }
  if($current_file[$i] =~ /\#\#Data Labels/)
    {
      $i++;
      while(($current_file[$i] !~ /^\n/) && ($i <= $#current_file))
	{
	  ($address, $label) = split(/ - /, $current_file[$i]);
	  $test = hex($address) + $data_total;
	  $test2 = sprintf("%04x", $test);
	  # need to check if it already exists
	  chomp($label);
	  if($Data_Labels{$label} eq '') {
	      push @data_labels, "$test2 - $label\n";#$current_file[$i];
	      $Data_Labels{$label} = $test;
	  }
	  else {} # already exists, could be duplicate symbol (code error) or compilation issue
	  $i++;
	}
    }
  if($current_file[$i] =~ /\#\#Data Section - (\d+) - Data_align=(\d+)/)
    {
      $data_align = $2;
      $size_of_data = $1;
      $i++;
      while(($current_file[$i] !~ /^\n/) && ($i <= $#current_file))
	{
	  ($address, $hex, $bin) = split(/ - /, $current_file[$i]);
	  $test = sprintf("%04x", $data_current);
          if($hex =~ /[A-Fa-f0-9]{8}/)
          {
              push @memory, "$test - $hex - $bin";#$current_file[$i];
          }
	  elsif($hex =~ /LABEL: (.+)/)
	  {
	      push @memory, "$test - LABEL: $1\n";
	  }
          else
          {
	      $hex =~ /(\(*(\w*\??(\w+\.*)+)((\s*[+-]?\s*\d*\))*))/;
	      $rahrahrah = $filename . $2;
	      $value_new = ($Data_Labels{$rahrahrah} + $dram_base_offset);
	      @value_extra = split(/\)/, $4);
	      foreach $value_extra (@value_extra)
	      {
		  $value_extra =~ /([-+])(\d+)/;
		  if($1 eq "+")
		  {
		      $value_new += $2;
		  }
		  elsif($1 eq "-")
		  {
		      $value_new -= $2;
		  }
		  else
		  {
		  }
	      }
	      $value_new = sprintf("%08x", $value_new);
	      $value_new_bin = sprintf("%032b", $value_new);
              push @memory, "$test - $value_new - $value_new_bin\n";
          }
	  $data_current += 4;
	  $i++;
	}
    }
  if($current_file[$i] =~ /\#\#BSS Labels - (\d+) - Bss_align=(\d+)/)
    {
      $bss_align = $2;
      $size_of_bss = $1;
      $i++;
      while(($current_file[$i] !~ /^\n/) && ($i <= $#current_file))
	{
	  ($address, $label) = split(/ - /, $current_file[$i]);
	  $test = hex($address) + $bss_total;
	  $test2 = sprintf("%04x", $test);
	  push @bss_labels, "$test2 - $label";
	  $i++;
	}
    }
}
$instruction_total += ($no_of_instrs * 4);
$data_total += $size_of_data;
$bss_total += $size_of_bss;
  }
if(!(-d $outputname))
  {
    mkdir($outputname);
  }
open FILE, "> $outputname/$outputname.temp.s" or die;
print FILE<<ENDOFHEADER;
ENDOFHEADER
$is = $instruction_total / 4;
print FILE "\#\# Operations - $is\n";
foreach $ops (@operations)
{
  print FILE $ops;
}
undef %saw;
@saw{@imports} = ();
@imports = sort keys %saw;  # remove sort if undesired
undef %saw;
@saw{@importobjects} = {};
@importobjects = sort keys %saw;
$found_it = 0;
foreach $imp (@imports)
  {
      #$imp = "FUNC_" . $imp;
    foreach $lab (@inst_labels)
      {
	($addr, $label) = split(/ - /, $lab);
	if($imp eq $label)
	  {
	    $found_it = 1;
	    next;
	  }
      }
    if($found_it == 0)
    {
	push @imports_needed, $imp;
    }
    $found_it = 0;
  }
$found_it = 0;
foreach $imp (@importobjects)
{
    foreach $lab (@data_labels)
      {
	($addr, $label) = split(/ - /, $lab);
	if($imp eq $label)
	  {
	    $found_it = 1;
	    next;
	  }
      }
    foreach $lab (@bss_labels)
      {
	($addr, $label) = split(/ - /, $lab);
	if($imp eq $label)
	  {
	    $found_it = 1;
	    next;
	  }
      }
    if($found_it == 0)
      {
	push @importobjects_needed, $imp;
      }
    $found_it = 0;
  }
print FILE "\n\n\#\#Import\n";
foreach $ops (@imports_needed)
{
    chomp($ops);
    print FILE $ops;
    if($supported_functions{$ops})
    {
	print FILE " *supported in the Simulator";
    }
    print FILE "\n";
}
print FILE "\n\n\#\#ImportObjects\n";
foreach $ops (@importobjects_needed)
{
  print FILE $ops;
}
print FILE "\n\n\#\#Instruction Labels\n";
foreach $ops (@inst_labels)
{
  print FILE $ops;
}
print FILE "\n\n\#\#Data Labels\n";
foreach $ops (@data_labels)
{
  print FILE $ops;
}
print FILE "\n\n\#\#Data Section - $data_total - Data_align=$data_align\n";
foreach $ops (@memory)
{
  print FILE $ops;
}
print FILE "\n\n\#\#BSS Labels - $bss_total - Bss_align=$bss_align\n";
foreach $ops (@bss_labels)
  {
    print FILE $ops;
  }
close FILE;
print "Mid Pass Completed\
Single .s file should now be located in $outputname/$outputname.temp.s\nORDER$order\n";
exit(0)
