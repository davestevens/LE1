
#include <stdio.h>


double doubles(double d1, double d2, double d3, double d4, double d5, double d6, double d7, double d8, double d9, double d10) {
  printf("d9, d10: %.2f %.2f\n", d9, d10);
  printf("%.2f %.2f %.2f %.2f %.2f %.2f %.2f %.2f %.2f %.2f\n",
         d1, d2, d3, d4, d5, d6, d7, d8, d9, d10);
  return d1+d2+d3+d4+d5+d6+d7+d8+d9+d10;
}


int ints(int i1, int i2, int i3, int i4, int i5, int i6, int i7, int i8, int i9, int i10, int i11, int i12, int i13) {
  printf("i9, i10, i11: %d %d %d\n", i9, i10, i11);
  printf("%d %d %d %d %d %d %d %d %d %d %d %d %d\n",
         i1, i2, i3, i4, i5, i6, i7, i8, i9, i10, i11, (int) i12, (int) i13);
  return i1+i2+i3+i4+i5+i6+i7+i8+i9+i10+i11+i12+i13;
}

void ptrs(char *c1, char *c2, char *c3, char *c4, char *c5, char *c6, char *c7, char *c8, char *c9, char *c10) {
  printf("%s %s %s %s %s %s %s %s %s %s\n",
         c1, c2, c3, c4, c5, c6, c7, c8, c9, c10);
}


double mix1(int i1, int i2, double d3, double d4, int i5) {
  printf("%d %d %.2f %.2f %d\n", i1, i2, d3, d4, i5);
  return i1+i2+d3+d4+i5;
}


int mix2(double d1, double d2, int i3, int i4, double d5) {
  printf("%.2f %.2f %d %d %.2f\n", d1, d2, i3, i4, d5);
  return (int) d1+d2+i3+i4+d5;
}


int main(int argc, char **argv) {
  printf("%.2f\n",
         doubles(1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0));
  printf("%d\n",
         ints(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13));
  ptrs("1", "2", "3", "4", "5", "6", "7", "8", "9", "10");
  printf("%.2f\n",
         mix1(1, 2, 3.0, 4.0, 5));
  printf("%d\n",
         mix2(1.0, 2.0, 3, 4, 5.0));

  return 0;
}
