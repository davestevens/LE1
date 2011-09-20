
# Makefile for InsizzleV3

# use -DVTHREADS in CFLAGS for running code with vthreads

CC = gcc
CFLAGS = -c -Wall -pedantic -std=c99 -Wextra -m32 `xml2-config --cflags` -g -D_XOPEN_SOURCE
LDFLAGS = -lm -m32 `xml2-config --libs`

INCDIR = inc
SRCDIR = src
OBJDIR = obj

SRC = $(wildcard $(SRCDIR)/*.c)
OBJ = $(SRC:$(SRCDIR)/%.c=$(OBJDIR)/%.o)

TARGET = INSIZZLE
TARGETV = VAJAZZLE
TARGETAPI = INSIZZLEAPI

REV_PERL = `perl scripts/revision.pl ${TARGET} ${TARGET}`

Vajazzle:	CFLAGS += -DVAJAZZLE
API:		CFLAGS += -DAPI

all: $(SRC) $(TARGET)

Vajazzle: $(SRC) $(TARGETV)

API:	$(SRC) $(TARGETAPI)

$(TARGET): $(OBJ)
	   $(CC) $(OBJ) $(LDFLAGS) -o $@
	@echo "Versioning"
	@echo ${REV_PERL}

$(TARGETV): $(OBJ)
	ar cr $(TARGETV) $(OBJ)

$(TARGETAPI): $(OBJ)
	ar cr $(TARGETAPI) $(OBJ)

$(OBJDIR)/%.o: $(SRCDIR)/%.c
	$(CC) $(CFLAGS) $< -o $@ -I$(INCDIR)/ $(VTAPI)

clean:
		rm -f $(OBJ) $(TARGET) $(TARGETV) $(TARGETAPI)

distclean:
		rm -f *~ \#* $(OBJDIR)/*.o $(SRCDIR)/*~ $(INCDIR)/*~ $(TARGET) $(TARGETV) $(TARGETAPI)
