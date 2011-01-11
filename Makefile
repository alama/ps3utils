CC = gcc

CFLAGS += -Wall -Wextra \
         -Wundef \
         -Wnested-externs \
         -Wwrite-strings \
         -Wpointer-arith \
         -Wbad-function-cast \
         -Wmissing-declarations \
         -Wmissing-prototypes \
         -Wstrict-prototypes \
         -Wredundant-decls \
         -Wno-unused-parameter \
         -Wno-missing-field-initializers

prefix = $(HOME)

ifeq ($(findstring MINGW, $(shell uname -s)), MINGW)
  MINGW=1
endif

ifdef MINGW
LDLIBS = -lws2_32
endif

BINS = pdb_gen \
       find_syscall \
       pup \
       fix_tar

install: all
	install $(BINS) $(prefix)/bin/

all: $(BINS)

pup: sha1.o pup.o

clean:
	rm -f $(BINS) *~ *.o *.exe
