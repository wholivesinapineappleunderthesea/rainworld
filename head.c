#define HEAD_TEXT(name) __attribute__((section(".text.head." #name))) name

/* pl011@9000000 */
#define PL011_UART0_BASE 0x9000000
#define PL011_UART_DR 0x00
#define PL011_UART_FR 0x18
#define PL011_UART_FR_TXFF 0x20

static void HEAD_TEXT(writechar)(char c) {
	while ((*(volatile unsigned int *)(PL011_UART0_BASE + PL011_UART_FR) & PL011_UART_FR_TXFF) != 0) {}
	*(volatile unsigned int *)(PL011_UART0_BASE + PL011_UART_DR) = c;
}

void HEAD_TEXT(_start_c)(void *dtb_base, void *image_base) {
	// Non-sane C env, relocs are not performed, tiny stack size.
	(void)dtb_base;
	(void)image_base;

	writechar('H');
	writechar('e');
	writechar('l');
	writechar('l');
	writechar('o');
	writechar('\n');

	while (1) {
		asm volatile ("wfi");
	}
}
