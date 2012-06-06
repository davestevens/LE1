/* The Fibonacci number computation.

   Computes a fibonacci number using recursion.

   Spyros Triantafyllis, 03/16/04
*/

#include <stdio.h>
#include <stdlib.h>



int fib(int n) {
  int i, j, k;
  if (n <= 2)
    return 1;

  i = fib(n-1);
  j = fib(n-2);
  k = i + j;
  return k;
}

#ifdef MAIN_ARGS
int main (int argc, char *argv[])
#else
int main_test (int, char **);

int main(void) {
  int _argc = 2;
  char *_argv[2] = {
    "fib_rec",
    "10"
  };
  return main_test(_argc, _argv);
}

int main_test (int argc, char *argv[])
#endif
{
  int i, f1, f2, N;
  int f = 0;

  if (argc < 2) {
    printf("Usage: fib <n>\n");
    exit(1);
  }
  N = atoi(argv[1]);

  printf("fib %d = %d\n", N, fib(N));
  exit(0);
}
