/* testc - Test adpcm coder */

#include "adpcm.h"
#include <stdio.h>
#include <stdlib.h>

struct adpcm_state state;

#define NSAMPLES 1000

char	abuf[NSAMPLES/2];
#ifdef PRINT
short	sbuf[NSAMPLES];
#else
#include "sbuf.h"
#endif

int main(void) {
  int n;
#ifdef PRINT
  while(1) {
    n = read(0, sbuf, NSAMPLES*2);
    if ( n < 0 ) {
      perror("input file");
      exit(1);
    }
    if ( n == 0 ) break;
#else
    n = NSAMPLES*2;
#endif
    adpcm_coder((short *)sbuf, abuf, n/2, &state);
#ifdef PRINT
    write(1, abuf, n/4);
  }
  fprintf(stderr, "Final valprev=%d, index=%d\n",
	  state.valprev, state.index);
#endif
  exit(0);
}
