#include "string.h"

/* requires:
string.h
 */

char *err = "strerror()";

#ifdef DEBUG
char *my_strerror(int errnum)
#else
char *strerror(int errnum)
#endif
{
  return err;
}
