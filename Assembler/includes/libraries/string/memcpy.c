#include "string.h"

/* requires:
string.h
 */

#ifdef DEBUG
void *my_memcpy(void *s1, void *s2, size_t n)
#else
void *memcpy(void *s1, void *s2, size_t n)
#endif
{
  /* s1 - where to copy to
     s2 - where to copy from
     n - number of bytes to copy
  */
  unsigned i;

  for(i=0;i<n;i++)
    {
      *((char *)s1 + i) = *((char *)s2 + i);
    }

  return (void *)s1;
}
