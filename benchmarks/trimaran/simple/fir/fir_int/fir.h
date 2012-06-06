#ifndef FIR_H
#define FIR_H

#define N1 128
#define N2 32

#define COL 80

#define max(x,y) ((x)>=(y) ? (x) : (y))
#define min(x,y) ((x)<=(y) ? (x) : (y))

#define DIVCEIL(x,y) (((x)+(y)-1)/(y))
#define DIVFLOOR(x,y) ((x)/(y))

extern void fir();

#endif
