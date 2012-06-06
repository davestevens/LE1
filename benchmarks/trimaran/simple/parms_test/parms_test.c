/* IMPACT Public Release (www.crhc.uiuc.edu/IMPACT)            Version 2.33  */
/* IMPACT Trimaran Release (www.trimaran.org)                  July 12, 1999 */
/*****************************************************************************\ 
 * LICENSE AGREEMENT NOTICE
 * 
 * IT IS A BREACH OF THIS LICENSE AGREEMENT TO REMOVE THIS NOTICE FROM
 * THE FILE OR SOFTWARE, OR ANY MODIFIED VERSIONS OF THIS FILE OR
 * SOFTWARE OR DERIVATIVE WORKS.
 * 
 * ------------------------------						
 * 
 * Copyright Notices/Identification of Licensor(s) of 
 * Original Software in the File
 * 
 * Copyright 1990-1998 The Board of Trustees of the University of Illinois
 * For commercial license rights, contact: Research and Technology
 * Management Office, University of Illinois at Urbana-Champaign; 
 * FAX: 217-244-3716, or email: rtmo@uiuc.edu
 * 
 * All rights reserved by the foregoing, respectively.
 * 
 * ------------------------------
 * 	
 * Copyright Notices/Identification of Subsequent Licensor(s)/Contributors 
 * of Derivative Works
 * 
 * Copyright  <Year> <Owner>
 * <Optional:  For commercial license rights, contact:_____________________>
 * 
 * 
 * All rights reserved by the foregoing, respectively.
 * 
 * ------------------------------						
 * 
 * The code contained in this file, including both binary and source 
 * [if released by the owner(s)] (hereafter, Software) is subject to
 * copyright by the respective Licensor(s) and ownership remains with
 * such Licensor(s).  The Licensor(s) of the original Software remain
 * free to license their respective proprietary Software for other
 * purposes that are independent and separate from this file, without
 * obligation to any party.
 * 
 * Licensor(s) grant(s) you (hereafter, Licensee) a license to use the
 * Software for academic, research and internal business purposes only,
 * without a fee.  "Internal business purposes" means that Licensee may
 * install, use and execute the Software for the purpose of designing and
 * evaluating products.  Licensee may submit proposals for research
 * support, and receive funding from private and Government sponsors for
 * continued development, support and maintenance of the Software for the
 * purposes permitted herein.
 * 
 * Licensee may also disclose results obtained by executing the Software,
 * as well as algorithms embodied therein.  Licensee may redistribute the
 * Software to third parties provided that the copyright notices and this
 * License Agreement Notice statement are reproduced on all copies and
 * that no charge is associated with such copies.  No patent or other
 * intellectual property license is granted or implied by this Agreement,
 * and this Agreement does not license any acts except those expressly
 * recited.
 * 
 * Licensee may modify the Software to make derivative works (as defined
 * in Section 101 of Title 17, U.S. Code) (hereafter, Derivative Works),
 * as necessary for its own academic, research and internal business
 * purposes.  Title to copyrights and other proprietary rights in
 * Derivative Works created by Licensee shall be owned by Licensee
 * subject, however, to the underlying ownership interest(s) of the
 * Licensor(s) in the copyrights and other proprietary rights in the
 * original Software.  All the same rights and licenses granted herein
 * and all other terms and conditions contained in this Agreement
 * pertaining to the Software shall continue to apply to any parts of the
 * Software included in Derivative Works.  Licensee's Derivative Work
 * should clearly notify users that it is a modified version and not the
 * original Software distributed by the Licensor(s).
 * 
 * If Licensee wants to make its Derivative Works available to other
 * parties, such distribution will be governed by the terms and
 * conditions of this License Agreement.  Licensee shall not modify this
 * License Agreement, except that Licensee shall clearly identify the
 * contribution of its Derivative Work to this file by adding an
 * additional copyright notice to the other copyright notices listed
 * above, to be added below the line "Copyright Notices/Identification of
 * Subsequent Licensor(s)/Contributors of Derivative Works."  A party who
 * is not an owner of such Derivative Work within the meaning of
 * U.S. Copyright Law (i.e., the original author, or the employer of the
 * author if "work of hire") shall not modify this License Agreement or
 * add such party's name to the copyright notices above.
 * 
 * Each party who contributes Software or makes a Derivative Work to this
 * file (hereafter, Contributed Code) represents to each Licensor and to
 * other Licensees for its own Contributed Code that:
 * 
 * (a) Such Contributed Code does not violate (or cause the Software to
 * violate) the laws of the United States, including the export control
 * laws of the United States, or the laws of any other jurisdiction.
 * 
 * (b) The contributing party has all legal right and authority to make
 * such Contributed Code available and to grant the rights and licenses
 * contained in this License Agreement without violation or conflict with
 * any law.
 * 
 * (c) To the best of the contributing party's knowledge and belief,
 * the Contributed Code does not infringe upon any proprietary rights or
 * intellectual property rights of any third party.
 * 
 * LICENSOR(S) MAKE(S) NO REPRESENTATIONS ABOUT THE SUITABILITY OF THE
 * SOFTWARE OR DERIVATIVE WORKS FOR ANY PURPOSE.  IT IS PROVIDED "AS IS"
 * WITHOUT EXPRESS OR IMPLIED WARRANTY, INCLUDING BUT NOT LIMITED TO THE
 * MERCHANTABILITY, USE OR FITNESS FOR ANY PARTICULAR PURPOSE AND ANY
 * WARRANTY AGAINST INFRINGEMENT OF ANY INTELLECTUAL PROPERTY RIGHTS.
 * LICENSOR(S) SHALL NOT BE LIABLE FOR ANY DAMAGES SUFFERED BY THE USERS
 * OF THE SOFTWARE OR DERIVATIVE WORKS.
 * 
 * Any Licensee wishing to make commercial use of the Software or
 * Derivative Works should contact each and every Licensor to negotiate
 * an appropriate license for such commercial use, and written permission
 * of all Licensors will be required for such a commercial license.
 * Commercial use includes (1) integration of all or part of the source
 * code into a product for sale by or on behalf of Licensee to third
 * parties, or (2) distribution of the Software or Derivative Works to
 * third parties that need it to utilize a commercial product sold or
 * licensed by or on behalf of Licensee.
 * 
 * By using or copying this Contributed Code, Licensee agrees to abide by
 * the copyright law and all other applicable laws of the U.S., and the
 * terms of this License Agreement.  Any individual Licensor shall have
 * the right to terminate this license immediately by written notice upon
 * Licensee's breach of, or non-compliance with, any of its terms.
 * Licensee may be held legally responsible for any copyright
 * infringement that is caused or encouraged by Licensee's failure to
 * abide by the terms of this License Agreement.  
\*****************************************************************************/ 

