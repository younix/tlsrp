all:
	gcc tlsrp.c util.c -o tlsrp -lbsd

clean:
	rm tlsrp
