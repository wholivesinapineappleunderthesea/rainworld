.section .text.head._start
.global _start
_start:
	mrs x0, CurrentEL
1:
	wfi
	b 1b
