ENTRY(_start);

SECTIONS
{
    _start = 0x80080000;
    . = 0x80080000;
    .data : {
        *(.data)
    }
}
