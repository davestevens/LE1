#include "maths.h"

/* requires:
 */

#ifdef DEBUG
double my_significand(double x)
#else
double significand(double x)
#endif
{
#ifdef DEBUG
  return my_scalb(x,(double) -my_ilogb(x));
#else
  return scalb(x,(double) -ilogb(x));
#endif
}
