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
enum E1{
   V0,
   V1,
   V37=37,
   V50=50,
   V51
};

typedef int iarry[64];
struct S1 {
      int a;
      int *b;
      int *c[10];
      int *d[sizeof(int)][20];
      int (*e)();
      int *(*f)();
      int *(*g[10])();
      int *(*h[10][20])();
      iarry *(*i)();
      int (*(*j[10])())[10];
      struct S1 *k;
      int b1:4;
      int b2:5;
      int b3:6;
      int b4:7;
      enum E1 e1;
      enum E1 *e1_ptr;
} s1;

union U1 {
      int a;
      int *b;
      int *c[10];
      int *d[sizeof(int)][20];
      int (*e)();
      int *(*f)();
      int *(*g[10])();
      int *(*h[10][20])();
      iarry *(*i)();
      int (*(*j[10])())[10];
      int b1;
      int b2;
      int b3;
      int b4;
      struct S1  s1;
      struct S1  *s1_ptr;
      union  U1  *u1_ptr; 
      enum E1 e1;
      enum E1 *e1_ptr;
} u1;

struct S2 {
      char c1;
      double d;
} S2;

struct S3 {
      char c1;
      short d;
} S3;

struct S4 {
      char c1;
      char d;
} S4;

struct S5 {
      int b1:4;
      char d;
} S5;

struct S6 {
    int b1:5;
    int b2:5;
    int b3:20;
    int b4:5;
} s6;

union U6 {
     struct S6  S6;
     unsigned char array[8];
} u6;

char char1;
short short1;
int int1;
long long1;
float float1;
double double1;
char *pointer1;

char char2 = 2;
short short2 = 2;
int int2 = 2;
long long2 = 2;
float float2 = 2;
double double2 = 2;
char *pointer2 = (char *)2;

static char char3 = 3;
static short short3 = 3;
static int int3 = 3;
static long long3 = 3;
static float float3 = 3;
static double double3 = 3;
static char *pointer3 = (char *)3;

unsigned char char4 = 4;
unsigned short short4 = 4;
unsigned int int4 = 4;
unsigned long long4 = 4;
unsigned char *pointer4 = (unsigned char *)4;

char char_array1[10];
short short_array1[10];
int int_array1[10];
long long_array1[10];
float float_array1[10];
double double_array1[10];
char *pointer_array1[10];

char char_array2[20]={2, 2};
short short_array2[20]={2, 2};
int int_array2[20]={2, 2};
long long_array2[20]={2, 2};
float float_array2[20]={2, 2};
double double_array2[20]={2, 2};
char *pointer_array2[20]={(char *)2, (char *)2, (char *)double_array2,
                          "string test", "string_test2"};

char char_array3[] = "test string";

struct st_struct1
{
    char b;
    float f;
    double d;
} struct1[] = {'a', 1.1, 1.2, 'b', 2.1, 2.2};


struct st_struct2
{
    char b;
    float f;
    double d;
} struct2[] = {{'c', 3.1}, {'d', 4.1, 4.2}, {'e'}, 'g', 6.1, 6.2, 'h'};

union union1
{
    char b[100];
    float a;
} union1 = {1};

/* Zero out structure */
void zero_struct (char *ptr, int size)
{
    int i;

    for (i=0; i < size; i++)
        ptr[i] = 0;
}

/* Zero out structure */
void print_bits (char *ptr, int size)
{
    int i, k;

    for (i=0; i < size; i++)
    {
	for (k=0; k < 8; k++)
	{
	    if (((0x80 >>k) & ptr[i]) != 0)
		printf ("1");
	    else
		printf ("0");
	}
	printf (" ");
    }
    printf ("\n");
}

