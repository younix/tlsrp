/* check libtls documentation for possible values */

#include <libressl/tls.h>

int protocols = TLS_PROTOCOLS_DEFAULT;

const char* ciphers = "default";
const char* dheparams = "auto";
const char* ecdhecurves = "default";