typedef struct struct1
{
    char c;
    float f;
} Struct1;

typedef struct struct2
{
    double d;
    char c;
    float f;
} Struct2;

typedef struct struct3
{
    Struct1  s1;
    Struct2  s2;
    struct {
	char c;
	double d;
    } s3;
    int       i;
} Struct3;

typedef struct struct4
{
    int int_array[100];
} Struct4;

typedef int Int_Array[64];
typedef Int_Array *Int_Array_Ptr;
typedef Int_Array_Ptr *Int_Array_Ptr_Ptr;

typedef int Int_Matrix[10][10];
typedef Int_Matrix *Int_Matrix_Ptr;
typedef Int_Matrix_Ptr *Int_Matrix_Ptr_Ptr;

typedef short    int         SInt;

void printca5 (char *fmt, char *ca1, char *ca2, char *ca3, char *ca4, 
	       char *ca5)
{
    printf ("In printca5:\n");
    printf (fmt, ca1, ca2, ca3, ca4, ca5);
}

void printc5 (char *fmt, char c1, char c2, char c3, char c4, char c5)
{
    printf ("In printc5:\n");
    printf (fmt, c1, c2, c3, c4, c5);
}

void prints5 (char *fmt, short s1, short s2, short s3, short s4, short s5)
{
    printf ("In prints5:\n");
    printf (fmt, s1, s2, s3, s4, s5);
}

