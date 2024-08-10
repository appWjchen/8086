export _main
.text
_main:
        mov     ax, #10
        mov     bx, #0xa
        mov     cx, #021
        mov     dx, #-1
        mov     ah, #0x4c
        int     0x21     
.data
.bss
