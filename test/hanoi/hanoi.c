/*
 * The Towers Of Hanoi
 * C
 * Copyright (C) 1998 Amit Singh. All Rights Reserved.
 *
 * Tested with, ah well ... :)
 */

#include <stdio.h>
#include <stdlib.h>
#include <limits.h>

#define FROM 1
#define TO 3
#define USING 2

void
dohanoi(int N, int from, int to, int using)
{
  if (N > 0) {
    dohanoi(N-1, from, using, to);
#ifdef PRINT
    printf ("move %d --> %d\n", from, to);
#endif
    dohanoi(N-1, using, to, from);
  }
}

int
main (void)
{
  long int N = 10;

  /* a bit of error checking, LONG_XXX should be there in limits.h */
  if (N == LONG_MIN || N == LONG_MAX || N <= 0) {
#ifdef PRINT
    fprintf(stderr, "illegal value for number of disks\n");
#endif
    exit(2);
  }

  dohanoi(N, FROM, TO, USING);

  exit(0);
}
