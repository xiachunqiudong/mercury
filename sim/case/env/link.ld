
MEMORY
{
    ROM (rx)  : ORIGIN = 0x00000000, LENGTH = 0x10000  /* 64KB */
    RAM (rwx) : ORIGIN = 0x20000000, LENGTH = 0x08000  /* 32KB */
}

SECTIONS
{
    ENTRY(_start)
    .text :
    {
        *(.text)
    } > ROM

    .rodata :
    {
        *(.rodata)
    } > RAM

    .data :
    {
        *(.data)
    } > RAM

    .bss :
    {
        *(.bss)
        *(COMMON)
    } > RAM
}
