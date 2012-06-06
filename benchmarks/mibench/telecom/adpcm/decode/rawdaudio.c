/* testd - Test adpcm decoder */

#include "adpcm.h"
#include <stdio.h>

struct adpcm_state state;

#define NSAMPLES 1000

char	abuf[NSAMPLES/2];
short	sbuf[NSAMPLES];

#ifdef MAIN_ARGS
int main(int argc, char *argv[]) {
#else
int main_test(int, char **);

int main(void) {
  int _argc = 3;
  char *_argv[3] = {
    "rawdaudio",
    "input/input",
    "output/output"
  };
  return main_test(_argc, _argv);
}


int main_test(int argc, char *argv[]) {
#endif
    int n;
#if 0
    while(1) {
      n = read(0, abuf, NSAMPLES/2);
      if ( n < 0 ) {
	perror("input file");
	exit(1);
      }
      if ( n == 0 ) break;
      adpcm_decoder(abuf, sbuf, n*2, &state);
      write(1, sbuf, n*4);
	}
    fprintf(stderr, "Final valprev=%d, index=%d\n",
	    state.valprev, state.index);
    exit(0);
#else
    FILE *fp, *fOut;

    if(argc != 3) {
      printf("usage: input_file output_file\n");
      return -1;
    }
    fp = fopen(argv[1], "rb");
    if(fp == NULL) {
      printf("could not open file: %s\n", argv[1]);
      return -1;
    }
    fOut = fopen(argv[2], "wb");
    if(fOut == NULL) {
      printf("could not open filre: %s\n", argv[2]);
      return -1;
    }

    while(1) {
      n = fread(abuf, 1, (NSAMPLES/2), fp);
      if(n == 0) { break; }
      adpcm_decoder(abuf, sbuf, n*2, &state);
      fwrite(sbuf, 1, (n*4), fOut);
    }
    fclose(fp);
    fclose(fOut);

    printf("Final valprev=%d, index=%d\n",
	    state.valprev, state.index);
    return 0;
#endif
}
