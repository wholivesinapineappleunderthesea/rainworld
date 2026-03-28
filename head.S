.section .text.head._start
.global _start
_start:
	#mrs x0, CurrentEL
	mov w0, #0x41
	bl writechar
	mov w0, #0x41
	bl writechar
	mov w0, #0x41
	bl writechar
1:
	wfi
	b 1b

#     [VIRT_UART0] =              { 0x09000000, 0x00001000 },
.section .text.head.writechar
writechar:
	mov		x1, #0x09000000
1:
	ldr w2, [x1, #0x18]
	tst w2, #32
	b.ne 1b
	str	 w0, [x1]
	ret
