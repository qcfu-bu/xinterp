######
#
# For building pprint
#
######

AR=ar
MV=mv
CP=cp
CC=gcc
SED=sed
MVF=mv -f
RMF=rm -f

######

MAKE=make

######

PATSCC=$(PATSHOME)/bin/patscc
PATSOPT=$(PATSHOME)/bin/patsopt

######
#
CFLAGS=
#
# CFLAGS=-g
# CFLAGS=-g -O
# CFLAGS=-g -O2
#
CFLAGS+=-D_GNU_SOURCE
#
GCFLAG=
GCFLAG=-DATS_MEMALLOC_LIBC
GCFLAG=-DATS_MEMALLOC_GCBDW
#
LIBGC=
LIBGC=-lgc
#
######

SRCSATS := \
pprint.sats \

SRCDATS := \
pprint_basic.dats \

######

OBJSATS := \
$(patsubst %.sats, BUILD/%_sats.o, $(SRCSATS))
OBJDATS := \
$(patsubst %.dats, BUILD/%_dats.o, $(SRCDATS))

######

INCLUDE:=
INCLUDE+=-I"."
INCLUDE+=-I"./../../xanadu/srcgen/xats"
LIBRARY:=-L"./../../xanadu/lib" -lxatsopt

######
#
all:: \
pprint
pprint: \
DATS/test.dats \
$(OBJSATS) $(OBJDATS) ; \
$(PATSCC) -cleanaft -o ./bin/pprint \
$(INCLUDE) $(CFLAGS) $(GCFLAG) $^ $(LIBGC) $(LIBRARY)
#
######

libxatsopt: ; \
(cd ./../../xanadu/srcgen/xats && $(MAKE) libxatsopt)

libpprint: \
$(OBJSATS) $(OBJDATS) \
BUILD/libpprint_dats.o ; \
($(AR) -r $@.a $^ && $(MVF) $@.a ./lib)
BUILD/libpprint_dats.o: \
DATS/pprint.dats; $(PATSCC) $(INCLUDE) $(CFLAGS) $(GCFLAG) $(LIBGC) $(LIBRARY) \
-DATS _LIBPPRINT_ -o $@ -c $<

######

BUILD/%_sats.c: \
./SATS/%.sats ; $(PATSOPT) -o $@ --static $<
BUILD/%_dats.c: \
./DATS/%.dats ; $(PATSOPT) -o $@ --dynamic $<

######

BUILD/%_sats.o: \
BUILD/%_sats.c; \
$(PATSCC) $(INCLUDE) $(CFLAGS) -o $@ -c $<
BUILD/%_dats.o: \
BUILD/%_dats.c; \
$(PATSCC) $(INCLUDE) $(CFLAGS) $(GCFLAG) -o $@ -c $<

######
#
# HX-2018-10-07:
# '--output-a .depend' means
# appending instead of overwriting
#
SATS_SRCSATS := \
$(patsubst %.sats, SATS/%.sats, $(SRCSATS))
DATS_SRCDATS := \
$(patsubst %.dats, DATS/%.dats, $(SRCDATS))
#
depend:: ; $(RMF) .depend
#
depend:: ; \
$(PATSOPT) --output-a .depend --depgen -s $(SATS_SRCSATS)
depend:: ; \
$(PATSOPT) --output-a .depend --depgen -d $(DATS_SRCDATS)
depend:: ; \
$(PATSOPT) --output-a .depend --depgen -d DATS/pprint.dats
#
depend:: ; \
$(SED) -i -e 's/^SATS/BUILD/' -e 's/^DATS/BUILD/' .depend
#
-include .depend
#
######

clean:: ; $(RMF) BUILD/*_?ats.c
clean:: ; $(RMF) BUILD/*_?ats.o
clean:: ; $(RMF) pprint_dats.o
clean:: ; $(RMF) pprint_dats.c

######

cleanall:: clean
cleanall:: ; $(RMF) ./bin/pprint
cleanall:: ; $(RMF) ./xanadu/lib/libxatsopt.a
cleanall:: ; $(MAKE) -C ./xanadu/srcgen/xats cleanall

######

###### end of [Makefile] ######
