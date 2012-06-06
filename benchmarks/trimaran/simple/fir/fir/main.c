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
#include <stdlib.h>

float x[N1];
float y[N1-N2+1];
float w[N2];
float pi = 3.14159;

extern void init();
extern void print();


int main ()
{
  init();

  print("w", w, N2, 0);
  print("x", x, N1, 0);

  fir(x, y, w);

  print("y", y, N1-N2+1, 0);
  exit(0);
}

void print(char* name, float* a, int max, int start)
{
  int i,j,k;

  printf("%s:\n", name);
  for (i=start; i<max; i++) printf("%3f ", a[i]);
  /*putchar('\n');*/
  printf("\n");
  for (i=start; i<max; i++) {
    k = floor(COL*a[i]);
    for (j=0; j<COL; j++)
      printf("%c", (j<k) ? '.' : ' ');
      //if (j<k) putchar('.'); else putchar(' ');
    /*putchar('\n');*/
    printf("\n");
  }
}


void init()
{
  int i;
  float sum;

  for (i=0; i<N1; i++) x[i] = pow(sin((float)i*pi/N2), 2.0);
  for (i=0; i<N2/2; i++) w[i] = w[N2-i-1] = exp((float)i); 
  for (i=0, sum=0.0; i<N2; i++) sum += w[i];
  for (i=0; i<N2; i++) w[i] = w[i]/sum;
}










