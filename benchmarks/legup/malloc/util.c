#include "util.h"

struct mem {
  char storage[SIZE];
} heap;

char *ptr = heap.storage;

void *mem_heap_lo() {
  return heap.storage;
}

void *mem_heap_hi() {
  return (ptr - 1);
}

void *mem_sbrk(int size) {
  void *p = ptr;
  ptr += size;
  // should check for reaching max heap size
  return p;
}

void memcpy_8(unsigned long * d, const unsigned long * s, size_t n)
{
    unsigned long * dt = d;
    const unsigned long * st = s;
    n >>= 3;
    while (n--)
        *dt++ = *st++;
}
