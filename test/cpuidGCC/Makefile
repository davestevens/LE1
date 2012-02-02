CC = gcc
CFLAGS =  -Wall -Wextra -pedantic -g -DgetCPUID\(x\)=_asm1\(0x0,x\) -m32 -c -DNUM_EVENT_QUEUES=3
LDFLAGS = -pthread -m32

SRCDIR = src
OBJDIR = obj

CFILES = $(wildcard $(SRCDIR)/*.c)
OFILES =  $(CFILES:$(SRCDIR)/%.c=$(OBJDIR)/%.o)
MAIN = newMain.c
TARGET = TEST

all: test

test: $(CFILES) $(MAIN) $(TARGET)

$(TARGET): $(OFILES) newMain.o
	$(CC) $(OFILES) newMain.o $(LDFLAGS) -o $@

$(OBJDIR)/%.o: $(SRCDIR)/%.c
	$(CC) $(CFLAGS) $< -o $@
	@objcopy --redefine-sym "main"="threadedMain" $@

newMain.o: newMain.c
	$(CC) $(CFLAGS) -c newMain.c

clean:
	rm -f $(OBJDIR)/*.o newMain.o $(TARGET)
