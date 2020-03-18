all: main

version.pic.o: version.cc
	clang++-9 -c -fPIC version.cc -o version.pic.o

libversion.a: version.pic.o
	llvm-ar-9 rcs libversion.a version.pic.o

main.o: main.c
	clang-9 -c main.c -o main.o

main: main.o libversion.a
	clang main.o -L. -Wl,--whole-archive -lversion -Wl,--no-whole-archive -o main

.PHONY: clean
clean:
	rm -fv *.o *.a main
