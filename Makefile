LIBTLS_PKGCONF_PATH = /usr/lib/libressl/pkgconfig/

FLAGS = `PKG_CONFIG_PATH=$(LIBTLS_PKGCONF_PATH) pkg-config --cflags --libs libtls`

CC = cc

SRC = tlsrp.c util.c
BIN = tlsrp

all: config.h tlsrp

config.h:
	cp config.def.h $@

tlsrp:
	$(CC) $(SRC) -o $(BIN) $(FLAGS)

clean:
	rm -f $(BIN)

run:
	LD_LIBRARY_PATH=/usr/lib/libressl ./$(BIN) -U "/tmp/conn.socket" -f 443 -a "/home/nihal/projects/libtls/CA/root.pem" -r "/home/nihal/projects/libtls/CA/server.crt" -k "/home/nihal/projects/libtls/CA/server.key"
