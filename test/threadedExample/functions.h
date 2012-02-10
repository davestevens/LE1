#ifndef _GUARD_FUNC
#define _GUARD_FUNC

#define NUM_THREADS 4
#define DATA_SIZE 100
int array[(DATA_SIZE * NUM_THREADS)];

void (*fp[4])(unsigned);

void func1(unsigned);
void func2(unsigned);
void func3(unsigned);
void func4(unsigned);

#endif
