/* +++Date last modified: 05-Jul-1997 */

/*
**  BITCNTS.C - Test program for bit counting functions
**
**  public domain by Bob Stout & Auke Reitsma
*/

#include <stdio.h>
#include <stdlib.h>
#include "conio.h"
#include <limits.h>
#include <time.h>
//#include <float.h>
#include "bitops.h"

#define FUNCS  7

static int CDECL bit_shifter(long int x);

#ifdef MAIN_ARGS
int main(int argc, char *argv[])
#else
int main_test(int, char **);

int main(void) {
  int _argc = 2;
  char *_argv[2] = {
    "bitcount_int",
    "10"
  };
  return main_test(_argc, _argv);
}

int main_test(int argc, char *argv[])
#endif
{
  clock_t start=0, stop=0;
  int ct=0, cmin = 100000, cmax = 0;
  int i=0, cminix=0, cmaxix=0;
  long j=0, n=0, seed=0;
  int iterations=0;
  static int (* CDECL pBitCntFunc[FUNCS])(long) = {
    bit_count,
    bitcount,
    ntbl_bitcnt,
    ntbl_bitcount,
    /*            btbl_bitcnt, DOESNT WORK*/
    BW_btbl_bitcount,
    AR_btbl_bitcount,
    bit_shifter
  };
  static char *text[FUNCS] = {
    "Optimized 1 bit/loop counter",
    "Ratko's mystery algorithm",
    "Recursive bit count by nybbles",
    "Non-recursive bit count by nybbles",
    /*            "Recursive bit count by bytes",*/
    "Non-recursive bit count by bytes (BW)",
    "Non-recursive bit count by bytes (AR)",
    "Shift and count bits"
  };
  if (argc<2) {
    printf("Usage: bitcnts <iterations>\n");
    exit(-1);
	}
  iterations=atoi(argv[1]);
  
  printf("Bit counter algorithm benchmark\n");
  
  for (i = 0; i < FUNCS; i++) {
    start = clock();
    
    for (j = n = 0, seed = rand(); j < iterations; j++, seed += 13)
	 n += pBitCntFunc[i](seed);
    
    stop = clock();
    ct = (stop - start) / (int)CLOCKS_PER_SEC;
    if (ct < cmin) {
	 cmin = ct;
	 cminix = i;
    }
    if (ct > cmax) {
	 cmax = ct;
	 cmaxix = i;
    }
    
    //printf("%-38s> Time: %7.3f sec.; Bits: %ld\n", text[i], ct, n);
    printf("%-38s>  Bits: %ld\n", text[i], n);
  }
  //printf("\nBest  > %s\n", text[cminix]);
  //printf("Worst > %s\n", text[cmaxix]);
  return 0;
}

static int CDECL bit_shifter(long int x)
{
  int i, n;
  
  for (i = n = 0; x && (i < (sizeof(long) * CHAR_BIT)); ++i, x >>= 1)
    n += (int)(x & 1L);
  return n;
}