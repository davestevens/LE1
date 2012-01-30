This is a quick test bench, I will add more tests as I go along.

Script to run through both debug and release mode.

To create a new test
create the following directory structure:
LE1/test/<test_dir>
In that directory move your C code and create a 'check' directory.
In the check directory add 2 files:
machinemodel.xml : LE1 xml machine model
memout : memoryDump_0.dat file from a known good run

Then edit the test.pl file to add this nesw test to the run
{'dir_name', '<test_dir>', 'ass_args', '<Assembler arguments>', 'sim_args', '<INSIZZLE arguments'}


