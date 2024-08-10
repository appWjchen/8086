export _main
.text
_main:
        jmp _readA
_msg1:  .ascii "Please input A : "
_msg2:  .ascii "Please input B : "
_msg3:  .ascii "A+B="
_readA:
        mov     ah, #0x03
        mov     bx, #0
        int     0x10
        mov     cx, #_msg2 - _msg1
        mov     ax, #_msg1
        add     ax, #0x100
        mov     bp, ax
        mov     bx, #0x000f
        mov     ax, #0x1301
        int     0x10
        mov     ah, #0x10
        int     0x16
        mov     cx, #1
        mov     bh, #0
        mov     ah, #5
        add     ah, #5
        int     0x10
        sub     al, #0x30
        mov     0x400, al
_readB:
        mov     ah, #0x03
        mov     bx, #0
        int     0x10
        inc     dh
        mov     dl, #0
        mov     cx, #_msg3 - _msg2
        mov     ax, #_msg2
        add     ax, #0x100
        mov     bp, ax
        mov     bx, #0x000f
        mov     ax, #0x1301
        int     0x10
        mov     ah, #0x10
        int     0x16
        mov     cx, #1
        mov     bh, #0
        mov     ah, #5
        add     ah, #5
        int     0x10
        sub     al, #0x30
        add     al, 0x400
        mov     0x400, ax
        mov     ah, #0x03
        mov     bx, #0
        int     0x10
        inc     dh
        mov     dl, #0
        mov     cx, #_readA - _msg3
        mov     ax, #_msg3
        add     ax, #0x100
        mov     bp, ax
        mov     bx, #0x000f
        mov     ax, #0x1301
        int     0x10      
        mov     ax, 0x400
        mov     ah, #0x00
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
        inc     dh
        mov     dl, #0
        mov     cx, #2
        mov     ax, #0x400
        mov     bp, ax
        mov     bx, #0x000f
        mov     ax, #0x1301
        int     0x10      

_end:
        mov     ax, #0x4c00
        int     0x21     
.data
.bss
