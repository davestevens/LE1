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

/* Mutex */

typedef unsigned int pthread_mutex_t;
typedef unsigned int pthread_mutexattr_t;

int vthread_mutex_init(pthread_mutex_t *, pthread_mutexattr_t *);
int vthread_mutex_destroy(pthread_mutex_t *);
int vthread_mutex_lock(pthread_mutex_t *);
int vthread_mutex_unlock(pthread_mutex_t *);

#define pthread_mutex_init(mutex, attr) vthread_mutex_init(mutex, attr)
#define pthread_mutex_destroy(mutex) vthread_mutex_destroy(mutex)
#define pthread_mutex_lock(mutex) vthread_mutex_lock(mutex)
#define pthread_mutex_unlock(mutex) vthread_mutex_unlock(mutex)
