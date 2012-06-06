#ifndef __CONFIG_TYPES_H__
#define __CONFIG_TYPES_H__

#include "mm.h"
#include "lib.h"

/* make it easy on the folks that want to compile the libs with a
   different malloc than stdlib */
#define _ogg_malloc  (void *)mm_malloc
#define _ogg_calloc  (void *)mm_calloc
#define _ogg_realloc (void *)mm_realloc
#define _ogg_free    mm_free

/*#    include <stdint.h>*/

/* these are filled in by configure */
typedef short int ogg_int16_t;
typedef unsigned short int ogg_uint16_t;
typedef int ogg_int32_t;
typedef unsigned int ogg_uint32_t;
typedef long int ogg_int64_t;

#endif
