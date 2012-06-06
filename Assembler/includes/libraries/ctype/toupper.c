#include "ctype.h"

/* requires:
ctype.h
 */

#ifdef DEBUG
int my_toupper(int c)
#else
int toupper(int c)
#endif
{
  if((c > 96) && (c < 123)) {
    return (c - 32);
  }
  else {
    return c;
  }
}
