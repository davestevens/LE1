#include <stdio.h>

extern int output[4];

static void function(void) {
  output[3] = 0x50505050;
  return;
}

void file3(void) {
  function();
  return;
}
