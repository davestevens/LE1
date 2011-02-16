#include "string.h"

/* requires:
 */

#ifdef DEBUG
char *my_strcat(char *s1, char*s2)
#else
char *strcat(char *s1, char*s2)
#endif
{
  size_t i,j;
  for (i = 0; s1[i] != '\0'; i++)
    ;
  for (j = 0; s2[j] != '\0'; j++)
    s1[i+j] = s2[j];
  s1[i+j] = '\0';
  return s1;
}
