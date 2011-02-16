#include "maths.h"

/* requires:
copysign.c
 */

static const double
two54   =  1.80143985094819840000e+16, /* 0x43500000, 0x00000000 */
twom54  =  5.55111512312578270212e-17, /* 0x3C900000, 0x00000000 */
huge   = 1.0e+300,
tiny   = 1.0e-300;

#ifdef DEBUG
double my_scalbn(double x, int n)
#else
double scalbn(double x, int n)
#endif
{
  int  k,hx,lx;
  hx = __HI(x);
  lx = __LO(x);
  k = (hx&0x7ff00000)>>20;                /* extract exponent */
  if (k==0) {                             /* 0 or subnormal x */
    if ((lx|(hx&0x7fffffff))==0) return x; /* +-0 */
    x *= two54;
    hx = __HI(x);
    k = ((hx&0x7ff00000)>>20) - 54;
    if (n< -50000) return tiny*x;       /*underflow*/
  }
  if (k==0x7ff) return x+x;               /* NaN or Inf */
  k = k+n;
  if (k >  0x7fe)
    {
#ifdef DEBUG
      return huge*my_copysign(huge,x); /* overflow  */
#else
      return huge*copysign(huge,x); /* overflow  */
#endif
    }
  if (k > 0)                              /* normal result */
    {__HI(x) = (hx&0x800fffff)|(k<<20); return x;}
  if (k <= -54)
    {
      if (n > 50000)      /* in case integer overflow in n+k */
	{
#ifdef DEBUG
	return huge*my_copysign(huge,x);   /*overflow*/
#else
      return huge*copysign(huge,x);   /*overflow*/
#endif
	}
      else
	{
#ifdef DEBUG
	return tiny*my_copysign(tiny,x);  /*underflow*/
#else
      return tiny*copysign(tiny,x);  /*underflow*/
#endif
	}
    }
  k += 54;                                /* subnormal result */
  __HI(x) = (hx&0x800fffff)|(k<<20);
  return x*twom54;
}
