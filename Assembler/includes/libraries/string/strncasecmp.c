#include "string.h"

/* requires:
string.h
ctype/tolower.c
 */

#ifdef DEBUG
int my_strncasecmp(char *s1, char *s2, size_t n)
#else
  int strncasecmp(char *s1, char *s2, size_t n)
#endif
{
  unsigned count = 0;
  do{
    if(tolower(*s1) != tolower(*s2))
      return tolower(*(unsigned char *)s1) < tolower(*(unsigned char *)s2) ? -1 : 1;
    if(++count == n)
      return 0;
  } while((*s1++ != '\0') && (*s2++ != '\0'));
  return 0;
}
