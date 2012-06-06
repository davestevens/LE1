/* The Matrix Multiply computation.

   Creates and  multiplies two matrices and sums up all the elements
   of the resulting matrices. 

   October 31, 1995
   Shail Aditya.
*/

#include <stdio.h>
#include <stdlib.h>

#define SIZE 100

double a[SIZE][SIZE], b[SIZE][SIZE], c[SIZE][SIZE];
int NUM;

void init () {
  int i,j;

  for (i=0 ; i < NUM ; i++) 
    for (j=0 ; j < NUM ; j++)
      a[i][j] = b[i][j] = i+j;
}

void matmult() {
  int i,j,k;
  double s1;

  for (i=0 ; i < NUM ; i++) 
    for (j=0 ; j < NUM ; j++) {
      s1 = 0.0;
      for (k=0; k < NUM ; k++)
	s1 += a[i][k]*b[k][j];
      c[i][j] = s1;
      printf("c[%d][%d] = %f\n", i, j,s1);      
    }
}

double sumup() {
  int i,j;
  double s1, s2;

  for (i=0, s1=0.0 ; i < NUM ; i++) {
    for (j=0, s2=0.0 ; j < NUM ; j++) s2 += c[i][j];
    s1 += s2;
  }
  printf("sum (before returning) = %f\n", s1);
  return s1;
}

#ifdef MAIN_ARGS
int main (int argc, char *argv[])
#else
int main_test (int, char **);

int main(void) {
  int _argc = 2;
  char *_argv[2] = {
    "mm_double",
    "20"
  };
  return main_test(_argc, _argv);
}

int main_test (int argc, char *argv[])
#endif
{
  double s1;

  if (argc < 2) {
    printf("Usage: mm_double <size>\n");
    exit(1);
  }
  NUM = atoi(argv[1]);

  init();
  matmult();
  s1 = sumup();
  printf("final sum = %f\n", s1);
  exit(0);
}



