#include "maths.h"

/* requires:
 */

#ifdef DEBUG
double my_copysign(double x, double y)
#else
double copysign(double x, double y)
#endif
{
  __HI(x) = (__HI(x)&0x7fffffff)|(__HI(y)&0x80000000);
  return x;
}
