#include "maths.h"

/* requires:
log.c
fabs.c
sqrt.c
log1p.c
 */

static const double
one =  1.00000000000000000000e+00, /* 0x3FF00000, 0x00000000 */
ln2 =  6.93147180559945286227e-01, /* 0x3FE62E42, 0xFEFA39EF */
huge=  1.00000000000000000000e+300;

#ifdef DEBUG
double my_asinh(double x)
#else
double asinh(double x)
#endif
{
  double t,w;
  int hx,ix;
  hx = __HI(x);
  ix = hx&0x7fffffff;
  if(ix>=0x7ff00000) return x+x;	/* x is inf or NaN */
  if(ix< 0x3e300000) {	/* |x|<2**-28 */
    if(huge+x>one) return x;	/* return x inexact except 0 */
  }
  if(ix>0x41b00000) {	/* |x| > 2**28 */
#ifdef DEBUG
    w = my_log(my_fabs(x))+ln2;
#else
    w = log(fabs(x))+ln2;
#endif
  } else if (ix>0x40000000) {	/* 2**28 > |x| > 2.0 */
#ifdef DEBUG
    t = my_fabs(x);
    w = my_log(2.0*t+one/(my_sqrt(x*x+one)+t));
#else
    t = fabs(x);
    w = log(2.0*t+one/(sqrt(x*x+one)+t));
#endif
  } else {		/* 2.0 > |x| > 2**-28 */
    t = x*x;
#ifdef DEBUG
    w =my_log1p(my_fabs(x)+t/(one+my_sqrt(one+t)));
#else
    w =log1p(fabs(x)+t/(one+sqrt(one+t)));
#endif
  }
  if(hx>0) return w; else return -w;
}
