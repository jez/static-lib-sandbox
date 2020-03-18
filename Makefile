all: main

version.pic.o: version.cc
	clang++-9 -c -fPIC version.cc -o version.pic.o

libversion.so: version.pic.o
	clang-9 version.pic.o -shared -o libversion.so

main.o: main.c
	clang-9 -c main.c -o main.o

libmain.so: main.o
	clang-9 main.o -shared -o libmain.so

main: libmain.so libversion.so
	clang-9 -L. -lmain -lversion -o main

.PHONY: clean
clean:
	rm -fv *.so *.o *.a main
