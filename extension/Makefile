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

SRCSATS :=

SRCDATS :=

######

OBJSATS := \
$(patsubst %.sats, BUILD/%_sats.o, $(SRCSATS))
OBJDATS := \
$(patsubst %.dats, BUILD/%_dats.o, $(SRCDATS))

######

INCLUDE:=
INCLUDE+=-I"."
INCLUDE+=-I"./../xanadu/srcgen/xats"
LIBRARY:=-L"./../xanadu/lib" -lxatsopt

######
#
all:: \
libpprint
#
######

libpprint: ; \
(cd ./pprint && $(MAKE) libpprint)

######

clean:: ; (cd ./pprint && $(MAKE) clean)

######

cleanall:: clean
cleanall:: ; (cd ./pprint && $(MAKE) cleanall)

######

###### end of [Makefile] ######
