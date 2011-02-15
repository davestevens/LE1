#include <stdio.h>
#include <math.h>

float sqrt_le1(int m)
{
  float i=0;
  float x1,x2;
  int j;
  while( (i*i) <= m )
    {
      i+=0.1;
      x1=i;
      for(j=0;j<10;j++)
	{
	  x2=m;
	  x2/=x1;
	  x2+=x1;
	  x2/=2;
	  x1=x2;
	}
    }
  return x2;
}

int main()
{
  float input = 16.3333;

  printf("sqrt(%f) = %f\n", input, sqrt(input));

  printf("sqrt_le1(%f) = %f\n", input, sqrt_le1(input));

  return 0;
}
