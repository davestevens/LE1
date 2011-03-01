#include "string.h"

/* requires:
string.h
 */

#ifdef DEBUG
size_t my_strspn(char *s1, char*s2)
#else
size_t strspn(char *s1, char*s2)
#endif
{
  size_t count = 0;
  char *s;

  do{
    for(s=s2;*s;s++) {
      if(*s1==*s) {
	count++;
	break;
      }
    }
    if(count == 0)
      return 0;
  } while(*s1++ != '\0');

  return count;
}
