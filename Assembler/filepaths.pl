# this file is used to point to the different scripts/files which you need

# full path to your vex install
$vex_location     = "/home/elds2/vex-3.41/bin/cc";

# full path to the LE1 folder
$le1_folder       = "/home/elds2/git/LE1";

# name of the folder containing assembler
$assembler_folder = "Assembler";

# names of scripts, shouldn't really be changed
$firstpass_name   = "firstpass.pl";
$midpass_name     = "midpass.pl";
$secondpass_name  = "secondpass.pl";
$transform_name   = "trans.pl";
$pullin_name      = "pullIn.pl";
$deps_name        = "deps.pl";
$vajazzle_name    = "vajazzle.pl";

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
$vajazzle   = $le1_folder . "/" . $assembler_folder . "/" . $vajazzle_name;

# these should be removed at some point soon
$floatlib   = $le1_folder . "/" . $assembler_folder . "/" . $floatlib;
$opcodes    = $le1_folder . "/" . $assembler_folder . "/" . $opcodes;
