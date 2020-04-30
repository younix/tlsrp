/* See LICENSE file for copyright and license details. */
#ifndef UTIL_H
#define UTIL_H

#include <regex.h>
#include <stddef.h>
#include <time.h>

#undef MIN
#define MIN(x,y)  ((x) < (y) ? (x) : (y))
#undef MAX
#define MAX(x,y)  ((x) > (y) ? (x) : (y))
#undef LEN
#define LEN(x) (sizeof (x) / sizeof *(x))

extern char *argv0;

void warn(const char *, ...);
void die(const char *, ...);

void epledge(const char *, const char *);
void eunveil(const char *, const char *);

#define TIMESTAMP_LEN 30

char *timestamp(time_t, char buf[TIMESTAMP_LEN]);
int esnprintf(char *, size_t, const char *, ...);

void *reallocarray(void *, size_t, size_t);
long long strtonum(const char *, long long, long long, const char **);

#endif /* UTIL_H */
