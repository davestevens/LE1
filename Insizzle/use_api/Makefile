# Makefile for API

CC = gcc
CFLAGS = -c -Wall -pedantic -Wextra -DAPI -I../../le1_driver -I../inc `xml2-config --cflags` -std=c99
LDFLAGS = -lm `xml2-config --libs` -lpcre


all:
	cd ../ && make clean && make API && cd .
	$(CC) main.c $(CFLAGS)
	$(CC) -o TEST main.o ../INSIZZLEAPI $(LDFLAGS)

test:
	./TEST -i test_data/iram0.bin -d test_data/dram.bin -m test_data/model_1lsu_1.xml

clean:
	cd ../ && make clean && cd .
	rm -f *~ main.o TEST
