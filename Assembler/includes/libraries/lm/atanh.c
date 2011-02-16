#include "maths.h"

/* requires:
log1p.c
 */

static const double
one = 1.0,
huge = 1e300;

static double
zero = 0.0;

#ifdef DEBUG
double my_atanh(double x)
#else
double atanh(double x)
#endif
{
  double t;
  int hx,ix;
  unsigned lx;
  hx = __HI(x);		/* high word */
  lx = __LO(x);		/* low word */
  ix = hx&0x7fffffff;
  if ((ix|((lx|(-lx))>>31))>0x3ff00000) /* |x|>1 */
    return (x-x)/(x-x);
  if(ix==0x3ff00000)
    return x/zero;
  if(ix<0x3e300000&&(huge+x)>zero) return x;	/* x<2**-28 */
  __HI(x) = ix;		/* x <- |x| */
  if(ix<0x3fe00000) {		/* x < 0.5 */
    t = x+x;
#ifdef DEBUG
    t = 0.5*my_log1p(t+t*x/(one-x));
#else
    t = 0.5*log1p(t+t*x/(one-x));
#endif
  } else
#ifdef DEBUG
    t = 0.5*my_log1p((x+x)/(one-x));
#else
    t = 0.5*log1p((x+x)/(one-x));
#endif
  if(hx>=0) return t; else return -t;
}
