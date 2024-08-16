export _main
.text
_main:
        jmp _start
_msg1:  .ascii "1+2+..+10 = "
_msg1len:   equ     _start - _msg1
_start:
        mov     bx, #1
        mov     ax, #0
_next:
        add     ax, bx
        inc     bx
        cmp     bx, #11
        jb      _next
        mov     0x400, ax
_outmsg1:
        mov     ah, #0x03
        mov     bx, #0
        int     0x10
        inc     dh
        mov     al, #0
        mov     cx, #_msg1len
        mov     ax, #_msg1  
        add     ax, #0x100
        mov     bp, ax
        mov     bx, #0x000f
        mov     ax, #0x1301
        int     0x10
_outans:
        mov     ah, #0x03
        mov     bx, #0
        int     0x10
        inc     dl
        mov     ax, 0x400
        mov     bh, #11
        dec     bh
        div     bh
        add     al, #0x30
        add     ah, #0x30
        mov     0x400, al
        mov     0x401, ah
        mov     ah, #0x03
        mov     bx, #0
        int     0x10
        mov     cx, #2
        mov     ax, #0x400
        mov     bp, ax
        mov     bx, #0x000f
        mov     ax, #0x1301
        int     0x10      

_endp:
        mov     ax, #0x4c00
        int     0x21     
.data
.bss
