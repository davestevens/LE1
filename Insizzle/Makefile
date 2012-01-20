
# Makefile for InsizzleV3

# CFLAGS extra options
# -DVTHREAD - for running code with vthreads
# -DPRINTOUT - print all instructions executed
# -DDEBUG - print lots of information about everything
# -DDEBUGmem - print information about memory accesses
# -DNOSTALLS - count stall events but don't execute them

CC = gcc
CFLAGS = -c -Wall -pedantic -std=c99 -Wextra -m32 `xml2-config --cflags` -g -D_XOPEN_SOURCE
LDFLAGS = -lm -m32 `xml2-config --libs`

INCDIR = inc
SRCDIR = src
OBJDIR = obj

SRC = $(wildcard $(SRCDIR)/*.c)
OBJ = $(SRC:$(SRCDIR)/%.c=$(OBJDIR)/%.o)

TARGET = INSIZZLE
TARGETAPI = INSIZZLEAPI

REV_PERL = `perl scripts/revision.pl ${TARGET} ${TARGET}`

API:		CFLAGS += -DAPI
DEBUG:		CFLAGS += -DDEBUG -DPRINTOUT
NOSTALLS:	CFLAGS += -DNOSTALLS
VTHREAD:	CFLAGS += -DVTHREAD

all: $(SRC) $(TARGET)

API:	$(SRC) $(TARGETAPI)
DEBUG:	$(SRC) $(TARGET)
NOSTALLS: $(SRC) $(TARGET)
VTHREAD: $(SRC) $(TARGET)

$(TARGET): $(OBJ)
	   $(CC) $(OBJ) $(LDFLAGS) -o $@
	@echo "Versioning"
	@echo ${REV_PERL}

$(TARGETAPI): $(OBJ)
	ar cr $(TARGETAPI) $(OBJ)

$(OBJDIR)/%.o: $(SRCDIR)/%.c
	$(CC) $(CFLAGS) $< -o $@ -I$(INCDIR)/ $(VTAPI)

clean:
		rm -f $(OBJ) $(TARGET) $(TARGETAPI)

distclean:
		rm -f *~ \#* $(OBJDIR)/*.o $(SRCDIR)/*~ $(INCDIR)/*~ $(TARGET) $(TARGETAPI)
