#include "maths.h"

/* requires:
kcos.c
ksin.c
remPIo2.c
 */

#ifdef DEBUG
double my_cos(double x)
#else
double cos(double x)
#endif
{
  double y[2],z=0.0;
  int n, ix;

  /* High word of x. */
  ix = __HI(x);

  /* |x| ~< pi/4 */
  ix &= 0x7fffffff;
  if(ix <= 0x3fe921fb)
#ifdef DEBUG
    return my_kcos(x,z);
#else
    return kcos(x,z);
#endif

  /* cos(Inf or NaN) is NaN */
  else if (ix>=0x7ff00000) return x-x;

  /* argument reduction needed */
  else {
#ifdef DEBUG
    n = my_remPIo2(x,y);
#else
    n = remPIo2(x,y);
#endif
    switch(n&3) {
#ifdef DEBUG
    case 0: return  my_kcos(y[0],y[1]);
    case 1: return -my_ksin(y[0],y[1],1);
    case 2: return -my_kcos(y[0],y[1]);
    default:
      return  my_ksin(y[0],y[1],1);
#else
    case 0: return  kcos(y[0],y[1]);
    case 1: return -ksin(y[0],y[1],1);
    case 2: return -kcos(y[0],y[1]);
    default:
      return  ksin(y[0],y[1],1);
#endif
    }
  }
}
