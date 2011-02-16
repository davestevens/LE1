#include <stdio.h>
#include <math.h>
#include "mths.h"

double input;
double output;
int *test;
int rah;

double test2;

int main()
{
  input = 0.23;

  test = (int *)&output;

  if(acos(input) != my_acos(input))
    printf("error: acos\n");
  else
    printf("acos: %g\n", my_acos(input));

  if(sqrt(input) != my_sqrt(input))
    printf("error: sqrt\n");
  else
    printf("sqrt: %g\n", my_sqrt(input));

  if(asin(input) != my_asin(input))
    printf("error: asin\n");
  else
    printf("asin: %g\n", my_asin(input));

  if(fabs(input) != my_fabs(input))
    printf("error: fabs\n");
  else
    printf("fabs: %g\n", my_fabs(input));

  if(atan(input) != my_atan(input))
    printf("error: atan\n");
  else
    printf("atan: %g\n", my_atan(input));

  if(atan2(input, input) != my_atan2(input, input))
    printf("error: atan2\n");
  else
    printf("atan2: %g\n", my_atan2(input, input));

  if(ceil(input) != my_ceil(input))
    printf("error: ceil\n");
  else
    printf("ceil: %g\n", my_ceil(input));

  if(floor(input) != my_floor(input))
    printf("error: floor\n");
  else
    printf("floor: %g\n", my_floor(input));

  if(fmod(input, input) != my_fmod(input, input))
    printf("error: fmod\n");
  else
    printf("fmod: %g\n", my_fmod(input, input));

  if(log(input) != my_log(input))
    printf("error: log\n");
  else
    printf("log: %g\n", my_log(input));

  if(log10(input) != my_log10(input))
    printf("error: log10\n");
  else
    printf("log10: %g\n", my_log10(input));

  if(pow(input, input) != my_pow(input, input))
    printf("error: pow\n");
  else
    printf("pow: %g\n", my_pow(input, input));

  if(scalbn(input, 1) != my_scalbn(input, 1))
    printf("error: scalbn\n");
  else
    printf("scalbn: %g\n", my_scalbn(input, 1));

  if(copysign(input, input) != my_copysign(input, input))
    printf("error: copysign\n");
  else
    printf("copysign: %g\n", my_copysign(input, input));

  if(rint(input) != my_rint(input))
    printf("error: rint\n");
  else
    printf("rint: %g\n", my_rint(input));

  if(finite(input) != my_finite(input))
    printf("error: finite\n");
  else
    printf("finite: %g\n", my_finite(input));

  if(isnan(input) != my_isnan(input))
    printf("error: isnan\n");
  else
    printf("isnan: %d\n", my_isnan(input));

  if(exp(input) != my_exp(input))
    printf("error: exp\n");
  else
    printf("exp: %g\n", my_exp(input));

  if(remainder(input, input) != my_remainder(input, input))
    printf("error: remainder\n");
  else
    printf("remainder: %g\n", my_remainder(input, input));

  if(fmod(input, input) != my_fmod(input, input))
    printf("error: fmod\n");
  else
    printf("fmod: %g\n", my_fmod(input, input));

  if(cbrt(input) != my_cbrt(input))
    printf("error: cbrt\n");
  else
    printf("cbrt: %g\n", my_cbrt(input));

  if(erf(input) != my_erf(input))
    {
      printf("error: erf\n");
      printf("\t%g != ", erf(input));
      printf("%g\n", my_erf(input));
      output = erf(input);
      printf("\t%d != ", *test);
      output = my_erf(input);
      printf("%d\n", *test);
    }
  else
    printf("erf: %g\n", my_erf(input));

  if(erfc(input) != my_erfc(input))
    {
      printf("error: erfc\n");
      printf("\t%g != ", erfc(input));
      printf("%g\n", my_erfc(input));
      output = erfc(input);
      printf("\t%d != ", *test);
      output = my_erfc(input);
      printf("%d\n", *test);
    }
  else
    printf("erfc: %g\n", my_erfc(input));

  if(expm1(input) != my_expm1(input))
    {
      printf("error: expm1\n");
      printf("\tgcc: %g\n", expm1(input));
      printf("\t me: %g\n", my_expm1(input));
    }
  else
    printf("expm1: %g\n", my_expm1(input));

  if(hypot(input, input) != my_hypot(input, input))
    printf("error: hypot\n");
  else
    printf("hypot: %g\n", my_hypot(input, input));

  if(ilogb(input) != my_ilogb(input))
    printf("error: ilogb\n");
  else
    printf("ilogb: %g\n", my_ilogb(input));

  if(log1p(input) != my_log1p(input))
    {
      printf("error: log1p\n");
      printf("\t%g !=", log1p(input));
      printf("%g\n", my_log1p(input));
      output = log1p(input);
      printf("\t%d != ", *test);
      output = my_log1p(input);
      printf("%d\n", *test);
    }
  else
    printf("log1p: %g\n", my_log1p(input));

  if(logb(input) != my_logb(input))
    {
      printf("error: logb\n");
      printf("\t%g != ", logb(input));
      printf("%g\n", my_logb(input));
    }
  else
    printf("logb: %g\n", my_logb(input));

  if(nextafter(input, input) != my_nextafter(input, input))
    printf("error: nextafter\n");
  else
    printf("nextafter: %g\n", my_nextafter(input, input));

  if(cos(input) != my_cos(input))
    {
      printf("error: cos\n");
      printf("\tgcc: %g\n", cos(input));
      printf("\t me: %g\n", my_cos(input));
    }
  else
    printf("cos: %g\n", my_cos(input));

  if(cosh(input) != my_cosh(input))
    {
      printf("error: cosh\n");
      printf("\tgcc: %g\n", cosh(input));
      printf("\t me: %g\n", my_cosh(input));
    }
  else
    printf("cosh: %g\n", my_cosh(input));

  if(sin(input) != my_sin(input))
    {
      printf("error: sin\n");
      printf("\tgcc: %g\n", sin(input));
      printf("\t me: %g\n", my_sin(input));
    }
  else
    printf("sin: %g\n", my_sin(input));

  if(sinh(input) != my_sinh(input))
    {
      printf("error: sinh\n");
      printf("\t%g != ", sinh(input));
      printf("%g\n", my_sinh(input));
      output = sinh(input);
      printf("\t%d != ", *test);
      output = my_sinh(input);
      printf("%d\n", *test);
    }
  else
    printf("sinh: %g\n", my_sinh(input));

  if(tan(input) != my_tan(input))
    {
      printf("error: tan\n");
      printf("\t%g != ", tan(input));
      printf("%g\n", my_tan(input));
      output = tan(input);
      printf("\t%d != ", *test);
      output = my_tan(input);
      printf("%d\n", *test);
    }
  else
    printf("tan: %g\n", my_tan(input));

  if(tanh(input) != my_tanh(input))
    {
      printf("error: tanh\n");
      printf("\t%g != ", tanh(input));
      printf("%g\n", my_tanh(input));
      output = tanh(input);
      printf("\t%d != ", *test);
      output = my_tanh(input);
      printf("%d\n", *test);
    }
  else
    printf("tanh: %g\n", my_tanh(input));

  if(acosh(input) != my_acosh(input))
    {
      printf("error: acosh\n");
      printf("\t%g != ", acosh(input));
      printf("%g\n", my_acosh(input));
      output = acosh(input);
      printf("\t%d != ", *test);
      output = my_acosh(input);
      printf("%d\n", *test);
    }
  else
    printf("acosh: %g\n", my_acosh(input));

  if(asinh(input) != my_asinh(input))
    {
      printf("error: asinh\n");
      printf("\t%g != ", asinh(input));
      printf("%g\n", my_asinh(input));
      output = asinh(input);
      printf("\t%d != ", *test);
      output = my_asinh(input);
      printf("%d\n", *test);
    }
  else
    printf("asinh: %g\n", my_asinh(input));

  if(atanh(input) != my_atanh(input))
    {
      printf("error: atanh\n");
      printf("\t%g != ", atanh(input));
      printf("%g\n", my_atanh(input));
      output = atanh(input);
      printf("\t%d != ", *test);
      output = my_atanh(input);
      printf("%d\n", *test);
    }
  else
    printf("atanh: %g\n", my_atanh(input));



  if(frexp(input, &rah) != my_frexp(input, &rah))
    {
      printf("error: frexp\n");
    }
  else
    {
      printf("frexp: %g\n", my_frexp(input, &rah));
      printf("%d\n", rah);
    }

  if(ldexp(input, 2) != ldexp(input, 2))
    printf("error: ldexp\n");
  else
    printf("ldexp: %g\n", my_ldexp(input, 2));

  if(modf(input, &test2) != my_modf(input, &test2))
    printf("error: modf\n");
  else
    printf("modf: %g\n", my_modf(input, &test2));

  printf("%g\n", exp2(input));

  printf("%g\n", my_gamma_r(input, test));
  printf("%g\n", my_lgamma_r(input, test));

  printf("%g\n", lgamma(input));
  printf("%g\n", my_lgamma(input));

  printf("%g\n", significand(input));
  printf("%g\n", my_significand(input));

#if 0
  printf("%g\n", asin(input));
  printf("%g\n", atan(input));
  printf("%g\n", atan2(input, input));
  printf("%g\n", ceil(input));
  printf("%g\n", cos(input));
  printf("%g\n", cosh(input));
  printf("%g\n", exp(input));
  printf("%g\n", fabs(input));
  printf("%g\n", floor(input));
  printf("%g\n", fmod(input, input));
  /*printf("%g\n", frexp(input, expon));*/
  /*printf("%g\n", ldexp(input, input));*/
  printf("%g\n", log(input));
  printf("%g\n", log10(input));
  /*printf("%g\n", modf(input, input));*/
  printf("%g\n", pow(input, input));
  printf("%g\n", sin(input));
  printf("%g\n", sinh(input));
  printf("%g\n", sqrt(input));
  printf("%g\n", tan(input));
  printf("%g\n", tanh(input));
  printf("%g\n", acosh(input));
  printf("%g\n", asinh(input));
  printf("%g\n", atanh(input));
  printf("%g\n", cbrt(input));
  printf("%g\n", copysign(input, input));
  printf("%g\n", erf(input));
  printf("%g\n", erfc(input));
  printf("%g\n", exp2(input));
  printf("%g\n", expm1(input));
  printf("%g\n", fdim(input, input));
  printf("%g\n", fma(input, input, input));
  printf("%g\n", fmax(input, input));
  printf("%g\n", fmin(input, input));
  printf("%g\n", hypot(input, input));
  printf("%d\n", ilogb(input));
  printf("%g\n", lgamma(input));
  printf("%lld\n", llrint(input));
  printf("%ld\n", lrint(input));
  printf("%lld\n", llround(input));
  printf("%ld\n", lround(input));
  printf("%g\n", log1p(input));
  printf("%g\n", log2(input));
  printf("%g\n", logb(input));
  /*  printf("%g\n", nan(input));*/
  printf("%g\n", nearbyint(input));
  printf("%g\n", nextafter(input, input));
  printf("%g\n", nexttoward(input, input));
  printf("%g\n", remainder(input, input));
  /*  printf("%g\n", remquo(input, input));*/
  printf("%g\n", rint(input));
  printf("%g\n", round(input));
  printf("%g\n", scalbln(input, input));
  printf("%g\n", scalbn(input, input));
  printf("%g\n", tgamma(input));
  printf("%g\n", trunc(input));
  printf("%g\n", j0(input));
  printf("%g\n", j1(input));
  printf("%g\n", jn(input, input));
  printf("%g\n", scalb(input, input));
  printf("%g\n", y0(input));
  printf("%g\n", y1(input));
  printf("%g\n", yn(input, input));
#endif
  return 0;
}
