export _main
.text
_main:
        mov     ax, #0x300
        mov     0x400, ax
        mov     ax, #0x500
        mov     0x300, ax
        mov     ax, 0x400
        mov     bx, ax
        mov     cx, [bx]
        mov     dx, [0x400]
        mov     ah, #0x4c
        int     0x21
.data
.bss
