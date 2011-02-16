#include "maths.h"

/* requires:
 */

#ifdef DEBUG
double my_fabs(double x)
#else
double fabs(double x)
#endif
{
  __HI(x) &= 0x7fffffff;
  return x;
}
