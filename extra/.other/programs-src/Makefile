CC=gcc
CFLAGS=-Wall -O2 -march=x86-64 -mtune=generic -pipe
PREFIX=/usr/local

SOURCES = $(wildcard *.c)
EXECS = $(SOURCES:%.c=%)

all: $(EXECS)

install:
	install -Dm755 $(EXECS) -t $(DESTDIR)/$(PREFIX)/bin
	cd $(DESTDIR)/$(PREFIX)/bin && strip -s $(EXECS)

clean:
	rm -vf $(EXECS)

uninstall:
	cd $(DESTDIR)/$(PREFIX)/bin && rm -vf $(EXECS)
