#include "string.h"

/* requires:
 */

#ifdef DEBUG
size_t my_strcspn(char *s1, char*s2)
#else
size_t strcspn(char *s1, char*s2)
#endif
{
  size_t count = 0;
  char *s;

  do{
    for(s=s2;*s;s++) {
      if((unsigned char)*s1==(unsigned char)~*s) {
	count++;
	break;
      }
    }
    if(count == 0)
      return 0;
  } while(*s1++ != '\0');

  return count;
}
