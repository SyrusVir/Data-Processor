CC=gcc
CFLAGS= -g -O -Wall -Wextra
AR = ar
ARFLAGS= -rcs
FIFOOBJ= $(CURDIR)/Generic-FIFO/fifo.o

libdatproc.a: data_processor.o $(FIFOOBJ)
	$(AR) $(ARFLAGS) $@ $^

data_processor.o: data_processor.c data_processor.h
	$(CC) $(CFLAGS) -c $<

%fifo.o:
	$(MAKE) -C $(@D) $(@F)

.PHONY: clean
clean:
	$(MAKE) -C $(dir $(FIFOOBJ)) clean
	rm -f *.o *.a