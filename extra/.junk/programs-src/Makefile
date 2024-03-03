CC=gcc
CFLAGS=-Wall -O2 -march=x86-64 -mtune=generic -pipe
PREFIX=/usr/local

SOURCES = $(wildcard *.c)
EXECS = $(SOURCES:%.c=%)

all: $(EXECS)

install:
	install -Dm 755 $(EXECS) -t $(DESTDIR)/$(PREFIX)/bin
	strip -s $(DESTDIR)/$(PREFIX)/bin/$(EXECS)

clean:
	rm -vf $(EXECS)

uninstall:
	rm -vf $(DESTDIR)/$(PREFIX)/bin/$(EXECS)
