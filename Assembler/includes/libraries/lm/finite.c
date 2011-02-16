#include "maths.h"

/* requires:
 */

#ifdef DEBUG
double my_finite(double x)
#else
double finite(double x)
#endif
{
  int hx;
  hx = __HI(x);
  return  (unsigned)((hx&0x7fffffff)-0x7ff00000)>>31;
}