void prints5_2 (char *fmt, SInt s1, SInt s2, SInt s3, SInt s4, SInt s5)
{
    printf ("In prints5_2:\n");
    printf (fmt, s1, s2, s3, s4, s5);
}

void printi5 (char *fmt, int i1, int i2, int i3, int i4, int i5)
{
    printf ("In printi5:\n");
    printf (fmt, i1, i2, i3, i4, i5);
}

void printl5 (char *fmt, long l1, long l2, long l3, long l4, long l5)
{
    printf ("In printl5:\n");
    printf (fmt, l1, l2, l3, l4, l5);
}

void printf5 (char *fmt, float f1, float f2, float f3, float f4, float f5)
{
    printf ("In printf5:\n");
    printf (fmt, f1, f2, f3, f4, f5);
}

void printd5 (char *fmt, double d1, double d2, double d3, double d4, double d5)
{
    printf ("In printd5:\n");
    printf (fmt, d1, d2, d3, d4, d5);
}

/* Pass structures pointer */
void inc_struct1 (Struct1 *s1)
{
    s1->c++;
    s1->f++;
}

/* Pass structures copy */
void inc_struct2 (Struct1 s1)
{
    s1.c++;
    s1.f++;

    printf ("In inc_struct2: c = '%c' f = '%f'\n", s1.c, s1.f);
}

/* Pass structures copy */
void inc_struct3 (Struct1 s1, Struct1 s2, Struct1 s3, Struct1 s4, Struct1 s5)
{
    s1.c++;
    s1.f++;

    s2.f+=2;
    s3.f+=3;
    s4.f+=4;

    s5.c+=5;
    s5.f+=5;

    printf ("In inc_struct3: s1.c = '%c' s1.f = '%f'\n", s1.c, s1.f);
    printf ("In inc_struct3: s5.c = '%c' s1.f = '%f'\n", s5.c, s5.f);
}

/* Pass structures copy */
void inc_struct4 (Struct2 s1, Struct2 s2, Struct2 s3, Struct2 s4, Struct2 s5)
{
    s1.d++;
    s1.c++;
    s1.f++;

    s2.f+=2;
    s3.f+=3;
    s4.f+=4;

    s5.d+=5;
    s5.c+=5;
    s5.f+=5;

    printf ("In inc_struct4: s1.d = '%f' s1.c = '%c' s1.f = '%f'\n", 
	    s1.d, s1.c, s1.f);
    printf ("In inc_struct4: s5.d = '%f' s5.c = '%c' s1.f = '%f'\n", 
	    s5.d, s5.c, s5.f);
}
void inc_struct5 (Struct3 S3)
{
    S3.s1.c+=2;
    S3.s2.f+=10.0001;
    S3.s3.d+=13.10;
    S3.i += 5;
    printf ("In inc_struct5: s1.c = '%c' s2.f = '%f' s3.d = '%f' i=%i\n",
	    S3.s1.c, S3.s2.f, S3.s3.d, S3.i);
}

Struct3 *inc_struct6 (Struct3 *S3)
{
    S3->s1.c+=-2;
    S3->s2.f+=-10.0001;
    S3->s3.d+=-13.10;
    S3->i += -15;
    return (S3);
}

void inc_int (int *i, int by)
{
    (*i)+= by;
}

