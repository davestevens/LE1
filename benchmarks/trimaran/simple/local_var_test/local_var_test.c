

#include <stdio.h>


int main() {
  int arr[16];
  int i;
  int sum;

  for (i=0;  i < 16;  i++)
    arr[i] = 16-i-1;

  printf("Last element is: %d\n", arr[15]);

  sum = 0;
  for (i=0;  i < 16;  i++)
    sum += arr[i];

  printf("Sum is: %d\n", sum);
  return 0;
}
