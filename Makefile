LIBTLS_PKGCONF_PATH = /usr/lib/libressl/pkgconfig/

FLAGS = $(shell PKG_CONFIG_PATH=$(LIBTLS_PKGCONF_PATH) pkg-config --cflags --libs libtls)

CC = cc

SRC = tlsrp.c util.c
OBJ = tlsrp

all: config.h tlsrp

config.h:
	cp config.def.h $@

tlsrp:
	$(CC) $(SRC) -o $(OBJ) $(FLAGS)

clean:
	rm $(OBJ)

run:
	LD_LIBRARY_PATH=/usr/lib/libressl ./$(OBJ) -U "/tmp/conn.socket" -f 443 -a "/home/nihal/projects/libtls/CA/root.pem" -r "/home/nihal/projects/libtls/CA/server.crt" -k "/home/nihal/projects/libtls/CA/server.key"
