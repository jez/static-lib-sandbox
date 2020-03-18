all: main

version.pic.o: version.cc
	clang++-9 -c -fPIC version.cc -o version.pic.o

libversion.a: version.pic.o
	llvm-ar-9 rcs libversion.a version.pic.o

main.o: main.c
	clang-9 -c main.c -o main.o

libmain.so: main.o libversion.a
	clang-9 main.o libversion.a -shared -o libmain.so

main: libmain.so
	clang-9 -L. -lmain -o main

.PHONY: clean
clean:
	rm -fv *.so *.o *.a main
