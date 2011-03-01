#include "string.h"

/* requires:
string.h
 */

#ifdef DEBUG
int my_memcmp(void *s1, void *s2, size_t n)
#else
int memcmp(void *s1, void *s2, size_t n)
#endif
{

  unsigned count = 0;
  unsigned char *_s1 = (unsigned char *)s1;
  unsigned char *_s2 = (unsigned char *)s2;

  for(count=0;count<n;count++)
    {
      if(*_s1++ != *_s2++)
	return *(_s1-1) - *(_s2-1);
    }
  return 0;
}