void indirect_int (int i1, int i2, int i3, int i4, int i5)
{
    printf ("indirect_int start: i1 = %i i2 = %i i3 = %i i4 = %i i5 = %i\n", 
	    i1, i2, i3, i4, i5);

    inc_int (&i1, 1);
    inc_int (&i3, 3);
    inc_int (&i5, 5);

    printf ("indirect_int end: i1 = %i i2 = %i i3 = %i i4 = %i i5 = %i\n", 
	    i1, i2, i3, i4, i5);
}

void inc_float (float *i, float by)
{
    (*i)+= by;
}

void indirect_float (float f1, float f2, float f3, float f4, float f5)
{
    printf ("indirect_float start: f1=%.3f f2=%.3f f3=%.3f f4=%.3f f5=%.3f\n",
	    f1, f2, f3, f4, f5);

    inc_float (&f1, 1.01);
    inc_float (&f3, 3.03);
    inc_float (&f5, 5.05);

    printf ("indirect_float end: f1=%.3f f2=%.3f f3=%.3f f4=%.3f f5=%.3f\n", 
	    f1, f2, f3, f4, f5);
}

void inc_double (double *i, double by)
{
    (*i)+= by;
}


void indirect_double (double f1, double f2, double f3, double f4, double f5)
{
    printf ("indirect_double start: f1=%.4f f2=%.4f f3=%.4f f4=%.4f f5=%.4f\n",
	    f1, f2, f3, f4, f5);

    inc_double (&f1, 1.011);
    inc_double (&f3, 3.033);
    inc_double (&f5, 5.055);

    printf ("indirect_double end: f1=%.4f f2=%.4f f3=%.4f f4=%.4f f5=%.4f\n", 
	    f1, f2, f3, f4, f5);
}

char return_char (char value)
{
    return (value + 1);
}

short return_short (short value)
{
    return (value + 2);
}

int return_int (int value)
{
    return (value + 3);
}

long return_long (long value)
{
    return (value + 400);
}

float return_float (float value)
{
    return (value + 5.5);
}

double return_double (double value)
{
    return (value + 6.06);
}

char *return_char_ptr ()
{
    static char value='7';
    return (&value);
}

short *return_short_ptr ()
{
    static short value=71;
    return (&value);
}

int *return_int_ptr ()
{
    static int value=77;
    return (&value);
}

long *return_long_ptr ()
{
    static long value=777;
    return (&value);
}

float *return_float_ptr ()
{
    static float value=-7.707;
    return (&value);
}

double *return_double_ptr ()
{
    static double value=-77.07;
    return (&value);
}


void (*return_printf5_ptr(int value))(char *, float, float, float, float, 
				      float)
{
    printf ("In return_printf5_ptr: value = %i\n", value);
    return (printf5);
}

void (*indirect_printf5)(char *, float, float, float, float, float) = printf5;
void (*indirect_printd5)(char *,double,double,double,double,double) = printd5;
void (*(*indirect_indirect_printf5)(int))(char *, float, float, float, float, float) = return_printf5_ptr;
char (*indirect_return_char)(char) = return_char;
short (*indirect_return_short)(short) = return_short;
int (*indirect_return_int)(int) = return_int;
long (*indirect_return_long)(long) = return_long;
float (*indirect_return_float)(float) = return_float;
double (*indirect_return_double)(double) = return_double;

Struct1 return_Struct1 ()
{
    Struct1 S1;

    S1.c = 'm';
    S1.f = 7.7;

    printf ("Returning from return_Struct1()\n");
    
    return (S1);
}

Struct2 return_Struct2 ()
{
    Struct2 S2;

    S2.d = 12.12;
    S2.c = 'n';
    S2.f = 8.8;
    
    return (S2);
}


Struct3 return_Struct3 ()
{
    Struct3 S3;

    S3.s1.c = 'o';
    S3.s2.f = 73.313;
    S3.s3.d = 74.14;
    S3.i = 75;
    
    return (S3);
}

Struct4 gstruct4;

Struct4 copy_Struct4 (Struct4 S4)
{
    gstruct4 = S4;

    return (gstruct4);
}

