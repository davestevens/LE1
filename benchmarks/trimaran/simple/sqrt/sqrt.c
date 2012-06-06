#include <stdio.h>
#include <stdlib.h>

#define SIZE 100

int NUM;
#define ITER 10
#define INIT 1.0

/* Newton Raphson method to find the roots of f(x)
   x[k+1] = x[k] - f(x[k])/f'(x[k])
*/

#ifdef MAIN_ARGS
int main (int argc, char *argv[])
#else
int main_test (int, char **);

int main(void) {
  int _argc = 2;
  char *_argv[2] = {
    "sqrt",
    "12"
  };
  return main_test(_argc, _argv);
}

int main_test (int argc, char *argv[])
#endif
{
  double x[SIZE];
  int i,j;

  if (argc < 2) {
    printf("Usage: sqrt <size>\n");
    exit(1);
  }
  NUM = atoi(argv[1]);

  for (i=0 ; i<NUM ; i++) x[i] = INIT;

  for (j=0 ; j<ITER ; j++)
    for (i=0 ; i<NUM ; i++)
      x[i] = x[i] - (x[i]*x[i] - (i+1))/(2*x[i]);
  
  for (i=0 ; i<NUM ; i++) 
    printf("sqrt(%d) = %f\n", (i+1), x[i]);
  exit(0);
}
