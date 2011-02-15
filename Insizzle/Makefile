# Makefile for InsizzleV3

CC = gcc
CFLAGS = -c -Wall -pedantic -std=c99 -Wextra -m32 -O4 `xml2-config --cflags`
LDFLAGS = -lm -m32 `xml2-config --libs`

INCDIR = inc
SRCDIR = src
OBJDIR = obj

SRC = $(wildcard $(SRCDIR)/*.c)
OBJ = $(SRC:$(SRCDIR)/%.c=$(OBJDIR)/%.o)

TARGET = INSIZZLE

all: $(SRC) $(TARGET)

$(TARGET): $(OBJ)
	   $(CC) $(OBJ) $(LDFLAGS) -o $@

$(OBJDIR)/%.o: $(SRCDIR)/%.c
	$(CC) $(CFLAGS) $< -o $@ -I$(INCDIR)/

clean:
		rm -rf $(OBJ) $(TARGET)

distclean:
		rm -f *~ \#* $(OBJDIR)/*.o $(SRCDIR)/*~ $(TARGET)

