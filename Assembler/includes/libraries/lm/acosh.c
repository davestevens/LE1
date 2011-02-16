#include "maths.h"

/* requires:
log.c
log1p.c
sqrt.c
 */

static const double
one	= 1.0,
ln2	= 6.93147180559945286227e-01;  /* 0x3FE62E42, 0xFEFA39EF */

#ifdef DEBUG
double my_acosh(double x)
#else
double acosh(double x)
#endif
{
  double t;
  int hx;
  hx = __HI(x);
  if(hx<0x3ff00000) {		/* x < 1 */
    return (x-x)/(x-x);
  } else if(hx >=0x41b00000) {	/* x > 2**28 */
    if(hx >=0x7ff00000) {	/* x is inf of NaN */
      return x+x;
    } else
#ifdef DEBUG
      return my_log(x)+ln2;	/* acosh(huge)=log(2x) */
#else
      return log(x)+ln2;	/* acosh(huge)=log(2x) */
#endif
  } else if(((hx-0x3ff00000)|__LO(x))==0) {
    return 0.0;			/* acosh(1) = 0 */
  } else if (hx > 0x40000000) {	/* 2**28 > x > 2 */
    t=x*x;
#ifdef DEBUG
    return my_log(2.0*x-one/(x+my_sqrt(t-one)));
#else
    return log(2.0*x-one/(x+sqrt(t-one)));
#endif
  } else {			/* 1<x<2 */
    t = x-one;
#ifdef DEBUG
    return my_log1p(t+my_sqrt(2.0*t+t*t));
#else
    return log1p(t+sqrt(2.0*t+t*t));
#endif
  }
}
