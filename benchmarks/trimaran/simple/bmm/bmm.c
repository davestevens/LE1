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
int NUM, BLOCK;

void mm_init(int I, int J)
{
  int i, j;

  for (i=I ; i < I+BLOCK ; i++) 
    for (j=J ; j < J+BLOCK ; j++) {
      c[i][j] = 0.0;
      a[i][j] = b[i][j] = i+j;
    }
}
  
void init () {
  int i,j;

  for (i=0 ; i < NUM ; i += BLOCK) 
    for (j=0 ; j < NUM ; j += BLOCK) {
      mm_init(i,j);
      printf("INIT:block a[%d][%d] = %f\n",i,j,a[i][j]);
    }
}

void mm_inner(int I, int J, int K)
{
  int i,j,k;

  for (i=I ; i < I+BLOCK ; i++) 
    for (j=J ; j < J+BLOCK ; j++)
      for (k=K ; k < K+BLOCK ; k++)
	c[i][j] += a[i][k]*b[k][j];
}

void matmult() {
  int i,j,k;
  double s1;

  for (i=0 ; i < NUM ; i += BLOCK) 
    for (j=0 ; j < NUM ; j += BLOCK)
      for (k=0; k < NUM ; k += BLOCK) {
	mm_inner(i,j,k);
	printf("ACC:blocks a(%d,%d)*b(%d,%d)", i,k,k,j);
	printf(", c[%d][%d] = %f\n",i,j,c[i][j]);
    }

}

double mm_sum(int I, int J)
{
  int i, j;
  double s = 0.0;

  for (i=I ; i < I+BLOCK ; i++) 
    for (j=J ; j < J+BLOCK ; j++)
      s += c[i][j];
  return (s);
}


double sumup() {

  int i,j;
  double s = 0.0;

  for (i=0 ; i < NUM ; i += BLOCK)
    for (j=0 ; j < NUM ; j += BLOCK) {
      s += mm_sum(i,j);
      printf("SUM:block c(%d,%d) = %f\n",i,j,s);
    }
  return s;
}

#ifdef MAIN_ARGS
int main (int argc, char* argv[])
#else
int main_test(int, char **);

int main(void) {
  int _argc = 3;
  char *_argv[3] = {
    "bmm",
    "20",
    "20"
  };
  return main_test(_argc, _argv);
}

int main_test(int argc, char *argv[])
#endif
{
  int i,j,k;
  double s;

  if (argc < 3) {
    printf("Usage: bmm <size> <block>\n");
    exit(1);
  }
  NUM = atoi(argv[1]);
  BLOCK = atoi(argv[2]);

  init();
  matmult();
  s = sumup();
  printf("final sum = %f\n", s);
  exit(0);
}

