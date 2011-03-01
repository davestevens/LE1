#include "string.h"

/* requires:
string.h
 */

#ifdef DEBUG
char *my_strncat(char *s1, char *s2, size_t n)
#else
char *strncat(char *s1, char *s2, size_t n)
#endif
{
  size_t i,j;
  for (i = 0; s1[i] != '\0'; i++)
    ;
  for (j = 0; ((s2[j] != '\0') && (j < n)); j++)
    s1[i+j] = s2[j];
  s1[i+j] = '\0';
  return s1;
}
