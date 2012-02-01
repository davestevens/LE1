#ifdef PRINT
#include <stdio.h>
#endif
#include "snipmath.h"
#include <math.h>

/* The printf's may be removed to isolate just the math calculations */

double xGlob[54012];
unsigned qGlob[1002];
double dGlob[723];

int main(void)
{
  double  a1 = 1.0, b1 = -10.5, c1 = 32.0, d1 = -30.0;
  double  a2 = 1.0, b2 = -4.5, c2 = 17.0, d2 = -30.0;
  double  a3 = 1.0, b3 = -3.5, c3 = 22.0, d3 = -31.0;
  double  a4 = 1.0, b4 = -13.7, c4 = 1.0, d4 = -35.0;
  double  x[3];
  double X;
  int     solutions;
  int i;
  unsigned long l = 0x3fed0169L;
  struct int_sqrt q;
  /*long n = 0;*/
  int count = 0;
  int t = 0;

  /* solve soem cubic functions */
#ifdef PRINT
  printf("********* CUBIC FUNCTIONS ***********\n");
#endif
  /* should get 3 solutions: 2, 6 & 2.5   */
  SolveCubic(a1, b1, c1, d1, &solutions, x);
#ifdef PRINT
  printf("Solutions:");
  for(i=0;i<solutions;i++)
    printf(" %f",x[i]);
  printf("\n");
#else
  for(i=0;i<solutions;i++)
    xGlob[i] = x[i];
#endif
  /* should get 1 solution: 2.5           */
  SolveCubic(a2, b2, c2, d2, &solutions, x);
#ifdef PRINT
  printf("Solutions:");
  for(i=0;i<solutions;i++)
    printf(" %f",x[i]);
  printf("\n");
#else
  for(i=0;i<solutions;i++)
    xGlob[i+3] = x[i];
#endif
  SolveCubic(a3, b3, c3, d3, &solutions, x);
#ifdef PRINT
  printf("Solutions:");
  for(i=0;i<solutions;i++)
    printf(" %f",x[i]);
  printf("\n");
#else
  for(i=0;i<solutions;i++)
    xGlob[i+6] = x[i];
#endif
  SolveCubic(a4, b4, c4, d4, &solutions, x);
#ifdef PRINT
  printf("Solutions:");
  for(i=0;i<solutions;i++)
    printf(" %f",x[i]);
  printf("\n");
#else
  for(i=0;i<solutions;i++)
    xGlob[i+9] = x[i];
#endif
  /* Now solve some random equations */
  for(a1=1;a1<10;a1++) {
    for(b1=10;b1>0;b1--) {
      for(c1=5;c1<15;c1+=0.5) {
	for(d1=-1;d1>-11;d1--) {
	  SolveCubic(a1, b1, c1, d1, &solutions, x);
#ifdef PRINT
	  printf("Solutions:");
	  for(i=0;i<solutions;i++)
	    printf(" %f",x[i]);
	  printf("\n");
#else
	  for(i=0;i<solutions;i++)
	    xGlob[i+12+(t*3)] = x[i];
#endif
	}
      }
    }
  }

#ifdef PRINT
  printf("********* INTEGER SQR ROOTS ***********\n");
#endif
  /* perform some integer square roots */
  for (i = 0; i < 1001; ++i)
    {
      usqrt(i, &q);
      /* remainder differs on some machines
	 printf("sqrt(%3d) = %2d, remainder = %2d\n", */
#ifdef PRINT
      printf("sqrt(%3d) = %2d\n", i, q.sqrt);
#else
      qGlob[i] = q.sqrt;
#endif
    }
  usqrt(l, &q);
  /* printf("\nsqrt(%lX) = %X, remainder = %X\n", l, q.sqrt, q.frac); */
#ifdef PRINT
  printf("\nsqrt(%lX) = %X\n", l, q.sqrt);
#else
  qGlob[1001] = q.sqrt;
#endif

#ifdef PRINT
  printf("********* ANGLE CONVERSION ***********\n");
#endif
  /* convert some rads to degrees */
  for (X = 0.0; X <= 360.0; X += 1.0) {
#ifdef PRINT
    printf("%3.0f degrees = %.12f radians\n", X, deg2rad(X));
#else
    dGlob[(int)X] = deg2rad(X);
#endif
  }
#ifdef PRINT
  puts("");
#endif
  for (X = 0.0; X <= (2 * PI + 1e-6); X += (PI / 180)) {
#ifdef PRINT
    printf("%.12f radians = %3.0f degrees\n", X, rad2deg(X));
#else
    dGlob[360 + count++] = rad2deg(X);
#endif
  }
  return 0;
}
