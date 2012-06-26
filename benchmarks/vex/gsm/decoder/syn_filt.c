/*************************************************************************
 *
 *  FUNCTION:  Syn_filt:
 *
 *  PURPOSE:  Perform synthesis filtering through 1/A(z).
 *
 *************************************************************************/

#include "typedef.h"
#include "basic_op.h"
#include "count.h"

/* m = LPC order == 10 */
#define m 10

void Syn_filt (
    r_Word16 a[],     /* (i)     : a[m+1] prediction coefficients   (m=10)  */
    r_Word16 x[],     /* (i)     : input signal                             */
    r_Word16 y[],     /* (o)     : output signal                            */
    Word16 lg,      /* (i)     : size of filtering                        */
    r_Word16 mem[],   /* (i/o)   : memory associated with this filtering.   */
    Word16 update   /* (i)     : 0=no update, 1=update of memory.         */
)
{
    int i, j;
    r_Word16 tmp[80];   /* This is usually done by memory allocation (lg+m) */
    r_Word16 *yy;
    Word16 yym1, yym2, yym3, yym4, yym5, yym6, yym7, yym8, yym9, yymA;

    /* Copy mem[] to yy[] */

    yy = tmp;                           move16 (); 

#ifdef _vex_
#pragma unroll_amount(10,1)
#endif
    for (i = 0; i < m; i++)
    {
        *yy++ = mem[i];                 move16 (); 
    } 

    /* Do the filtering. */

    yym1 = yy[-1];
    yym2 = yy[-2];
    yym3 = yy[-3];
    yym4 = yy[-4];
    yym5 = yy[-5];
    yym6 = yy[-6];
    yym7 = yy[-7];
    yym8 = yy[-8];
    yym9 = yy[-9];
    yymA = yy[-10];
#ifdef _vex_
#pragma unroll_amount(1,1)
#endif
    for (i = 0; i < lg; i++)
    {
        Word32 p0 = L_mult (x[i], a[0]);
        Word32 p1 = L_mult (a[1], yym1);
        Word32 p2 = L_mult (a[2], yym2);
        Word32 p3 = L_mult (a[3], yym3);
        Word32 p4 = L_mult (a[4], yym4);
        Word32 p5 = L_mult (a[5], yym5);
        Word32 p6 = L_mult (a[6], yym6);
        Word32 p7 = L_mult (a[7], yym7);
        Word32 p8 = L_mult (a[8], yym8);
        Word32 p9 = L_mult (a[9], yym9);
        Word32 pA = L_mult (a[10], yymA);
	Word32 s = L_sub(p0,L_add(L_add(L_add(L_add(p1,p2),L_add(p3,p4)),
			                L_add(L_add(p5,p6),L_add(p7,p8))),
		         L_add(p9,pA)));
	yymA = yym9;
	yym9 = yym8;
	yym8 = yym7;
	yym7 = yym6;
	yym6 = yym5;
	yym5 = yym4;
	yym4 = yym3;
	yym3 = yym2;
	yym2 = yym1;
        *yy++ = yym1 = round (L_shl(s,3));              move16 (); 
    }

    for (i = 0; i < lg; i++)
    {
        y[i] = tmp[i + m];              move16 (); 
    }

    /* Update of memory if update==1 */

    test (); 
    if (update != 0)
    {
#ifdef _vex_
#pragma unroll_amount(4,1)
#endif
        for (i = 0; i < m; i++)
        {
            mem[i] = y[lg - m + i];     move16 (); 
        }
    }
    return;
}
