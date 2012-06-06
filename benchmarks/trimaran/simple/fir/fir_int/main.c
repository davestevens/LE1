/* FIR filter code
 * Author : Shail Aditya
 * Date : 02/28/96
 */

/* Edit History:
 * -- 04/21/97 Shail Aditya -- Modified to conform to Rob's document
 */

#include <stdio.h>
#include <math.h>
#include "fir.h"

int x[N1];
int y[N1-N2+1];
int w[N2];
double pi = 3.14159;

extern void init();
extern void print();


int main ()
{
  int i;
  init();

  print(0, "w", w, N2, 0);
  print(1, "x", x, N1, 0);

  fir(x, y, w);

  for (i=0; i<N1-N2+1; i++) y[i] = y[i]>>(N2/2+1);

  print(1, "y", y, N1-N2+1, 0);
  exit(0);
}

void print(dots, name, a, max, start)
int dots;
char *name;
int *a;
int max, start;
{
  int i,j;

  printf("%s:\n", name);
  for (i=start; i<max; i++) printf("%3d ", a[i]);
  printf("\n");
  if (dots) {
    for (i=start; i<max; i++) {
      for (j=0; j<a[i]; j++) printf(".");
      printf("\n");
    }
  }
}


void init()
{
  int i;

  for (i=0; i<N1; i++) x[i] = pow(sin((double)i*pi/N2), 2.0)*COL;
  for (i=0; i<N2/2; i++) w[i] = w[N2-i-1] = 1<<i; 
  for (i=0; i<N1-N2+1; i++) y[i] = 0;
}
