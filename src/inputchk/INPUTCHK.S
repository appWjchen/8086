export _main
.text
_main:
        jmp _readA
_msg1:  .ascii "Please input A : "
_msg2:  .ascii "input error"
_msg3:  .ascii "input ok"
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
        add     ah, #5      ; user press a key
        int     0x10
        mov     ah, #0x03
        mov     bx, #0
        int     0x10
        inc     dh
        mov     dl, #0
        mov     ah, al      ; save the key in ah
        sub     al, #0x30   ; input ascii - 0x30
        jc      _error      ; set carry -> input < 0x30
        mov     al, #0x39
        sub     al, ah      ; set carry -> input > 0x39
        jc      _error
        mov     cx, #_readA - _msg3
        mov     ax, #_msg3  ; input ok
        jmp     _endp
_error:
        mov     cx, #_msg3 - _msg2
        mov     ax, #_msg2  ; input error
_endp:
        add     ax, #0x100
        mov     bp, ax
        mov     bx, #0x000f
        mov     ax, #0x1301
        int     0x10
        mov     ax, #0x4c00
        int     0x21     
.data
.bss
