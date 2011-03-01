#include "string.h"

/* requires:
string.h
 */

#ifdef DEBUG
void *my_memchr(void *s1, int c, size_t n)
#else
void *memchr(void *s1, int c, size_t n)
#endif
{
  char *s = (char *)s1;
  size_t count;

  do{
    if((int)(*(char *)s) == c)
      return s;
    count++;
  }while(++s && (count < n));

  return (void *)0;
}
