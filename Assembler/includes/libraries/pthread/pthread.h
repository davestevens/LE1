/* vex custom instruction stuff */
/* vthreads */

typedef unsigned int pthread_t;
typedef unsigned int pthread_attr_t;

typedef struct {
  int vthread_return;
  pthread_t thread_id;
} __vexasm2;

int _asm1(int,...);
__vexasm2 _asm2(int,...);

int vthread_create(pthread_t *, pthread_attr_t *, void *, void *);
int vthread_join(pthread_t, void **);

#define pthread_create(thread, atts,func, args) vthread_create(thread, atts, func, args)
#define pthread_join(thread, status) vthread_join(thread, status)
