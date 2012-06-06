/* The Matrix Multiply computation.

   Creates and  multiplies two matrices and sums up all the elements
   of the resulting matrices. 

   October 31, 1995
   Shail Aditya.
*/

#include <stdio.h>
#include <stdlib.h>

int *A, *B, *C;
int NUM;

#ifdef MAIN_ARGS
int main (int argc, char *argv[])
#else
int main_test (int, char **);

int main(void) {
  int _argc = 2;
  char *_argv[2] = {
    "mm",
    "20"
  };
  return main_test(_argc, _argv);
}

int main_test (int argc, char *argv[])
#endif
{
  int i,j,k;
  int *a,*b,*c,s1,s2;

  if (argc < 2) {
    printf("Usage: mm_dyn <size>\n");
    exit(1);
  }
  NUM = atoi(argv[1]);
  A = (int *)calloc(NUM*NUM, sizeof(int));
  B = (int *)calloc(NUM*NUM, sizeof(int));
  C = (int *)calloc(NUM*NUM, sizeof(int));

  for (i=0, a=A, b=B ; i < NUM ; i++) 
    for (j=0 ; j < NUM ; j++,a++,b++) 
      *a = *b = i+j;

  for (i=0, c=C ; i < NUM ; i++)
    for (j=0 ; j < NUM ; j++,c++) {
      s1 = 0.0;
      printf("i = %d, j = %d \n", i, j);/*fflush(stdout);*/
      for (k=0, a=A+i*NUM, b=B+j ; k < NUM ; k++,a++, b += NUM)
	s1 += *a * *b;
      *c = s1;
    }

  for (i=0, s1=0.0, c=C ; i < NUM ; i++) {
    for (j=0, s2=0.0 ; j < NUM ; j++,c++) s2 += *c;
    s1 += s2;
  }
  printf("sum = %d\n", s1);
  exit(0);
}
