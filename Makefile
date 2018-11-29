CC = gcc
CFLAGS = -O0 -g -Wall -Wextra -std=c89 -pedantic-errors

CXX = g++
CXXFLAGS = -O0 -g -Wall -Wextra

all: parson.o test testcpp

.PHONY: test testcpp

test: tests.c parson.c
	$(CC) $(CFLAGS) -o $@ tests.c parson.c
	./$@

testcpp: tests.c parson.c
	$(CXX) $(CXXFLAGS) -o $@ tests.c parson.c
	./$@

clean:
	rm -f test testcpp *.o

%.o: %.c
	$(CC) $(CPPFLAGS) $(CFLAGS) -c -o $@ $<
