#ifndef _UTIL_H
#define _UTIL_H

#include <stddef.h>
/*#include <stdint.h>*/
/*#define SIZE (1 << 21)*/
#define SIZE 0x200000

void *mem_heap_lo();

void *mem_heap_hi();

void *mem_sbrk(int size);

void memcpy_8(unsigned long * d, const unsigned long * s, size_t n);

#endif
