#include "stdlib.h"

void *malloc(size_t s)
{
  if (NULL != free_list) {
    struct chunk *iter = free_list;
    struct chunk *prev = NULL;
    size_t chunks = (s + sizeof(struct chunk) - 1) / sizeof(struct chunk);
    do {
      if (iter->chunks > chunks) {
	struct chunk *n;
	iter->chunks -= chunks + 1;
	n = iter + iter->chunks + 1;
	n->next = iter->next;
	n->chunks = chunks;
	return (void *) (n + 1);
      } else if (prev != NULL && iter->chunks == chunks) {
	prev->next = iter->next;

	/* it's impossible for iter to equal free_list here */
	return (void *) (iter + 1);
      }

      prev = iter;
      iter = iter->next;
    } while (iter != free_list);

    /* iter == free_list and prev is non-NULL */
    if (iter->chunks == chunks) {
      prev->next = iter->next;

      /* we have used up all memory, set free_list to NULL */
      free_list = NULL;
      return (void *) (iter + 1);
    }
  }
  return NULL;
}

void free(void *ap)
{
  /* bleh, should be an alignment check or someone could wreck memory by
     passing an un-aligned pointer */
  struct chunk *bp = ((struct chunk *) ap) - 1;
  struct chunk *iter;
  struct chunk *prev;

  /* completely used up memory previously */
  if (free_list == NULL) {
    bp->next = bp;
    free_list = bp;
    return;
  }

  prev = free_list;
  iter = free_list->next;
  while (iter != free_list) {
    if (iter > bp && prev < bp) {
      prev->next = bp;
      bp->next = iter;
      /* next block is adjacent in memory */
      if (bp + bp->chunks + 1 == iter) {
	bp->next = iter->next;
	bp->chunks += iter->chunks + 1;
	free_list = bp;
      }

      /* previous block is adjacent in memory */
      if (prev + prev->chunks + 1 == bp) {
	prev->next = bp->next;
	prev->chunks += bp->chunks + 1;
	free_list = prev;
      }
      return;
    }
    prev = iter;
    iter = iter->next;
  }

  /* corner cases, address is outside the linked list */
  prev->next = bp;
  bp->next = iter;

  /* keep free_list at lowest address */
  if (bp < free_list) {
    /* bp | iter              prev |    */
    free_list = bp;

    /* next block is adjacent in memory */
    if (bp + bp->chunks + 1 == iter) {
      bp->next = iter->next;
      bp->chunks += iter->chunks + 1;
      free_list = bp;
    }
  } else {
    /*    | iter              prev | bp */

    /* previous block is adjacent in memory */
    if (prev + prev->chunks + 1 == bp) {
      prev->next = bp->next;
      prev->chunks += bp->chunks + 1;
    }
  }
}

void *calloc(size_t num, size_t size)
{
  size_t s = num * size;
  if (NULL != free_list) {
    unsigned int i;
    struct chunk *p;
    struct chunk *iter = free_list;
    struct chunk *prev = NULL;
    size_t chunks = (s + sizeof(struct chunk) - 1) / sizeof(struct chunk);
    do {
      if (iter->chunks > chunks) {
	struct chunk *n;
	iter->chunks -= chunks + 1;
	n = iter + iter->chunks + 1;
	n->next = iter->next;
	n->chunks = chunks;

	p = n + 1;
	for(i = 0; i < n->chunks; i++) {
	  p->next = 0;
	  p->chunks = 0;
	  p++;
	}
	return (void *) (n + 1);
      } else if (prev != NULL && iter->chunks == chunks) {
	prev->next = iter->next;

	p = iter + 1;
	for(i = 0; i < iter->chunks; i++) {
	  p->next = 0;
	  p->chunks = 0;
	  p++;
	}

	/* it's impossible for iter to equal free_list here */
	return (void *) (iter + 1);
      }

      prev = iter;
      iter = iter->next;
      /* doesn't work if first entry exactly fits the requested size */
    } while (iter != free_list);

    /* iter == free_list and prev is non-NULL */
    if (iter->chunks == chunks) {
      prev->next = iter->next;

      /* we have used up all memory, set free_list to NULL */
      free_list = NULL;

      p = iter + 1;
      for(i = 0; i < iter->chunks; i++) {
	p->next = 0;
	p->chunks = 0;
	p++;
      }
      return (void *) (iter + 1);
    }
  }
  return NULL;
}
