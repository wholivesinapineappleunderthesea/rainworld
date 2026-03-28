ENTRY(_start)

SECTIONS
{
	. = 0x40000000;

	.text : {
		*(.text.head*)
		*(.text*)
	}
}
