#include "maths.h"

/* requires:
signgam.c
gamma_r.c
 */

extern int signgam;

#ifdef DEBUG
double my_gamma(double x)
#else
double gamma(double x)
#endif
{
#ifdef DEBUG
  return my_gamma_r(x,&signgam);
#else
  return gamma_r(x,&signgam);
#endif
}
