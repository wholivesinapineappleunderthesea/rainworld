mkdir -p out
AS=aarch64-elf-as
LD=aarch64-elf-ld
CC=aarch64-elf-gcc
OBJCOPY=aarch64-elf-objcopy
CFLAGS="-ffreestanding -nostdlib -nostartfiles -nodefaultlibs -fno-builtin -Wall -Wextra -std=gnu99"

${AS} -o out/head.o head.S

${CC} ${CFLAGS} -c -o out/head.c.o head.c

${LD} -T kern.lds.S -o out/kernel.elf out/head.o out/head.c.o

# This version of qemu appears to not match documentation about DTB location.
# It *should* be in 0x40000000, but it is at 0x00000000.
# I don't really want to deal with whatever it's doing,
# flatten the image to raw binary will cause qemu to use linux boot protocol,
# and pass DTB in x0. sigh
${OBJCOPY} -O binary out/kernel.elf out/kernel.bin