Int_Array gint_array1;
Int_Array gint_array2;

/* C does not allow array types to be returned */
Int_Array_Ptr return_Int_Array_Ptr()
{
    gint_array1[10]=1010;
    gint_array1[50]=5050;

    return (&gint_array1);
}

Int_Array_Ptr return_Int_Array_Ptr2(Int_Array ia)
{
    int i;

    for (i=0; i < 64; i++)
    {
	gint_array2[i] = ia[i] + 1;
    }

    return (&gint_array2);
}

void inc_Int_Array_Ptr (Int_Array_Ptr ia_ptr, int value)
{
    int i;

    for (i=0; i < 64; i++)
    {
	(*ia_ptr)[i] = ia_ptr[0][i] + value;
    }
}

void inc_Int_Array_Ptr_Ptr (Int_Array_Ptr_Ptr ia_ptr_ptr, int value)
{
    int i;

    for (i=0; i < 64; i++)
    {
	(**ia_ptr_ptr)[i] = ia_ptr_ptr[0][0][i] + value;
    }
}

Int_Matrix gint_matrix1;
Int_Matrix gint_matrix2;

/* C does not allow array types to be returned */
Int_Matrix_Ptr return_Int_Matrix_Ptr()
{
    gint_matrix1[3][5]=-1010;
    gint_matrix1[4][9]=-5050;

    return (&gint_matrix1);
}

Int_Matrix_Ptr return_Int_Matrix_Ptr2(Int_Matrix im)
{
    int i, j;

    for (i=0; i < 10; i++)
    {
	for (j=0; j < 10; j++)
	{
	    gint_matrix2[i][j] = im[i][j] + 1;
	}
    }

    return (&gint_matrix2);
}

void inc_Int_Matrix_Ptr (Int_Matrix_Ptr im_ptr, int value)
{
    int i, j;

    for (i=0; i < 10; i++)
    {
	for (j=0; j < 10; j++)
	{
	    (*im_ptr)[i][j] = im_ptr[0][i][j] + value;
	}
    }
}

void inc_Int_Matrix_Ptr_Ptr (Int_Matrix_Ptr_Ptr im_ptr_ptr, int value)
{
    int i, j;

    for (i=0; i < 10; i++)
    {
	for (j=0; j < 10; j++)
	{
	    (**im_ptr_ptr)[i][j] = im_ptr_ptr[0][0][i][j] + value;
	}
    }
}


