C_SOURCES = $(wildcard kernel/*.c drivers/*.c cpu/*.c libc/*.c)
HEADERS = $(wildcard kernel/*.h drivers/*.h cpu/*.h libc/*.h)
# Nice syntax for file extension replacement
OBJ = ${C_SOURCES:.c=.o cpu/interrupt.o}

# Change this if your cross-compiler is somewhere else
CC = /usr/local/x86_64-elf-gcc/bin/x86_64-elf-gcc
GDB = /usr/local/x86_64-elf-gcc/bin/x86_64-elf-gdb
# -g: Use debugging symbols in gcc
CFLAGS = -g -ffreestanding -Wall -Wextra -fno-exceptions -mcmodel=large -mno-red-zone -mno-mmx -mno-sse -mno-sse2

# First rule is run by default
PearOS-image.bin: boot/bootsector.bin kernel.bin
	cat $^ > PearOS-image.bin

# '--oformat binary' deletes all symbols as a collateral, so we don't need
# to 'strip' them manually on this case
kernel.bin: boot/kernel_entry.o ${OBJ}
	x86_64-elf-ld -o $@ -T link.lds $^

# Used for debugging purposes
kernel.elf: boot/kernel_entry.o ${OBJ}
	x86_64-elf-ld -o $@ -T link.lds $^ --oformat default

run: PearOS-image.bin
	qemu-system-x86_64 -enable-kvm -cpu host -drive format=raw,if=floppy,file=PearOS-image.bin

# Open the connection to qemu and load our kernel-object file with symbols
debug: PearOS-image.bin kernel.elf
	qemu-system-x86_64 -enable-kvm -cpu host -s -S -drive format=raw,if=floppy,file=PearOS-image.bin -d guest_errors &
	${GDB} -ex "target remote localhost:1234" -ex "symbol-file kernel.elf"

# Generic rules for wildcards
# To make an object, always compile from its .c
%.o: %.c ${HEADERS}
	${CC} ${CFLAGS} -c $< -o $@

%.o: %.asm
	nasm $< -f elf64 -o $@

%.bin: %.asm
	nasm $< -f bin -o $@

clean:
	rm -rf *.bin *.dis *.o PearOS-image.bin *.elf
	rm -rf kernel/*.o boot/*.bin drivers/*.o boot/*.o cpu/*.o libc/*.o