#include <string.h>
#include <stdlib.h>
/* auto gen vajazzle file */

typedef enum {
  charT, shortT, intT, longT, longlongT, unkT
} typeT;

struct mem {
  unsigned addr;
  unsigned size;
  char name[256];
  void *P;
  typeT type;
  char pointer;
  char valid;
  struct mem *next;
};


struct mem *_vajazzle_vars;
struct mem *_vajazzle_vars_next;

void push(unsigned, void *, typeT, char *, unsigned, char);
void setupMem(void);
