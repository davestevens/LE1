#include "ctype.h"

/* requires:
ctype.h
 */

#ifdef DEBUG
int my_tolower(int c)
#else
int tolower(int c)
#endif
{
  if((c > 64) && (c < 91)) {
    return (c + 32);
  }
  else {
    return c;
  }
}
