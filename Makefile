# Generated automatically from Makefile.in by configure.
SHELL= /bin/sh

srcdir= .

CC= cc
INSTALL= /usr/bin/install -c
LN= @LN_S@

prefix= /arbornet
exec_prefix= ${prefix}
bindir= ${exec_prefix}/bin
mandir= ${prefix}/man
datadir= ${prefix}/share

CPPFLAGS= 
CFLAGS= -g -O2
LDFLAGS= 
LIBS= -ltermcap 

OBJS=main.o line.o syst.o util.o cmd.o file.o opt.o subs.o term.o proc.o spel.o
SRCS=main.c line.c syst.c util.c cmd.c file.c opt.c subs.c term.c proc.c spel.c

DIST= README $(SRCS) gate.h gate.1.C gate.help CHANGES

gate: $(OBJS)
	$(CC) -o gate $(CFLAGS) $(OBJS) $(LIBS)

main.o: main.c gate.h config.h
util.o: util.c gate.h config.h
syst.o: syst.c gate.h config.h
line.o: line.c gate.h config.h
file.o: file.c gate.h config.h
subs.o: subs.c gate.h config.h
opt.o:  opt.c  gate.h config.h
cmd.o:  cmd.c  gate.h config.h
term.o: term.c gate.h config.h
proc.o: proc.c gate.h config.h
spel.o: spel.c gate.h config.h

gate.1: gate.1.C
	$(CC) -Uunix -E $(CFLAGS) gate.1.C | sed -e '/^$$/d' | sed -e '/^#/d' > gate.1


install: gate gate.1
	install -d $(bindir)
	install -d $(datadir)
	install -d $(mandir)/man1
	$(INSTALL) -m 755 gate $(bindir)
	$(INSTALL) -m 644 gate.help $(datadir)
	$(INSTALL) -m 644 gate.1 $(mandir)/man1

clean:
	rm -f $(OBJS) gate
