#include "maths.h"

/* requires:
ktan.c
remPIo2.c
 */

#ifdef DEBUG
double my_tan(double x)
#else
double tan(double x)
#endif
{
  double y[2],z=0.0;
  int n, ix;

  /* High word of x. */
  ix = __HI(x);

  /* |x| ~< pi/4 */
  ix &= 0x7fffffff;
#ifdef DEBUG
  if(ix <= 0x3fe921fb) return my_ktan(x,z,1);
#else
  if(ix <= 0x3fe921fb) return ktan(x,z,1);
#endif

  /* tan(Inf or NaN) is NaN */
  else if (ix>=0x7ff00000) return x-x;		/* NaN */

  /* argument reduction needed */
  else {
#ifdef DEBUG
    n = my_remPIo2(x,y);
    return my_ktan(y[0],y[1],1-((n&1)<<1)); /*   1 -- n even
						      -1 -- n odd */
#else
    n = remPIo2(x,y);
    return ktan(y[0],y[1],1-((n&1)<<1)); /*   1 -- n even
						      -1 -- n odd */
#endif
  }
}
