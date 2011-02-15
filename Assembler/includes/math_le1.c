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
