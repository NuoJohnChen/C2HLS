KERN=aes_tableless
ALG=aes_tableless

CFLAGS?=-O3 -Wall -Wno-unused-label

SRCS=$(KERN)_fast.c local_support.c ../common/support.c
FILES=$(SRCS) $(KERN).h ../common/support.h

$(KERN): $(FILES) ../common/harness.c
	$(CC) $(CFLAGS) -I../common -o $(KERN) $(SRCS) ../common/harness.c

run: $(KERN) input.data check.data
	./$(KERN) input.data check.data

generate: $(FILES) generate.c
	$(CC) $(CFLAGS) -I../common -o generate $(SRCS) generate.c
	./generate

hls: $(KERN).c $(KERN).h
	vivado_hls hls.tcl

clean:
	rm -f $(KERN) generate output.data
