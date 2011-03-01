#include "string.h"

/* requires:
strcpy.c
string.h
 */

#ifdef DEBUG
void *my_memmove(void *s1, void *s2, size_t n)
#else
void *memmove(void *s1, void *s2, size_t n)
#endif
{
  size_t i;
  char *str;
  char tmp[256];

  for(str=(char *)s2;*str;str++)
    if((int)str == (int)s1) {
#ifdef DEBUG
	my_strcpy(tmp, (char *)s2);
#else
	strcpy(tmp, (char *)s2);
#endif
	s2 = (char *)tmp;
      }

  for(i=0;i<n;i++)
    *((char *)s1 + i) = *((char *)s2 + i);

  return (void *)s1;
}
