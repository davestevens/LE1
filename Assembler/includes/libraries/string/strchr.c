#include "string.h"

/* requires:
string.h
 */

#ifdef DEBUG
char *my_strchr(char *s1, int c)
#else
char *strchr(char *s1, int c)
#endif
{
  do{
    if((int)(*s1) == c)
      return s1;
  }while(++s1);

  return (void *)0;
}
