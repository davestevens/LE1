// Test unaligned memory access.
// Should fail with an error

#include <stdio.h>
int main() {
  char *b;
  int i;
  int *c;
    // two integers (8 bytes)
    volatile int a[2] = {0xAABBCCDD, 0xEEFF0011};
    printf("Two integers: %x %x\n", a[0], a[1]);

    // grab pointer to the first byte
    b = (char*)&a[0];

    for (i = 0; i < 8; i++) {
        c = (int*)b;
        printf("Byte %d: %x\n", i, *c);
        b++;
    }
    return 0;
}
