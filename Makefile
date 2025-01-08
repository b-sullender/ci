compile:
	mkdir -p objects
	mkdir -p build
	nasm -f elf64 source/libsyscalls/amd64/libsyscalls.asm -o objects/libsyscalls.o
	ld -shared objects/libsyscalls.o -o build/libsyscalls.so
clean:
	rm -R objects
	rm -R build
install:
	
