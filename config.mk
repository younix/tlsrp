CC = cc

LIBTLS_PKGCONF_PATH = /usr/lib/libressl/pkgconfig/
FLAGS = `PKG_CONFIG_PATH=$(LIBTLS_PKGCONF_PATH) pkg-config --cflags --libs libtls`

# OpenBSD
FLAGS = -ltls

SRC = tlsrp.c util.c
BIN = tlsrp
