OUTPUT_FORMAT("elf32-littlearm")
OUTPUT_ARCH(arm)
ENTRY(_start)
SECTIONS {
    . = 0x70010000; 
    .text : { *(.text) } 
    
}

