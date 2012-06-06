#include <stdio.h>

#define BUFLEN 1024

char A[BUFLEN], B[BUFLEN];

main()
{
  char *a, *b;
  int i;

  /* initialize null-terminated string in buffer A */
  for (i=0; i<BUFLEN-1; i++) {
    A[i] = 'a'+(i%26);
  }
  A[i] = '\0';

  printf("a:%s\n", A);

  /* copy string in A to buffer B */
  a = &A[0];
  b = &B[0];

  while (*a != 0) {
    *b++ = *a++;
  }

  printf("b:%s\n", B);
}
