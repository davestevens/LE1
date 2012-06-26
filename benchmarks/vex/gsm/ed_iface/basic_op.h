#ifndef BASIC_OP_H_INCLUDED
#define BASIC_OP_H_INCLUDED
#include "basic_op_inline.h"

/*___________________________________________________________________________
 |                                                                           |
 |   Constants and Globals                                                   |
 |___________________________________________________________________________|
*/
#include "typedef.h"

#if defined(_mfinline_) && defined(BASIC_OP_INLINE)
inline_declare {
inline_module basic_op {
#endif

#define MAX_32 (Word32)0x7fffffffL
#define MIN_32 (Word32)0x80000000L

#define MAX_16 (Word16)0x7fff
#define MIN_16 (Word16)0x8000

#ifdef  VEX_ASM_BASICOP
# define xWord16 Word32
#else
# define xWord16 Word16
#endif

/*___________________________________________________________________________
 |                                                                           |
 |   Prototypes for basic arithmetic operators                               |
 |___________________________________________________________________________|
*/

_INLINE Word16 add (Word16 var1, Word16 var2);    /* Short add,           1   */
_INLINE Word16 sub (Word16 var1, Word16 var2);    /* Short sub,           1   */
_INLINE Word16 abs_s (Word16 var1);               /* Short abs,           1   */
_INLINE Word16 shl (Word16 var1, Word16 var2);    /* Short shift left,    1   */
_INLINE Word16 shr (Word16 var1, Word16 var2);    /* Short shift right,   1   */
_INLINE Word16 negate (Word16 var1);              /* Short negate,        1   */
_INLINE Word16 round (Word32 L_var1);             /* Round,               1   */

_INLINE Word32 L_mac (Word32 L_var3, xWord16 var1, xWord16 var2);   /* Mac,  1  */
_INLINE Word32 L_msu (Word32 L_var3, xWord16 var1, xWord16 var2);   /* Msu,  1  */
_INLINE Word32 L_mult (xWord16 var1, xWord16 var2); /* Long mult,           1   */
_INLINE Word32 L_add (Word32 L_var1, Word32 L_var2);    /* Long add,        2 */
_INLINE Word32 L_sub (Word32 L_var1, Word32 L_var2);    /* Long sub,        2 */
_INLINE Word32 L_shl (Word32 L_var1, Word32 var2);      /* Long shift left, 2 */
_INLINE Word32 L_shr (Word32 L_var1, Word32 var2);      /* Long shift right, 2*/
_INLINE xWord16 mult (xWord16 var1, xWord16 var2); /* Short mult,          1   */

_INLINE Word32 L_macNs (Word32 L_var3, Word16 var1, Word16 var2); /* Mac without
_INLINE Word32 L_msuNs (Word32 L_var3, Word16 var1, Word16 var2); /* Msu without sat, 1 */
_INLINE Word32 L_add_c (Word32 L_var1, Word32 L_var2);  /* Long add with c, 2 */
_INLINE Word32 L_sub_c (Word32 L_var1, Word32 L_var2);  /* Long sub with c, 2 */
_INLINE Word32 L_negate (Word32 L_var1);                /* Long negate,     2 */
_INLINE Word16 mult_r (Word16 var1, Word16 var2);       /* Mult with round, 2 */
_INLINE Word16 shr_r (Word16 var1, Word32 var2);        /* Shift right with round, 2   */
_INLINE Word16 mac_r (Word32 L_var3, Word16 var1, Word16 var2); /* Mac with rounding,2 */
_INLINE Word16 msu_r (Word32 L_var3, Word16 var1, Word16 var2); /* Msu with rounding,2 */
_INLINE Word32 L_deposit_h (Word16 var1);        /* 16 bit var1 -> MSB,     2 */
_INLINE Word32 L_deposit_l (Word16 var1);        /* 16 bit var1 -> LSB,     2 */

_INLINE Word32 L_shr_r (Word32 L_var1, Word32 var2); /* Long shift right with round,  3 */
_INLINE Word32 L_abs (Word32 L_var1);            /* Long abs,              3  */
_INLINE Word32 L_sat (Word32 L_var1);            /* Long saturation,       4  */
_INLINE Word16 norm_s (Word16 var1);             /* Short norm,           15  */
_INLINE Word16 div_s (Word16 var1, Word16 var2); /* Short division,       18  */
_INLINE Word16 norm_l (Word32 L_var1);           /* Long norm,            30  */   

#ifdef _vex_
# define extract_h(L_var1)  ((Word16) ((L_var1) >> 16)) 
# define extract_l(L_var1)  ((Word16) (L_var1))
#else
 _INLINE Word16 extract_h(Word32 L_var1);
 _INLINE Word16 extract_l(Word32 L_var1);
#endif

Flag Overflow;
Flag Carry;

# define MIN(a,b) ((a)<(b)?(a):(b))
# define MAX(a,b) ((a)>(b)?(a):(b))

#ifdef GEN_OVERFLOW
# define saturate(x) ( \
    Overflow = ((Word32)(x) != (Word16)(x)), \
               (((Word32)(x) > (Word16)(x)) ? MAX_16 : \
	        ((Word32)(x) < (Word16)(x)) ? MIN_16 : extract_l(x)) \
)
#else
# define saturate(x) MIN(MAX(x,MIN_16),MAX_16)
#endif

#if defined(BASIC_OP_INLINE)
# include "basicop2.c"
#endif

#if defined(_mfinline_) && defined(BASIC_OP_INLINE)
}}
#endif

#endif

