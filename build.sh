mkdir -p out
aarch64-elf-as -o out/head.o head.S
aarch64-elf-ld -T kern.lds.S -o out/kernel.elf out/head.o
