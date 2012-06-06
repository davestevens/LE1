/* NIST Secure Hash Algorithm */

#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <time.h>
#include "sha.h"

#ifdef MAIN_ARGS
int main(int argc, char **argv)
#else
int main_test(int, char **);

int main(void) {
  int _argc = 2;
  char *_argv[2] = {
    "sha",
    "input/input"
  };
  return main_test(_argc, _argv);
}


int main_test(int argc, char **argv)
#endif
{
    FILE *fin;
    SHA_INFO sha_info;

    if (argc < 2) {
	fin = stdin;
	sha_stream(&sha_info, fin);
	sha_print(&sha_info);
    } else {
	while (--argc) {
	    fin = fopen(*(++argv), "rb");
	    if (fin == NULL) {
		printf("error opening %s for reading\n", *argv);
	    } else {
		sha_stream(&sha_info, fin);
		sha_print(&sha_info);
		fclose(fin);
	    }
	}
    }
    return(0);
}
