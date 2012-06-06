#define NUM_SUB_RADICALS  3
#define MAX_NUM_RADICALS  4
#define MAX_SIZE_RADICAL  30
#define MAX_SIZE_PARAFFIN 30
#define HEAPSIZE 0x0100000

enum kind_radical { H, C };
typedef enum kind_radical KIND_RADICAL;

enum kind_paraffin { BCP, CCP };
typedef enum kind_paraffin KIND_PARAFFIN;

typedef
  struct radical
    {
      KIND_RADICAL   kind;
      struct radical *sub_radicals[NUM_SUB_RADICALS];
      struct radical *next;
    }
  RADICAL;

typedef
  struct paraffin
    {
      KIND_PARAFFIN   kind;
      RADICAL         *radicals[MAX_NUM_RADICALS];
      struct paraffin *next;
    }
  PARAFFIN;


typedef
  struct tuple
    {
	PARAFFIN     *bcp;
	PARAFFIN     *ccp;
    }
  TUPLE;

typedef
  struct three_parts
    {
      int nc[3];
      struct three_parts *next;
    }
  THREE_PARTS;

typedef
  struct four_parts
    {
      int nc[4];
      struct four_parts *next;
    }
  FOUR_PARTS;

/*
#define U_NEW_STRUCT(name) ((name *)(halloc(sizeof(name))))
*/

#define U_NEW_STRUCT(var,name) \
  { var = (name *)freeptr; \
    freeptr += sizeof(name); }



/* ======================================================================== */
/*
extern int  get_size();
extern void clear_tables(int n);
extern void free_four_partitions(FOUR_PARTS *parts);
extern void free_three_partitions(THREE_PARTS *parts);
extern void print_paraffin_counts(int n);
extern void print_radical_counts(int n);
extern void print_radicals(int n);
*/

void print_paraffin_counts();
void paraffins_until ();
void radical_generator ();
void paraffins_generator ();
void BCP_generator ();
void CCP_generator_with_no_copying ();
void rads_of_size_n_with_no_copying ();
void init_heap();
char *halloc();

