/* Original FIR filter code
 * Author : Shail Aditya
 * Date : 02/28/96
 */

/* Edit History:
 * -- 04/21/97 Shail Aditya -- Modified to conform to Rob's document
 */

#include "fir.h"

extern int x[N1], w[N2], y[N1-N2+1];

void fir()
{
  int i1,i2;

  for (i1=0; i1<=N1-N2; i1++) {
    for (i2=0; i2<N2; i2++)
      y[i1] = y[i1] + w[i2]*x[i1+i2];
  }
}
