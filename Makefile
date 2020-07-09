.include "config.mk"

all: tlsrp

config.h:
	cp config.def.h $@

tlsrp: $(SRC) config.h
	$(CC) $(CFLAGS) $(SRC) -o $@ $(FLAGS)

clean:
	rm -f tlsrp

test: tlsrp
	LD_LIBRARY_PATH=/usr/lib/libressl ./tlsrp -U "/tmp/conn.socket" -f 443 -a "CA/root.pem" -r "CA/server.crt" -k "CA/server.key"
