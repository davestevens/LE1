#include "maths.h"

/* requires:
scalbn.c
 */

#ifdef DEBUG
double my_scalb(double x, int fn)
#else
double scalb(double x, int fn)
#endif
{
#ifdef DEBUG
  if (my_isnan(x)||my_isnan(fn)) return x*fn;
  if (!my_finite(fn)) {
    if(fn>0.0) return x*fn;
    else       return x/(-fn);
  }
  if (my_rint(fn)!=fn) return (fn-fn)/(fn-fn);
  if ( fn > 65000.0) return my_scalbn(x, 65000);
  if (-fn > 65000.0) return my_scalbn(x,-65000);
  return my_scalbn(x,(int)fn);
#else
  if (isnan(x)||isnan(fn)) return x*fn;
  if (!finite(fn)) {
    if(fn>0.0) return x*fn;
    else       return x/(-fn);
  }
  if (rint(fn)!=fn) return (fn-fn)/(fn-fn);
  if ( fn > 65000.0) return scalbn(x, 65000);
  if (-fn > 65000.0) return scalbn(x,-65000);
  return scalbn(x,(int)fn);
#endif
}
