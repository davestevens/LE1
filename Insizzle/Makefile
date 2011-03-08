# Makefile for InsizzleV3

# use -DVTHREADS in CFLAGS for running code with vthreads

CC = gcc
CFLAGS = -c -Wall -pedantic -std=c99 -Wextra -m32 -g `xml2-config --cflags` -DVTHREAD
LDFLAGS = -lm -m32 `xml2-config --libs`

INCDIR = inc
SRCDIR = src
OBJDIR = obj

SRC = $(wildcard $(SRCDIR)/*.c)
OBJ = $(SRC:$(SRCDIR)/%.c=$(OBJDIR)/%.o)

TARGET = INSIZZLE
TARGETV = VAJAZZLE

Vajazzle:	CFLAGS += -DVAJAZZLE

all: $(SRC) $(TARGET)

Vajazzle: $(SRC) $(TARGETV)

$(TARGET): $(OBJ)
	   $(CC) $(OBJ) $(LDFLAGS) -o $@

$(TARGETV): $(OBJ)
	ar cr $(TARGETV) $(OBJ)

$(OBJDIR)/%.o: $(SRCDIR)/%.c
	$(CC) $(CFLAGS) $< -o $@ -I$(INCDIR)/

clean:
		rm -rf $(OBJ) $(TARGET) $(TARGETV)

distclean:
		rm -f *~ \#* $(OBJDIR)/*.o $(SRCDIR)/*~ $(TARGET) $(TARGETV)
