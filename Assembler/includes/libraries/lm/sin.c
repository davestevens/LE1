#include "maths.h"

/* requires:
ksin.c
kcos.c
remPIo2.c
 */

#ifdef DEBUG
double my_sin(double x)
#else
double sin(double x)
#endif
{
  double y[2],z=0.0;
  int n, ix;

  /* High word of x. */
  ix = __HI(x);

  /* |x| ~< pi/4 */
  ix &= 0x7fffffff;
#ifdef DEBUG
  if(ix <= 0x3fe921fb) return my_ksin(x,z,0);
#else
  if(ix <= 0x3fe921fb) return ksin(x,z,0);
#endif

  /* sin(Inf or NaN) is NaN */
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
    case 0: return  my_ksin(y[0],y[1],1);
    case 1: return  my_kcos(y[0],y[1]);
    case 2: return -my_ksin(y[0],y[1],1);
    default:
      return -my_kcos(y[0],y[1]);
#else
    case 0: return  ksin(y[0],y[1],1);
    case 1: return  kcos(y[0],y[1]);
    case 2: return -ksin(y[0],y[1],1);
    default:
      return -kcos(y[0],y[1]);
#endif
    }
  }
}
