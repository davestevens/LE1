/* Useful constants.  */

#define DEBUG

#ifndef DEBUG
#define M_E             2.7182818284590452354
#define M_LOG2E         1.4426950408889634074
#define M_LOG10E        0.43429448190325182765
#define M_LN2           0.69314718055994530942
#define M_LN10          2.30258509299404568402
#define M_PI            3.14159265358979323846
#define M_PI_2          1.57079632679489661923
#define M_PI_4          0.78539816339744830962
#define M_1_PI          0.31830988618379067154
#define M_2_PI          0.63661977236758134308
#define M_2_SQRTPI      1.12837916709551257390
#define M_SQRT2         1.41421356237309504880
#define M_SQRT1_2       0.70710678118654752440*/
#endif

#define __HI(x) *(1+(int*)&x)
#define __LO(x) *(int*)&x
#define __HIp(x) *(1+(int*)x)
#define __LOp(x) *(int*)x

/* function definitions */

#ifdef DEBUG
double my_acos(double);
double my_asin(double);
double my_sqrt(double);
double my_fabs(double);
double my_atan(double);
double my_atan2(double, double);
double my_ceil(double);
double my_floor(double);
double my_fmod(double, double);
double my_log(double);
double my_log10(double);
double my_pow(double, double);
double my_scalbn(double, int);
double my_scalb(double, int);
double my_copysign(double, double);
double my_rint(double);
double my_finite(double);
int my_isnan(double);
double my_exp(double);
double my_remainder(double, double);
double my_fmod(double, double);
double my_cbrt(double);
double my_erf(double);
double my_erfc(double);
double my_expm1(double);
double my_hypot(double, double);
double my_ilogb(double);
double my_log1p(double);
double my_logb(double);
double my_nextafter(double, double);
double my_cos(double);
double my_kcos(double, double);
double my_ksin(double, double, int);
int my_remPIo2(double, double*);
int my_kremPIo2(double *, double *, int, int, int, const int *);
double my_cosh(double);
double my_sin(double);
double my_sinh(double);
double my_tan(double);
double my_ktan(double, double, int);
double my_tanh(double);
double my_acosh(double);
double my_asinh(double);
double my_atanh(double);
double my_frexp(double, int*);
double my_ldexp(double, int);
double my_modf(double, double *);
double my_gamma_r(double, int *);
double my_lgamma_r(double, int *);
double my_gamma(double);
double my_lgamma(double);
double my_significand(double);
#else
double acos(double);
double asin(double);
double sqrt(double);
double fabs(double);
double atan(double);
double atan2(double, double);
double ceil(double);
double floor(double);
double fmod(double, double);
double log(double);
double log10(double);
double pow(double, double);
double scalbn(double, int);
double scalb(double, int);
double copysign(double, double);
double rint(double);
double finite(double);
int isnan(double);
double exp(double);
double remainder(double, double);
double fmod(double, double);
double cbrt(double);
double erf(double);
double erfc(double);
double expm1(double);
double hypot(double, double);
double ilogb(double);
double log1p(double);
double logb(double);
double nextafter(double, double);
double cos(double);
double kcos(double, double);
double ksin(double, double, int);
int remPIo2(double, double*);
int kremPIo2(double *, double *, int, int, int, const int *);
double cosh(double);
double sin(double);
double sinh(double);
double tan(double);
double ktan(double, double, int);
double tanh(double);
double acosh(double);
double asinh(double);
double atanh(double);
double frexp(double, int*);
double ldexp(double, int);
double modf(double, double *);
double gamma_r(double, int *);
double lgamma_r(double, int *);
double gamma(double);
double lgamma(double);
double significand(double);
#endif
