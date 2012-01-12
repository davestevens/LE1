#include "string.h"

/* requires:
string.h
 */

#ifdef DEBUG
void my_bcopy(const void *s1, void *s2, size_t n)
#else
void bcopy(const void *s1, void *s2, size_t n)
#endif
{
  /* s1 - where to copy from
     s2 - where to copy to
     n - number of bytes to copy
  */
  unsigned i;

  for(i=0;i<n;i++)
    {
      *((char *)s2 + i) = *((char *)s1 + i);
    }

  return;
}
