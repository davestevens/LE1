#include "maths.h"

/* requires:
fabs.c
 */

#ifdef DEBUG
double my_logb(double x)
#else
double logb(double x)
#endif
{
  int lx,ix;
  ix = (__HI(x))&0x7fffffff;      /* high |x| */
  lx = __LO(x);                   /* low x */
  if((ix|lx)==0)
#ifdef DEBUG
    return -1.0/my_fabs(x);
#else
    return -1.0/fabs(x);
#endif
  if(ix>=0x7ff00000) return x*x;
  if((ix>>=20)==0)                        /* IEEE 754 logb */
    return -1022.0;
  else
    return (double) (ix-1023);
}
