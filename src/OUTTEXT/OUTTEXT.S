export _main
.text
_main:
        jmp start
msg:
        .ascii "Hello"
start:
        mov     cx, #5
        mov     dl, #0x00
        mov     dh, #0x05
        mov     ax, #msg
        add     ax, #0x100
        mov     bp, ax
        mov     bx, #0x000c
        mov     ax, #0x1301
        int     0x10
        mov     ax, #0x4c00
        int     0x21
.data
.bss
