#include "maths.h"

/* requires:
lgamma_r.c
signgam.c
 */

extern int signgam;

#ifdef DEBUG
double my_lgamma(double x)
#else
double lgamma(double x)
#endif
{
#ifdef DEBUG
  return my_lgamma_r(x,&signgam);
#else
  return lgamma_r(x,&signgam);
#endif
}
