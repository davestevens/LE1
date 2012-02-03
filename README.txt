=== LE1 Tool Collection ===

* Requires VEX compiler
  - available from http://www.hpl.hp.com/downloads/vex/
  - version 3.43

* Assembler
  - generate.pl script runs through whole flow
  - .c -> LE1 binaries (separate iram + dram)
  - arguments to generate.pl
    : <directory of C files>			(Compiles all .c files in given directory)
    : -d					(Prints operations being performed)
    : -cpuid					(Defines getCPUID() operation)
    : -pthread					(Includes pthread_create/_join assembly instructions)
    : -MALLOC_SIZE=%d				(Defines chunck sizes for dynamic memory, default=100)
    : -fmm=/abs/path/to/VEX/machinemodel.fmm	(Passes VEX mm file to VEX compiler)
    : -xmlMM=/abs/path/tp/LE1XML.xml		(Generates VEX mm file, passes to VEX compiler)
    : -o%s					(Sets output directory name, default is input directory capitalised)
    : UNDEFINED					(Any unknown will be passed to the VEX compiler, -D..)

  - Creates directories in input directory
    : binaries					(iram0.bin and dram.bin, used by Insizzle)
    : microblaze				(inst.h, data.h, le1_obj.h, used for hardware LE1 with microblaze)
    : machinemodel				(if -xmlMM is used the xml and mm files are copied here)
    : OUTPUT					(Includes assembly file and some other text files useful for debugging)

* Insizzle (Instruction Set Simulator)
  - Needs to be run from a directory with a binaries directory containing iram0.bin and dram.bin
  - arguments to INSIZZLE
    : rel/path/to/LE1XML.xml			(Configures INSIZZLE, if config differs from config passed to Assembler it can cause undefined behaviour)
    : -similarIRAM				(In multi-context system INSIZZLE looks for different irams (iram%d.bin where %d referes to context, use flag to use similar IRAM across contexts)
    : -printout					(Printout operation details during execution)
  - State dump
    : At the start of execution Insizzle will print out its process id. (PID: %d)
    : Use this PID to send a SIGUSR1 signal to INSIZZLE
      + usage: kill -s SIGUSR1 %d
    : On receiving the signal a state dump will be performed
      + This contains cycle count, register, program counters and internal state for each context along with full DRAM dump
    : File - stateDump.dat
    : Similar file is created in the event of a segmentation fault
