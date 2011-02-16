#include "string.h"

/* requires:
 */

#ifdef DEBUG
char *my_strcpy(char *s1, char *s2)
#else
char *strcpy(char *s1, char *s2)
#endif
{
  char *ret = s1;

  do {
    *s1++ = *s2;
  }while(*s2++ != '\0');

  return ret;
}
