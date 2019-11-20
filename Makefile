CC = gcc
CFLAGS = -ggdb -O2 -Wall -Wextra
LDFLAGS = -O2
INCFLAGS =
LIBS = -lcrypt

HEADERFILES = structs.h utils.h comm.h interpreter.h db.h fcns.h
OBJECTS = comm.o act.comm.o act.informative.o act.movement.o act.obj1.o act.obj2.o act.offensive.o act.other.o act.social.o act.wizard.o handler.o db.o interpreter.o utility.o spec_assign.o shop.o limits.o mobact.o fight.o modify.o weather.o spell_parser.o spells1.o spells2.o reception.o constants.o spec_procs.o signals.o board.o mar_fiz_maz.o magic.o changes.o

all: dmserver

$(OBJECTS): $(HEADERFILES)

dmserver: $(OBJECTS)
	$(CC) $(LDFLAGS) -o dmserver $(OBJECTS) $(LIBS)

.c.o:
	$(CC) -o $@ -c $(CFLAGS) $< $(INCFLAGS)

clean:
	rm -f dmserver *.o

.PHONY: all
.PHONY: clean
