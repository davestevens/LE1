#include "maths.h"

/* requires:
lgamma_r.c
 */

#ifdef DEBUG
double my_gamma_r(double x, int *signgamp)
#else
double gamma_r(double x, int *signgamp)
#endif
{
#ifdef DEBUG
  return my_lgamma_r(x,signgamp);
#else
  return lgamma_r(x,signgamp);
#endif
}
