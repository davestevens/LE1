#include "string.h"

/* requires:
 */

#ifdef DEBUG
int my_strcmp(char *s1, char *s2)
#else
int strcmp(char *s1, char *s2)
#endif
{
  do{
    if(*s1 != *s2)
      return *(unsigned char *)s1 < *(unsigned char *)s2 ? -1 : 1;
  } while((*s1++ != '\0') && (*s2++ != '\0'));
  return 0;
}
