.include "config.mk"

all: tlsrp

config.h:
	cp config.def.h $@

tlsrp: $(SRC) config.h
	$(CC) $(SRC) -o $(BIN) $(FLAGS)

clean:
	rm -f $(BIN)

test: $(BIN)
	LD_LIBRARY_PATH=/usr/lib/libressl ./$(BIN) -U "/tmp/conn.socket" -f 443 -a "CA/root.pem" -r "CA/server.crt" -k "CA/server.key"
