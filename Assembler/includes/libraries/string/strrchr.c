#include "string.h"

/* requires:
 */

#ifdef DEBUG
char *my_strrchr(char *s1, int c)
#else
char *strrchr(char *s1, int c)
#endif
{
  char *s = 0;
  do{
    if((int)(*s1) == c)
      s = s1;
  }while(++s1 && *s1);

  return s;
}
