#include "string.h"

/* requires:
string.h
ctype/tolower.c
 */

#ifdef DEBUG
int my_strcasecmp(char *s1, char *s2)
#else
int strcasecmp(char *s1, char *s2)
#endif
{
  do{
    if(tolower(*s1) != tolower(*s2))
      return tolower(*(unsigned char *)s1) < tolower(*(unsigned char *)s2) ? -1 : 1;
  } while((*s1++ != '\0') && (*s2++ != '\0'));
  return 0;
}
