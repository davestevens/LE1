#include "string.h"

/* requires:
string.h
 */

#ifdef DEBUG
size_t my_strlen(char *s1)
#else
size_t strlen(char *s1)
#endif
{
  const char *str;
  for (str = s1; *str; ++str);
  return(str - s1);
}
