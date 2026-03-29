.section .text.head._start
.global _start
_start:
	# Setup SP (16k size)
	# If it overflows it will overwrite _start, 
	# and below the image
	adrp x1, _early_stack_high
	add x1, x1, :lo12:_early_stack_high
	add sp, x1, #0
	adrp x1, _start
	b _start_c

.balign 16
_early_stack_low:
.skip 4096*4, 0
_early_stack_high:
