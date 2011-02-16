#include "string.h"

/* requires:
 */

#ifdef DEBUG
void *my_memset(void *s1, int c, size_t len)
#else
void *memset(void *s1, int c, size_t len)
#endif
{
  char *s = (char *)s1;
  size_t i;
  for(i=0;i<len;i++)
    {
      *s++ = (char)c;
    }
  return s1;
}
