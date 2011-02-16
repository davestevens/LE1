#include "string.h"

/* requires:
 */

#ifdef DEBUG
int my_strncmp(char *s1, char *s2, size_t n)
#else
int strncmp(char *s1, char *s2, size_t n)
#endif
{
  unsigned count = 0;
  do{
    if(*s1 != *s2)
      return *(unsigned char *)s1 - *(unsigned char *)s2;/* ? -1 : 1;*/
    if(++count == n)
      return 0;
  } while((*s1++ != '\0') && (*s2++ != '\0'));
  return 0;
}
