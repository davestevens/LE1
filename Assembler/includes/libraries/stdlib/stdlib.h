#ifndef _SMALLOC_H_
#define _SMALLOC_H_

#define NULL 0
#define size_t unsigned

void *malloc(size_t s);
void *calloc(size_t num, size_t size);
void free(void *ap);

#ifndef HEAP_SIZE
#define HEAP_SIZE 100 /* chunks */
#endif

struct chunk {
  struct chunk *next;
  size_t chunks;
};

static struct chunk heap[HEAP_SIZE] = {{heap,HEAP_SIZE - 1}};
static struct chunk *free_list = heap;

#endif