init()
{
    zero_struct ((char *)&s1, sizeof(s1));
    s1.a = 3;
    s1.b = (void *)((int)&s1.d - (int)&s1.a);
    s1.c[5] = s1.b;
    s1.d[1][7] = s1.c[5];
    s1.b1=4;
    s1.b2=5;
    s1.b3=6;
    s1.b4=7;
    s1.e1=V37;
    s1.e1_ptr = 0;

    zero_struct ((char *)&u1, sizeof(u1));
    u1.e1=V50;
    u1.e1_ptr = 0;
    u1.a = 3;
    u1.b = (void *)((int)&u1.a - (int)&u1.d);
    u1.c[5] = u1.b;
    u1.d[1][7] = u1.c[5];
    u1.b1=4;
    u1.b2=5;
    u1.b3=6;
    u1.b4=7;
}
main()
{
    int i;
    init();

    printf ("a=%i b=%08x ", s1.a, s1.b);
    printf ("c=%08x d=%08x\n", s1.c[5], s1.d[1][7]);
    printf ("b1=%i b2=%i ", s1.b1, s1.b2);
    printf ("b3=%i b4=%i\n", s1.b3, s1.b4);
    printf ("e1=%i e1_ptr=%x\n", s1.e1, s1.e1_ptr);

    printf ("a=%i b=%08x ", u1.a, u1.b);
    printf ("c=%08x d=%08x\n", u1.c[5], u1.d[1][7]);
    printf ("b1=%i b2=%i ", u1.b1, u1.b2);
    printf ("b3=%i b4=%i\n", u1.b3, u1.b4);
    printf ("e1=%i e1_ptr=%x\n", u1.e1, u1.e1_ptr);
	    
#if 0
    zero_struct ((char *)&s6, sizeof(s6));

    s6.b1 = -1;
    printf ("s6.b1: ");
    print_bits ((char *)&s6, sizeof(s6));
    zero_struct ((char *)&s6, sizeof(s6));

    s6.b2 = -1;
    printf ("s6.b2: ");
    print_bits ((char *)&s6, sizeof(s6));
    zero_struct ((char *)&s6, sizeof(s6));

    s6.b3 = -1;
    printf ("s6.b3: ");
    print_bits ((char *)&s6, sizeof(s6));
    zero_struct ((char *)&s6, sizeof(s6));

    s6.b4 = -1;
    printf ("s6.b4: ");
    print_bits ((char *)&s6, sizeof(s6));
    zero_struct ((char *)&s6, sizeof(s6));
#endif

    printf ("char2 = %i\n", char2);
    printf ("short2 = %i\n", short2);
    printf ("int2 = %i\n", int2);
    printf ("long2 = %i\n", long2);
    printf ("float2 = %f\n", float2);
    printf ("double2 = %f\n", double2);
    printf ("pointer2 = %x\n", pointer2);

    printf ("unsigned char4 = %i\n", char4);
    printf ("unsigned short4 = %i\n", short4);
    printf ("unsigned int4 = %i\n", int4);
    printf ("unsigned long4 = %i\n", long4);
    printf ("unsigned pointer4 = %x\n", pointer4);


    printf ("char_array2[1] = %i\n", char_array2[1]);
    printf ("short_array2[1] = %i\n", short_array2[1]);
    printf ("int_array2[1] = %i\n", int_array2[1]);
    printf ("long_array2[1] = %i\n", long_array2[1]);
    printf ("float_array2[1] = %f\n", float_array2[1]);
    printf ("double_array2[1] = %f\n", double_array2[1]);
    printf ("pointer_array2[1] = %x\n", pointer_array2[1]);
    printf ("pointer_array2[4] = %s\n", pointer_array2[4]);

    printf ("char_array3 = '%s'\n", char_array3);

    printf ("struct1[1].b = %i\n", struct1[1].b);    
    printf ("struct1[1].f = %f\n", struct1[1].f);
    printf ("struct1[1].d = %f\n", struct1[1].d);


    printf ("struct2[0].b = %i\n", struct2[0].b);    
    printf ("struct2[0].f = %f\n", struct2[0].f);
    printf ("struct2[0].d = %f\n", struct2[0].d);
    printf ("struct2[1].b = %i\n", struct2[1].b);    
    printf ("struct2[1].f = %f\n", struct2[1].f);
    printf ("struct2[1].d = %f\n", struct2[1].d);
    printf ("struct2[2].b = %i\n", struct2[2].b);    
    printf ("struct2[2].f = %f\n", struct2[2].f);
    printf ("struct2[2].d = %f\n", struct2[2].d);

/*    printf ("float2 = %f, 3=%f, 2=%f, 3=%f\n", float2, float3, float2, float3); */
/*    printf ("double2 = %f, 3=%f, 2=%f, 3=%f\n", double2, double3, 
      double2, double3);*/
    
    return (0);
}



