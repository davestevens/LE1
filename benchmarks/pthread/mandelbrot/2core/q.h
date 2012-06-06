#ifdef __vex
#define VEX
#define SCOTTS
#endif

typedef int q_t;

inline q_t q_mul(q_t, q_t, int, int, int);
inline q_t q_div(q_t, q_t, int, int, int);
inline q_t q_int2fp(int, int);
q_t q_dbl2fp(double, int);
double q_fp2dbl(q_t, int);
q_t q_flt2fp(float, int);
float q_fp2flt(q_t, int);
q_t q_chtype(q_t, int, int);
