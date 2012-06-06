#include "q.h"

/* multiplies a fixed point number a of width
   aq by b of width bq and stores in width resq */
inline q_t q_mul(q_t a, q_t b, int aq, int bq, int resq)
{
#ifdef VEX
#ifdef FLOATS
	/* Vex hack: no long long support */
        int shift = aq + bq - resq;
        return (q_t)(((float)a * (float)b) / (1 << shift));
#elif defined (SCOTTS)
        int shift = aq + bq - resq;
	unsigned int al, ah, bl, bh; /* must be unsigned */
	char neg = 1;
	neg = (a < 0) ? a = -a, -neg : neg;
	neg = (b < 0) ? b = -b, -neg : neg;

	al = a & 0xffff;
	ah = a >> 16;
	bl = b & 0xffff;
	bh = b >> 16;
	if (shift < 16) { /* Code Coverage: 3rd */
	  return neg * (((al * bl) >> shift) + ((al * bh + bl * ah) << (16 - shift)) + ((ah * bh) << (32 - shift)));
	} else {
		return neg * (((al * bl) >> shift) + ((al * bh + bl * ah) >> -(16 - shift)) + ((ah * bh) << (32 - shift)));
	}
#elif defined (CUSTOMINST)
	return(_asm1(0x1,a,b,aq,bq,resq));
#else
#error "FLOATS, SCOTTS or CUSTOMINST must be defined when in VEX mode"
#endif
#else
	int shift = aq + bq - resq;
	return ((long long)a * (long long)b) >> shift;
#endif

}

/* divides a fixed point number a of width
   aq by b of width bq and stores in width resq */
inline q_t q_div(q_t a, q_t b, int aq, int bq, int resq)
{
#ifdef VEX
#ifdef FLOATS
	/* Vex hack: no long long support */
	int shift = bq + resq - aq;

	/* speed accuracy tradeoff number, the higher the number the less accurate
	   the division result is. Seems to work up to a value of 8 */
#define SPEED 8
	int q;
	unsigned int f = 0;
	unsigned int x, i, s, r;

	/* positive inputs only */
	char neg = 1;
        return (q_t)(((float)a * (1 << shift)) / (float)b);
#elif defined (SCOTTS)
        int shift = bq + resq - aq;


	/* speed accuracy tradeoff number, the higher the number the less accurate
	   the division result is. Seems to work up to a value of 8 */
#define SPEED 8
	int q;
	unsigned int f = 0;
	unsigned int x, i, s, r;
	char neg = 1;
	if (a == 0 || b == 0) return 0;

	neg = (a < 0) ? a = -a, -neg : neg;
	neg = (b < 0) ? b = -b, -neg : neg;

	/* quotiant and remainder */
	q = a / b;
	r = a % b;

	/* calc fraction */
	s = r;
	for (i = 0; i < shift - SPEED; i++) { /* Code Coverage: 1st (most executed)*/
		s = s << 1;
		x = s - b;
		f <<= 1;
		if (s >= b) {
			f |= 0x1;
			s = x;
		}
	}
	/*f <<= 32 - shift;*/
	/* shift */
	q <<= shift;
	/*q |= f >> (32 - shift);*/
	q |= f << SPEED;

	/* fix sign */
	return q * neg;
#elif defined (CUSTOMINST)
	return(_asm1(0x40,a,b,aq,bq,resq));
#else
#error "FLOATS, SCOTTS or CUSTOMINST must be defined when in VEX mode"
#endif
#else
	int shift = bq + resq - aq;
	return ((long long) a << shift) / b;
#endif
}

inline q_t q_int2fp(int a, int q)
{
	if (q < 0) {
		return a >> q;
	} else {
		return a << q;
	}
}

q_t q_dbl2fp(double a, int q)
{
	return ((q_t)(a * ((unsigned int)1 << q)));
}

double q_fp2dbl(q_t a, int q)
{
	return ((double)a /(double)((unsigned int)1 << q));
}

q_t q_flt2fp(float a, int q)
{
	return ((q_t)(a * ((unsigned int)1 << q)));
}

float q_fp2flt(q_t a, int q)
{
	return ((float)a /(float)((q_t)1 << q));
}

q_t q_chtype(q_t a, int inq, int outq)
{
	int shift = inq - outq;
	if (shift < 0) {
		return a << -shift;
	} else {
		return a >> shift;
	}
}
