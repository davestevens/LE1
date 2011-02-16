#include "maths.h"

/* requires:
expm1.c
fabs.c
exp.c
log.c
 */

static const double
one = 1.0,
half=0.5,
huge = 1.0e300;

#ifdef DEBUG
double my_cosh(double x)
#else
double my_cosh(double x)
#endif
{
  double t,w;
  int ix;
  unsigned lx;

  /* High word of |x|. */
  ix = __HI(x);
  ix &= 0x7fffffff;

  /* x is INF or NaN */
  if(ix>=0x7ff00000) return x*x;

  /* |x| in [0,0.5*ln2], return 1+expm1(|x|)^2/(2*exp(|x|)) */
  if(ix<0x3fd62e43) {
#ifdef DEBUG
    t = my_expm1(my_fabs(x));
#else
    t = expm1(fabs(x));
#endif
    w = one+t;
    if (ix<0x3c800000) return w;        /* cosh(tiny) = 1 */
    return one+(t*t)/(w+w);
  }

  /* |x| in [0.5*ln2,22], return (exp(|x|)+1/exp(|x|)/2; */
  if (ix < 0x40360000) {
#ifdef DEBUG
    t = my_exp(my_fabs(x));
#else
    t = exp(fabs(x));
#endif
    return half*t+half/t;
  }

  /* |x| in [22, log(maxdouble)] return half*exp(|x|) */
#ifdef DEBUG
  if (ix < 0x40862E42)  return half*my_exp(my_fabs(x));
#else
  if (ix < 0x40862E42)  return half*exp(fabs(x));
#endif

  /* |x| in [log(maxdouble), overflowthresold] */
  lx = *( (((*(unsigned*)&one)>>29)) + (unsigned*)&x);
  if ((ix<0x408633CE) ||
      ((ix==0x408633ce)&&(lx<=(unsigned)0x8fb9f87d))) {
#ifdef DEBUG
    w = my_exp(half*my_fabs(x));
#else
    w = exp(half*fabs(x));
#endif
    t = half*w;
    return t*w;
  }

  /* |x| > overflowthresold, cosh(x) overflow */
  return huge*huge;
}
