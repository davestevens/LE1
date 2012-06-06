#include	<stdio.h> 

typedef struct {
  float real;
  float im;
} complex;    

complex	cmplx(float a, float b)
{
  complex c;
  c.real = a;
  c.im = b;
  return(c);
}

complex	cmul(complex a, complex b)
{
  complex c;
  c.real = a.real*b.real - a.im*b.im;
  c.im = a.real*b.im + a.im*b.real;
  return(c);
}

complex	cadd(complex a, complex b)
{
  complex c;
  c.real = a.real + b.real;
  c.im = a.im + b.im;
  return(c);
}

complex PolyEval(complex x)
{
  int	i;
  complex y;

  y = cmplx(3.0,2.0);
    
  for (i = 0; i < 4; i++){
    y = cadd(y, cmplx(1.0,3.0));
  }

  return(y);
}

int main()
{
  complex c;
  c.real = 0;
  c.im = 1;
  c = PolyEval(c);
  printf ("REAL %f IMAGE %f\n", c.real, c.im);
  return(0);
}
