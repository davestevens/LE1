#!/usr/bin/perl
# this file is used to point to the different scripts/files which you need

use strict;
use Getopt::Long;  # Switch option Handling

# default switch options
my $help;
our $vex_location    = "/home/elds2/vex-3.43/bin/cc";
our $le1_folder      = "/home/elds2/LE1";

# name of the folder containing assembler
our $assembler_folder = "Assembler";

# names of scripts, shouldn't really be changed
my $firstpass_name   = "firstpass.pl";
my $midpass_name     = "midpass.pl";
my $secondpass_name  = "secondpass.pl";
my $transform_name   = "trans.pl";
my $pullin_name      = "pullIn.pl";
my $deps_name        = "deps.pl";
my $falconml_hack_name = "FalconML_hack.pl";
my $xml_to_mm_name   = "xml_to_mm.pl";

my $libraries        = "includes/libraries/";

# these should be removed at some point soon
my $floatlib         = "includes/floatlib.c";
my $opcodes          = "includes/opcodes.txt";

# perl location, found by running "which perl"
our $perl             = "/usr/bin/perl";

# you shouldn't have to alter any of these, they are made up of values you change above
our $firstpass  = $le1_folder . "/" . $assembler_folder . "/" . $firstpass_name;
our $midpass    = $le1_folder . "/" . $assembler_folder . "/" . $midpass_name;
our $secondpass = $le1_folder . "/" . $assembler_folder . "/" . $secondpass_name;
our $transform  = $le1_folder . "/" . $assembler_folder . "/" . $transform_name;
our $pullin       = $le1_folder . "/" . $assembler_folder . "/" . $libraries . "scripts/" . $pullin_name;
our $deps       = $le1_folder . "/" . $assembler_folder . "/" . $libraries . "scripts/" . $deps_name;
our $libraries  = $le1_folder . "/" . $assembler_folder . "/" . $libraries;
our $falconml_hack   = $le1_folder . "/" . $assembler_folder . "/" . $falconml_hack_name;
our $xml_to_mm   = $le1_folder . "/" . $assembler_folder . "/" . $xml_to_mm_name;

# these should be removed at some point soon
our $floatlib   = $le1_folder . "/" . $assembler_folder . "/" . $floatlib;
our $opcodes    = $le1_folder . "/" . $assembler_folder . "/" . $opcodes;
