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

# these should be removed at some point soon
$pthread_name     = "pthread.pl";
$floatlib         = "includes/floatlib.c";

# perl location, found by running "which perl"
$perl             = "/usr/bin/perl";

# you shouldn't have to alter any of these, they are made up of values you change above
$firstpass  = $le1_folder . "/" . $assembler_folder . "/" . $firstpass_name;
$midpass    = $le1_folder . "/" . $assembler_folder . "/" . $midpass_name;
$secondpass = $le1_folder . "/" . $assembler_folder . "/" . $secondpass_name;
$transform  = $le1_folder . "/" . $assembler_folder . "/" . $transform_name;

# these should be removed at some point soon
$pthread    = $le1_folder . "/" . $assembler_folder . "/" . $pthread_name;
$floatlib   = $le1_folder . "/" . $assembler_folder . "/" . $floatlib;
