all: parson.o

TESTS = test testcpp

.PHONY: all tests

tests: $(TESTS)
	for t in $(TESTS); do \
		./$$t; \
	done

clean:
	rm -f *.o
	rm -f test testcpp

test: tests.c parson.o
	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^

testcpp: tests.c parson.o
	$(CXX) $(CXXFLAGS) $(LDFLAGS) -o $@ $^

%.o: %.c
	$(CC) $(CPPFLAGS) $(CFLAGS) -c -o $@ $<
