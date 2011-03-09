# MATH LIB
# pre-c99
@acos = ("lm/s_lib_version.c", "lm/k_standard.c", "lm/s_rint.c", "lm/s_matherr.c", "lm/e_acos.c", "lm/w_acos.c", "lm/w_sqrt.c", "lm/e_sqrt.c", "lm/s_fabs.c", "lm/s_isnan.c"); # DONE
@asin = ("lm/s_lib_version.c", "lm/k_standard.c", "lm/s_rint.c", "lm/s_matherr.c", "lm/e_asin.c", "lm/w_asin.c", "lm/w_sqrt.c", "lm/e_sqrt.c", "lm/s_fabs.c", "lm/s_isnan.c"); # DONE
@atan = ("lm/s_atan.c", "lm/s_fabs.c"); # DONE
@atan2 = ("lm/s_lib_version.c", "lm/k_standard.c", "lm/s_rint.c", "lm/s_matherr.c", "lm/e_atan2.c", "lm/w_atan2.c", "lm/s_atan.c", "lm/s_fabs.c", "lm/s_isnan.c"); # DONE
@ceil = ("lm/s_ceil.c"); # DONE
@cos = ("lm/s_lib_version.c", "lm/k_standard.c", "lm/s_rint.c", "lm/s_matherr.c", "lm/k_cos.c", "lm/s_cos.c", "lm/e_rem_pio2.c", "lm/k_rem_pio2.c", "lm/s_fabs.c", "lm/s_scalbn.c", "lm/s_copysign.c", "lm/s_floor.c", "lm/k_sin.c"); # DONE
@cosh = ("lm/s_lib_version.c", "lm/k_standard.c", "lm/s_rint.c", "lm/s_matherr.c", "lm/e_cosh.c", "lm/w_cosh.c", "lm/fabs.c", "lm/isnan.c", "lm/e_exp.c", "lm/w_exp.c", "lm/s_expm1.c"); # DONE
@exp = ("lm/s_lib_version.c", "lm/k_standard.c", "lm/s_rint.c", "lm/s_matherr.c", "lm/e_exp.c", "lm/w_exp.c"); # DONE
@fabs = ("lm/s_fabs.c"); # DONE
@floor = ("lm/s_floor.c"); # DONE
@fmod = ("lm/s_lib_version.c", "lm/k_standard.c", "lm/s_rint.c", "lm/s_matherr.c", "lm/e_fmod.c", "lm/w_fmod.c", "lm/s_isnan.c"); # DONE
@frexp = ("lm/s_frexp.c"); # DONE
@ldexp = ("lm/s_ldexp.c", "lm/s_finite.c", "lm/s_scalbn.c", "lm/s_copysign.c"); # DONE
@log = ("lm/s_lib_version.c", "lm/k_standard.c", "lm/s_rint.c", "lm/s_matherr.c", "lm/e_log.c", "lm/w_log.c", "lm/s_isnan.c"); # DONE
@log10 = ("lm/s_lib_version.c", "lm/k_standard.c", "lm/s_rint.c", "lm/s_matherr.c", "lm/e_log10.c", "lm/w_log10.c", "lm/s_isnan.c", "lm/e_log.c", "lm/w_log.c"); # DONE
@modf = ("lm/s_modf.c"); # DONE
@pow = ("lm/s_lib_version.c", "lm/k_standard.c", "lm/s_rint.c", "lm/s_matherr.c", "lm/e_pow.c", "lm/w_pow.c", "lm/s_fabs.c", "lm/s_finite.c", "lm/s_isnan.c", "lm/s_scabln.c", "lm/s_copysign.c", "lm/e_sqrt.c", "lm/w_sqrt.c"); # DONE
@sin = ("lm/s_lib_version.c", "lm/k_standard.c", "lm/s_rint.c", "lm/s_matherr.c", "lm/k_sin.c", "lm/s_sin.c", "lm/e_rem_pio2.c", "lm/k_rem_pio2.c", "lm/s_fabs.c", "lm/s_scalbn.c", "lm/s_copysign.c", "lm/s_floor.c", "lm/k_cos.c"); # DONE
@sinh = ("lm/s_lib_version.c", "lm/k_standard.c", "lm/s_rint.c", "lm/s_matherr.c", "lm/e_sinh.c", "lm/w_sinh.c", "lm/s_fabs.c", "lm/e_exp.c", "lm/w_exp.c", "lm/s_expm1.c", "lm/s_finite.c"); # DONE
@sqrt = ("lm/s_lib_version.c", "lm/k_standard.c", "lm/s_rint.c", "lm/s_matherr.c", "lm/w_sqrt.c", "lm/e_sqrt.c"); # DONE
@tan = ("lm/s_lib_version.c", "lm/k_standard.c", "lm/s_rint.c", "lm/s_matherr.c", "lm/k_tan.c", "lm/s_tan.c", "lm/s_fabs.c", "lm/e_rem_pio2.c", "lm/k_rem_pio2.c", "lm/s_fabs.c", "lm/s_scalbn.c", "lm/s_copysign.c", "lm/s_floor.c"); # DONE
@tanh = ("lm/s_tanh.c", "lm/s_fabs.c", "lm/s_expm1.c"); # DONE

