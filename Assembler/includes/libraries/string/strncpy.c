#include "string.h"

/* requires:
string.h
 */

#ifdef DEBUG
char *my_strncpy(char *s1, char *s2, size_t n)
#else
char *strncpy(char *s1, char *s2, size_t n)
#endif
{
  char *ret = s1;
  unsigned count = 0;
  do {
    *s1++ = *s2;
    if(++count == n)
      {
	return ret;
      }
  } while(*s2++ != '\0');

  while(++count < n)
    {
      *s1++ = '\0';
    }

  return ret;
}
