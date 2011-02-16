#include "maths.h"

/* requires:
finite.c
scalbn.c
 */

#ifdef DEBUG
double my_ldexp(double value, int exp)
#else
double ldexp(double value, int exp)
#endif
{
#ifdef DEBUG
  if(!my_finite(value)||value==0.0) return value;
  value = my_scalbn(value,exp);
#else
  if(!finite(value)||value==0.0) return value;
  value = scalbn(value,exp);
#endif
  /*  if(!my_finite(value)||value==0.0) errno = ERANGE;*/
  return value;
}
