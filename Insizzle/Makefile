# Makefile for InsizzleV3

# use -DVTHREADS in CFLAGS for running code with vthreads

CC = gcc
CFLAGS = -c -Wall -pedantic -std=c99 -Wextra -m32 -g `xml2-config --cflags`
LDFLAGS = -lm -m32 `xml2-config --libs`

INCDIR = inc
SRCDIR = src
OBJDIR = obj

SRC = $(wildcard $(SRCDIR)/*.c)
OBJ = $(SRC:$(SRCDIR)/%.c=$(OBJDIR)/%.o)

TARGET = INSIZZLE
TARGETV = VAJAZZLE
TARGETAPI = INSIZZLEAPI

Vajazzle:	CFLAGS += -DVAJAZZLE
API:		CFLAGS += -DAPI

all: $(SRC) $(TARGET)

Vajazzle: $(SRC) $(TARGETV)

API:	$(SRC) $(TARGETAPI)

$(TARGET): $(OBJ)
	   $(CC) $(OBJ) $(LDFLAGS) -o $@

$(TARGETV): $(OBJ)
	ar cr $(TARGETV) $(OBJ)

$(TARGETAPI): $(OBJ)
	ar cr $(TARGETAPI) $(OBJ)

$(OBJDIR)/%.o: $(SRCDIR)/%.c
	$(CC) $(CFLAGS) $< -o $@ -I$(INCDIR)/ -I$(VTAPI)

clean:
		rm -f $(OBJ) $(TARGET) $(TARGETV) $(TARGETAPI)

distclean:
		rm -f *~ \#* $(OBJDIR)/*.o $(SRCDIR)/*~ $(INCDIR)/*~ $(TARGET) $(TARGETV) $(TARGETAPI)
