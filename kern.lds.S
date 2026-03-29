ENTRY(_start)

PHDRS
{
	head_text PT_LOAD FLAGS(5);
	text PT_LOAD FLAGS(5);
	data PT_LOAD FLAGS(6);
}

SECTIONS
{
	.text.head : {
		*(.text.head._start)
		*(.text.head*)
	} : head_text

	.text : ALIGN(4096) {
		*(.text*)
	} : text

	.data : ALIGN(4096) {
		*(.rodata*)
		*(.data*)
	} : data

	.bss : {
		*(.bss*)
	} : data

}