main()
{
    Struct1 S1, S11;
    Struct2 S2, S22;
    Struct3 S3, S33, *S3p;
    Struct4 S4, S44;
    char char1, *char_ptr;
    short short1, *short_ptr;
    int int1, *int_ptr;
    long long1, *long_ptr;
    float float1, *float_ptr;
    double double1, *double_ptr;
    void (*indirect_printf52)(char *, float, float, float, float, float);
    Int_Array ia1;
    Int_Array_Ptr iap1, iap2;
    Int_Matrix im1;
    Int_Matrix_Ptr imp1, imp2;
    char  cb, cd, ce;
    short short11, short22;
    long long33, long36;

    short11 = 11;
    short22 = 22;
    cb = 'b';
    cd = 'd';
    ce = 'e';
    long33=33;
    long36=36;
    


    printf ("3+1: '%s' '%s' '%s'\n", "parm2", "parm3", "parm4");
    printf ("4+1: '%s' '%s' '%s' '%s'\n", "parm2", "parm3", "parm4", "parm5");
    printf ("5+1: '%s' '%s' '%s' '%s' '%s'\n", "parm2", "parm3", "parm4", 
	    "parm5", "parm6");
    printca5 ("5+1: '%s' '%s' '%s' '%s' '%s'\n", "parm2", "parm3", "parm4", 
	    "parm5", "parm6");
    printc5 ("5+1: '%c' '%c' '%c' '%c' '%c'\n", 'a', 'b', 'c', 
	    'd', 'c');
    printc5 ("5+1+: '%c' '%c' '%c' '%c' '%c'\n", 'a', cb, 'c', 
	    cd, ce);
    prints5 ("5+1: '%i' '%i' '%i' '%i' '%i'\n", 12, 13, 14, 15, 16);
    prints5 ("5+1+: '%i' '%i' '%i' '%i' '%i'\n", long36, (short)13, ce, 
	     short11, -short22);
    prints5_2 ("5+1: '%i' '%i' '%i' '%i' '%i'\n", -12, (short)-13, -ce, 
	       -short11, short22);
    printi5 ("5+1: '%i' '%i' '%i' '%i' '%i'\n", 22, 23, 24, 25, 26);
    printi5 ("5+1+: '%i' '%i' '%i' '%i' '%i'\n", 22, cb, short22, 25, long33);
    printl5 ("5+1: '%i' '%i' '%i' '%i' '%i'\n", 32, 33, 34, 35, 36);
    printl5 ("5+1+: '%i' '%i' '%i' '%i' '%i'\n", 32, long33, short11, cb, 
	     long36);
    printf5 ("5+1: '%f' '%f' '%f' '%f' '%f'\n", 2.1, 3.2, 4.3, 5.3, 6.4);
    printf5 ("5+1+: '%f' '%f' '%f' '%f' '%f'\n", ce, long36, 4.3, cb, short22);
    printd5 ("5+1: '%f' '%f' '%f' '%f' '%f'\n", 2.12, 3.23, 4.34, 5.35, 6.46);
    printd5 ("5+1+: '%f' '%f' '%f' '%f' '%f'\n", 2.12, cb, long33, short11, 
	     short22);

    printf ("8+1: '%s' '%s' '%s' '%s' '%s' '%s' '%s' '%s'\n", 
	    "parm2", "parm3", "parm4", "parm5",
	    "parm6", "parm7", "parm8", "parm9");
    printf ("10+1: '%s' '%s' '%s' '%s' '%s' '%s' '%s' '%s'\n"
	    "      '%s' '%s'\n", 
	    "parm2", "parm3", "parm4", "parm5",
	    "parm6", "parm7", "parm8", "parm9", "parm10", "parm11");
    printf ("20+1: '%s' '%s' '%s' '%s' '%s' '%s' '%s' '%s'\n"
	    "      '%s' '%s' '%s' '%s' '%s' '%s' '%s' '%s'\n"
	    "      '%s' '%s' '%s' '%s'\n",
	    "parm2", "parm3", "parm4", "parm5",
	    "parm6", "parm7", "parm8", "parm9", "parm10",
	    "parm11", "parm12", "parm13", "parm14", "parm15",
	    "parm16", "parm17", "parm18", "parm19", "parm20",
	    "parm21");

    printf ("10f+1: '%.2f' '%.2f' '%.2f' '%.2f' '%.2f' '%.2f'\n"
	    "       '%.2f' '%.2f' '%.2f' '%.2f'\n", 
	    0.2, 0.3, 0.4, 0.5,
	    0.6, 0.7, 0.8, 0.9, 0.10, 0.11);

    S1.c = 'a';
    S1.f = 1.1;

    printf ("Struct1 orig: c = '%c' f = '%.4f'\n", S1.c, S1.f);
    
    inc_struct1 (&S1);
    printf ("Struct1 inc1: c = '%c' f = '%.4f'\n", S1.c, S1.f);

    inc_struct2 (S1);
    printf ("Struct1 inc2: c = '%c' f = '%.4f'\n", S1.c, S1.f);

    inc_struct3 (S1, S1, S1, S1, S1);
    printf ("Struct1 inc3: c = '%c' f = '%.4f'\n", S1.c, S1.f);

    /* These "useless" tests are meant to break up to code into basic blocks */
    if (S1.c == 'z')
    {
	printf ("S1.c == 'z'!\n");
    }

    S2.d = 2.12;
    S2.c = 'a';
    S2.f = 1.1;

    inc_struct4 (S2, S2, S2, S2, S2);
    printf ("Struct2 inc4: d = '%f' c = '%c' f = '%f'\n", S2.d, S2.c, S2.f);


    S3.s1.c = 'f';
    S3.s2.f = 3.313;
    S3.s3.d = 4.14;
    S3.i = 5;
    inc_struct5 (S3);
    printf ("Struct3 inc5: s1.c = '%c' s2.f = '%f' s3.d = '%f' i=%i\n",
	    S3.s1.c, S3.s2.f, S3.s3.d, S3.i);

    S3p = inc_struct6 (&S3);
    printf ("Struct3 inc6: s1.c = '%c' s2.f = '%f' s3.d = '%f' i=%i\n",
	    S3p->s1.c, S3p->s2.f, S3p->s3.d, S3p->i);


    S4.int_array[1] = 0;
    S4.int_array[3] = -30;
    S4.int_array[7] = -70;
    S4.int_array[13] = -130;
    S4.int_array[17] = -170;

    S44 = copy_Struct4 (S4);

    printf ("copy_Struct4: [1]=%i [3]=%i [7]=%i [13]=%i [17]=%i\n",
	    S44.int_array[1], S44.int_array[3], S44.int_array[7], 
	     S44.int_array[13], S44.int_array[17]); 
    
    /* These "useless" tests are meant to break up to code into basic blocks */
    if (S3.s1.c == 'z')
    {
	printf ("S3.s1.c == 'z'!\n");
    }


    indirect_int (10, 20, 30, 40, 50);
    indirect_float (10.10, 20.20, 30.30, 40.40, 50.50);
    indirect_double (10.1010, 20.2020, 30.3030, 40.4040, 50.5050);

    char1 = return_char ('x');
    short1 = return_short (1000);
    int1 = return_int (10000);
    long1 = return_long (100000);
    float1 = return_float (3.1415);
    double1 = return_double (2.1212);

    printf ("Return_(type): char='%c' short=%i int=%i long=%i float=%f double=%f\n",
	    char1, short1, int1, long1, float1, double1);

    /* These "useless" tests are meant to break up to code into basic blocks */
    if (char1 == 'z')
    {
	printf ("char1 == 'z'!\n");
    }

    char_ptr = return_char_ptr ();
    char1 = *char_ptr;

    short_ptr = return_short_ptr ();
    short1 = *short_ptr;

    int_ptr = return_int_ptr ();
    int1 = *int_ptr;

    long_ptr = return_long_ptr ();
    long1 = *long_ptr;

    float_ptr = return_float_ptr ();
    float1 = *float_ptr;

    double_ptr = return_double_ptr ();
    double1 = *double_ptr;

    printf ("Return_(type)_ptr: char='%c' short=%i int=%i long=%i\n"
	    "                   float=%f double=%f\n",
	    char1, short1, int1, long1, float1, double1);

    /* These "useless" tests are meant to break up to code into basic blocks */
    if (char1 == 'z')
    {
	printf ("char1 == 'z'!\n");
    }

    /* Make sure floats are passed as floats and not doubles (which will
     * give incorrect results).
     */
    printf ("Indirect->");
    indirect_printf5 ("5+1: '%.3f' '%.3f' '%.3f' '%.3f' '%.3f'\n", 
		      -52.1, 53.2, -54.3, 55.3, -56.4);

    printf ("Indirect->");
    indirect_printd5 ("5+1: '%.4f' '%.4f' '%.4f' '%.4f' '%.4f'\n", 
	     62.12, -63.23, 64.34, -65.35, 66.46);

    indirect_printf52 = indirect_indirect_printf5(101);
    printf ("Indirect2->");
    indirect_printf52 ("5+1: '%.4f' '%.4f' '%.4f' '%.4f' '%.4f'\n", 
		      502.1, -503.2, 504.3, -505.3, 506.4);

    char1 = indirect_return_char ('q');
    short1 = indirect_return_short (2000);
    int1 = indirect_return_int (20000);
    long1 = indirect_return_long (300000);
    float1 = indirect_return_float (23.1415);
    double1 = indirect_return_double (22.1212);

    printf ("indirect_return_(type): char='%c' short=%i int=%i long=%i\n"
	    "                        float=%f double=%f\n",
	    char1, short1, int1, long1, float1, double1);

    /* These "useless" tests are meant to break up to code into basic blocks */
    if (char1 == 'z')
    {
	printf ("indirect char1 == 'z'!\n");
    }

    S11 = return_Struct1();
    printf ("return_Struct1: c = '%c' f = '%.4f'\n", 
	    S11.c, S11.f);

    S22 = return_Struct2();
    printf ("return_Struct2: d = '%.4f' c = '%c' f = '%.4f'\n", 
	    S22.d, S22.c, S22.f);

    S33 = return_Struct3();
    printf ("return_Struct3: s1.c = '%c' s2.f = '%.4f' s3.d = '%.4f' i=%i\n",
	    S33.s1.c, S33.s2.f, S33.s3.d, S33.i);

    /* These "useless" tests are meant to break up to code into basic blocks */
    if (S33.s1.c == 'z')
    {
	printf ("S33.s1.c == 'z'!\n");
    }

    iap1 = return_Int_Array_Ptr();
    printf ("return_Int_Array: iap1[5]=%i iap1[10]=%i iap1[50]=%i\n",
	    (*iap1)[5], (*iap1)[10], iap1[0][50]);

    iap2 = return_Int_Array_Ptr2(*iap1);
    printf ("return_Int_Array: iap2[5]=%i iap2[10]=%i iap2[50]=%i\n",
	    (*iap2)[5], (*iap2)[10], iap2[0][50]);

    inc_Int_Array_Ptr (iap1, 3030);
    printf ("inc_Int_Array_Ptr: iap1[5]=%i iap1[10]=%i iap1[50]=%i\n",
	    (*iap1)[5], (*iap1)[10], iap1[0][50]);

    inc_Int_Array_Ptr_Ptr (&iap1, -111);
    printf ("inc_Int_Array_Ptr_Ptr: iap1[5]=%i iap1[10]=%i iap1[50]=%i\n",
	    (*iap1)[5], (*iap1)[10], iap1[0][50]);

    /* These "useless" tests are meant to break up to code into basic blocks */
    if (iap1[0][50] == 'z')
    {
	printf ("iap1[0][50] == 'z'!\n");
    }

    imp1 = return_Int_Matrix_Ptr();
    printf ("return_Int_Matrix: imp1[0][6]=%i imp1[3][5]=%i imp1[4][9]=%i\n",
	    (*imp1)[0][6], (*imp1)[3][5], imp1[0][4][9]);

    imp2 = return_Int_Matrix_Ptr2(*imp1);
    printf ("return_Int_Matrix: imp2[0][6]=%i imp2[3][5]=%i imp2[4][9]=%i\n",
	    (*imp2)[0][6], (*imp2)[3][5], imp2[0][4][9]);

    inc_Int_Matrix_Ptr (imp1, 6060);
    printf ("inc_Int_Matrix_Ptr: imp1[0][6]=%i imp1[3][5]=%i imp1[4][9]=%i\n",
	    (*imp1)[0][6], (*imp1)[3][5], imp1[0][4][9]);

    inc_Int_Matrix_Ptr_Ptr (&imp1, -777);
    printf ("inc_Int_Matrix_Ptr_Ptr: imp1[0][6]=%i imp1[3][5]=%i imp1[4][9]=%i\n",
	    (*imp1)[0][6], (*imp1)[3][5], imp1[0][4][9]);

    return (0);
}
