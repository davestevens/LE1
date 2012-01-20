#!/usr/bin/perl
# this file is used to point to the different scripts/files which you need

use Getopt::Long;  # Switch option Handling

# default switch options
my $help;
$vex_location    = "/home/elds2/vex-3.41/bin/cc";
$le1_folder      = "/home/elds2/LE1";

# name of the folder containing assembler
$assembler_folder = "Assembler";

# names of scripts, shouldn't really be changed
$firstpass_name   = "firstpass.pl";
$midpass_name     = "midpass.pl";
$secondpass_name  = "secondpass.pl";
$transform_name   = "trans.pl";
$pullin_name      = "pullIn.pl";
$deps_name        = "deps.pl";
$falconml_hack_name = "FalconML_hack.pl";

$libraries        = "includes/libraries/";

# these should be removed at some point soon
$floatlib         = "includes/floatlib.c";
$opcodes          = "includes/opcodes.txt";

# perl location, found by running "which perl"
$perl             = "/usr/bin/perl";

# you shouldn't have to alter any of these, they are made up of values you change above
$firstpass  = $le1_folder . "/" . $assembler_folder . "/" . $firstpass_name;
$midpass    = $le1_folder . "/" . $assembler_folder . "/" . $midpass_name;
$secondpass = $le1_folder . "/" . $assembler_folder . "/" . $secondpass_name;
$transform  = $le1_folder . "/" . $assembler_folder . "/" . $transform_name;
$pullin       = $le1_folder . "/" . $assembler_folder . "/" . $libraries . "scripts/" . $pullin_name;
$deps       = $le1_folder . "/" . $assembler_folder . "/" . $libraries . "scripts/" . $deps_name;
$libraries  = $le1_folder . "/" . $assembler_folder . "/" . $libraries;
$falconml_hack   = $le1_folder . "/" . $assembler_folder . "/" . $falconml_hack_name;

# these should be removed at some point soon
$floatlib   = $le1_folder . "/" . $assembler_folder . "/" . $floatlib;
$opcodes    = $le1_folder . "/" . $assembler_folder . "/" . $opcodes;