# c99
@acosh = ("lm/s_lib_version.c", "lm/k_standard.c", "lm/s_rint.c", "lm/s_matherr.c", "lm/e_acosh.c", "lm/w_acosh.c", "lm/e_log.c", "lm/s_log1p.c", "lm/s_isnan.c", "lm/w_sqrt.c", "lm/e_sqrt.c"); # DONE
@asinh = ("lm/s_lib_version.c", "lm/k_standard.c", "lm/s_rint.c", "lm/s_matherr.c", "lm/s_asinh.c", "lm/e_log.c", "lm/s_log1p.c", "lm/s_fabs.c", "lm/w_sqrt.c", "lm/e_sqrt.c"); # DONE
@atanh = ("lm/s_lib_version.c", "lm/k_standard.c", "lm/s_rint.c", "lm/s_matherr.c", "lm/e_atanh.c", "lm/w_atanh.c", "lm/s_log1p.c", "lm/s_isnan.c", "lm/s_fabs.c"); # DONE
@cbrt = ("lm/s_cbrt.c"); # DONE
@copysign = ("lm/s_copysign.c"); # DONE
@erf = ("lm/s_erf.c", "lm/s_fabs.c", "lm/e_exp.c"); # DONE
@erfc = ("UNKNONW"); # DONE
@exp2 = ("UNKNOWN"); # DONE
@expm1 = ("lm/s_expm1.c"); # DONE
@fdim = ("UNKNOWN"); # DONE
@fma = ("UNKNOWN"); # DONE
@fmax = ("UNKNOWN"); # DONE
@fmin = ("UNKNOWN"); # DONE
@hypot = ("lm/s_lib_version.c", "lm/k_standard.c", "lm/s_rint.c", "lm/s_matherr.c", "lm/e_hypot.c", "lm/w_hypot.c", "lm/s_finite.c", "lm/w_sqrt.c", "lm/e_sqrt.c"); # DONE
@ilogb = ("lm/s_ilogb.c"); # DONE
@lgamma = ("lm/s_lib_version.c", "lm/k_standard.c", "lm/s_rint.c", "lm/s_matherr.c", "lm/e_lgamma.c", "lm/w_lgamma.c", "lm/s_signgam.c", "lm/s_finite.c", "lm/s_floor.c", "lm/s_fabs.c", "lm/e_log.c", "lm/e_lgamma_r.c", "lm/k_cos.c", "lm/k_sin.c"); # DONE
@llrint = ("UNKNOWN"); # DONE
@lrint = ("UNKNOWN"); # DONE
@llround = ("UNKNOWN"); # DONE
@lround = ("UNKNOWN"); # DONE
@log1p = ("lm/s_log1p.c"); # DONE
@log2 = ("UNKNOWN"); # DONE
@logb = ("lm/s_logb.c", "lm/s_fabs.c"); # DONE
@nan = ("UNKNOWN"); # DONE
@nearbyint = ("UNKNOWN"); # DONE
@nextafter = ("lm/s_nextafter.c"); # DONE
@nextforward = ("UNKNOWN"); # DONE
@remainder = ("lm/s_lib_version.c", "lm/k_standard.c", "lm/s_rint.c", "lm/s_matherr.c", "lm/e_remainder.c", "lm/w_remainder.c" ,"lm/s_isnan.c", "lm/s_fabs.c", "lm/e_fmod.c"); # DONE
@remquo = ("UNKNOWN"); # DONE
@rint = ("lm/s_rint.c"); # DONE
@round = ("UNKNOWN"); # DONE
@scalbln = ("UNKNOWN"); # DONE
@scalbn = ("lm/s_scalbn.c", "lm/s_copysign.c"); # DONE
@tgamma = ("UNKNOWN"); # DONE
@trunc = ("UNKNOWN"); # DONE

