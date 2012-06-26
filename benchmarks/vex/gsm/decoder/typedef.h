/*_____________________
 |                     |
 | Basic types.        |
 |_____________________|
*/

#if defined(__BORLANDC__) || defined(__WATCOMC__) || defined(_MSC_VER) || defined(__ZTC__)
typedef short Word16;
typedef long Word32;
typedef int Flag;

#elif defined(__sun)
typedef short Word16;
typedef long Word32;
typedef int Flag;

#elif defined(__vex)
typedef short Word16;
typedef int Word32;
typedef int Flag;
#pragma restrict 
typedef Word16 r_Word16;
#pragma restrict 
typedef Word32 r_Word32;

#elif defined(__unix__) || defined(__unix)
typedef short Word16;
typedef int Word32;
typedef int Flag;

#endif
