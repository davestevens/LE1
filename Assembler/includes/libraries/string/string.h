/* string library */

#ifdef DEBUG
/*#define NULL '\0'*/
#define size_t unsigned
#endif

#ifdef __vex
#define size_t unsigned
#endif

#ifdef DEBUG
void my_bcopy(const void *, void *, size_t);
void *my_memcpy(void *, void *, size_t);
int my_memcmp(void *, void *, size_t);
char *my_strcpy(char *, char *);
char *my_strncpy(char *, char *, size_t);
int my_strcmp(char *, char *);
int my_strncmp(char *, char *, size_t);
char *my_strcat(char *, char*);
char *my_strncat(char *, char*, size_t);
size_t my_strlen(char *);
void *my_memmove(void *, void *, size_t);
void *my_memchr(void *, int, size_t);
void *my_memset(void *, int, size_t);
char *my_strchr(char *, int);
char *my_strrchr(char *, int);
int my_strcoll(char *, char *);
char *my_strerror(int);
size_t my_strspn(char *, char*);
size_t my_strcspn(char *, char*);
int my_strcasecmp(char *, char *);
int my_strncasecmp(char *, char *, size_t);
#else
void _bcopy(const void *, void *, size_t);
void *memcpy(void *, void *, size_t);
int memcmp(void *, void *, size_t);
char *strcpy(char *, char *);
char *strncpy(char *, char *, size_t);
int strcmp(char *, char *);
int strncmp(char *, char *, size_t);
char *strcat(char *, char*);
char *strncat(char *, char*, size_t);
size_t strlen(char *);
void *memmove(void *, void *, size_t);
void *memchr(void *, int, size_t);
void *memset(void *, int, size_t);
char *strchr(char *, int);
char *strrchr(char *, int);
int strcoll(char *, char *);
char *strerror(int);
size_t strspn(char *, char*);
size_t strcspn(char *, char*);
int strcasecmp(char *, char *);
int strncasecmp(char *, char *, size_t);
#endif