# XSI
@j0 = ("lm/s_lib_version.c", "lm/k_standard.c", "lm/s_rint.c", "lm/s_matherr.c", "lm/e_j0.c", "lm/w_j0.c", "lm/s_fabs.c", "lm/s_isnan.c", "lm/w_sqrt.c", "lm/e_sqrt.c", "lm/e_log.c", "lm/s_sin.c", "lm/k_cos.c", "lm/s_cos.c", "lm/e_rem_pio2.c", "lm/k_rem_pio2.c", "lm/s_scalbn.c", "lm/s_copysign.c", "lm/s_floor.c", "lm/k_sin.c"); # DONE
@j1 = ("lm/s_lib_version.c", "lm/k_standard.c", "lm/s_rint.c", "lm/s_matherr.c", "lm/e_j1.c", "lm/w_j1.c", "lm/s_fabs.c", "lm/s_isnan.c", "lm/w_sqrt.c", "lm/e_sqrt.c", "lm/e_log.c", "lm/s_sin.c", "lm/k_cos.c", "lm/s_cos.c", "lm/e_rem_pio2.c", "lm/k_rem_pio2.c", "lm/s_scalbn.c", "lm/s_copysign.c", "lm/s_floor.c", "lm/k_sin.c"); # DONE
@jn = ("lm/s_lib_version.c", "lm/k_standard.c", "lm/s_rint.c", "lm/s_matherr.c", "lm/e_jn.c", "lm/w_jn.c", "lm/s_fabs.c", "lm/s_isnan.c", "lm/w_sqrt.c", "lm/e_sqrt.c", "lm/e_log.c", "lm/s_sin.c", "lm/k_cos.c", "lm/s_cos.c", "lm/e_rem_pio2.c", "lm/k_rem_pio2.c", "lm/s_scalbn.c", "lm/s_copysign.c", "lm/s_floor.c", "lm/k_sin.c"); # DONE);
@scalb = ("lm/s_lib_version.c", "lm/k_standard.c", "lm/s_rint.c", "lm/s_matherr.c", "lm/e_scalb.c", "lm/w_scalb.c", "lm/s_finite.c", "lm/s_isnan.c", "lm/s_scalbn.c", "lm/s_copysign.c"); # DONE
@y0 = ("lm/s_lib_version.c", "lm/k_standard.c", "lm/s_rint.c", "lm/s_matherr.c", "lm/e_j0.c", "lm/w_j0.c", "lm/s_fabs.c", "lm/s_isnan.c", "lm/w_sqrt.c", "lm/e_sqrt.c", "lm/e_log.c", "lm/s_sin.c", "lm/k_cos.c", "lm/s_cos.c", "lm/e_rem_pio2.c", "lm/k_rem_pio2.c", "lm/s_scalbn.c", "lm/s_copysign.c", "lm/s_floor.c", "lm/k_sin.c"); # DONE
@y1 = ("lm/s_lib_version.c", "lm/k_standard.c", "lm/s_rint.c", "lm/s_matherr.c", "lm/e_j1.c", "lm/w_j1.c", "lm/s_fabs.c", "lm/s_isnan.c", "lm/w_sqrt.c", "lm/e_sqrt.c", "lm/e_log.c", "lm/s_sin.c", "lm/k_cos.c", "lm/s_cos.c", "lm/e_rem_pio2.c", "lm/k_rem_pio2.c", "lm/s_scalbn.c", "lm/s_copysign.c", "lm/s_floor.c", "lm/k_sin.c"); # DONE
@yn = ("lm/s_lib_version.c", "lm/k_standard.c", "lm/s_rint.c", "lm/s_matherr.c", "lm/e_jn.c", "lm/w_jn.c", "lm/s_fabs.c", "lm/s_isnan.c", "lm/w_sqrt.c", "lm/e_sqrt.c", "lm/e_log.c", "lm/s_sin.c", "lm/k_cos.c", "lm/s_cos.c", "lm/e_rem_pio2.c", "lm/k_rem_pio2.c", "lm/s_scalbn.c", "lm/s_copysign.c", "lm/s_floor.c", "lm/k_sin.c"); # DONE);

# STRING


@memchr = ("string/memchr.c");
@memcmp = ("string/memcmp.c");
@memcpy = ("string/memcpy.c");
@memmove = ("string/memmove.c", "string/strcpy.c");
@memset = ("string/memset.c");

@strcat = ("string/strcat.c");
@strchr = ("string/strchr.c");
@strcmp = ("string/strcmp.c");
@strcoll = ("string/strcoll.c");
@strcpy = ("string/strcpy.c");
@strcspn = ("string/strcspn.c");
@strerror = ("string/strerror.c"); # THIS IS LIMITED TO A SINGLE STRING ERROR
@strlen = ("string/strlen.c");
@strncat = ("string/strncat.c");
@strncmp = ("string/strncmp.c");
@strncpy = ("string/strncpy.c");
@strrchr = ("string/strrchr.c");
@strspn = ("string/strspn.c");


# STDLIB

# SOFTFLOAT


