/* our own vthread functions */
#include "pthread.h"

/* vthread_create
   calls custom instruction associated with creating new thread
   sets thread to the threadid specified
   returns the thread_create RETURN VALUE
 */
int vthread_create(pthread_t *thread, pthread_attr_t *atts, void *func, void *args)
{
  __vexasm2 ret;
  ret = _asm2(0x1, atts, func, args);
  *thread = ret.thread_id;
  return ret.vthread_return;
}

/* vthread_join
   calls custom inst for pthread_join
   blocks calling thread until <thread> terminates
 */
int vthread_join(pthread_t thread, void **status)
{
  __vexasm2 ret;
  ret = _asm2(0x2, thread);
  *status = (void**)ret.thread_id;
  return ret.vthread_return;
}
