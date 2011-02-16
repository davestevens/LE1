#include "maths.h"

/* requires:
fabs.c
fmod.c
 */

static const double
zero = 0.0;

#ifdef DEBUG
double my_remainder(double x, double p)
#else
double remainder(double x, double p)
#endif
{
  int hx,hp;
  unsigned sx,lx,lp;
  double p_half;

  hx = __HI(x);           /* high word of x */
  lx = __LO(x);           /* low  word of x */
  hp = __HI(p);           /* high word of p */
  lp = __LO(p);           /* low  word of p */
  sx = hx&0x80000000;
  hp &= 0x7fffffff;
  hx &= 0x7fffffff;

  /* purge off exception values */
  if((hp|lp)==0) return (x*p)/(x*p);      /* p = 0 */
  if((hx>=0x7ff00000)||                   /* x not finite */
     ((hp>=0x7ff00000)&&                   /* p is NaN */
      (((hp-0x7ff00000)|lp)!=0)))
    return (x*p)/(x*p);

#ifdef DEBUG
  if (hp<=0x7fdfffff) x = my_fmod(x,p+p);  /* now x < 2p */
#else
  if (hp<=0x7fdfffff) x = fmod(x,p+p);  /* now x < 2p */
#endif
  if (((hx-hp)|(lx-lp))==0) return zero*x;
#ifdef DEBUG
  x  = my_fabs(x);
  p  = my_fabs(p);
#else
  x  = fabs(x);
  p  = fabs(p);
#endif
  if (hp<0x00200000) {
    if(x+x>p) {
      x-=p;
      if(x+x>=p) x -= p;
    }
  } else {
    p_half = 0.5*p;
    if(x>p_half) {
      x-=p;
      if(x>=p_half) x -= p;
    }
  }
  __HI(x) ^= sx;
  return x;
}
