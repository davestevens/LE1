some notes

Vajazzle:

Make Vajazzle
will create a binary VAJAZZLE
it requires a vajazzle.h in inc/ (created by Assembler)

then compile with 
gcc -o fullVajazzle VAJAZZLE ../../bench/simple/main/main.vajazzle.o ../../bench/simple/main/main.vajazzle.c -I../../bench/simple/main/ -lm  -m32 `xml2-config --libs`
where *.vajazzle.[co] are created by the Assembler

./fullVajazzle <MACHINE MODEL>

need to sort out endianness, i think i need to go back to working out types again
at the moment it works with sizes, but shorts/chars can take up 4 bytes because of packing

