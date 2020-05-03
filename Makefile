LIBTLS_PKGCONF_PATH = /usr/lib/libressl/pkgconfig/
LIBTLS_FLAGS = $(shell PKG_CONFIG_PATH=$(LIBTLS_PKGCONF_PATH) pkg-config --cflags --libs libtls)

# link against libbsd for strlcpy on Linux, not necessary on BSD
FLAGS = -lbsd $(LIBTLS_FLAGS)

CC = cc

SRC = tlsrp.c util.c
OBJ = tlsrp

all:
	$(CC) $(SRC) -o $(OBJ) $(FLAGS)

clean:
	rm $(OBJ)

run:
	LD_LIBRARY_PATH=/usr/lib/libressl ./$(OBJ) -U "/tmp/conn.socket" -f 443
