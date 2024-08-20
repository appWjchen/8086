export _main
.text
_main:
        jmp _start
_msg1:  .ascii "Input guess (0 ~ 9) : "
_msg2:  .ascii "input error"
_msg3:  .ascii "fail"
_msg4:  .ascii "success"

_msg1len:   equ     _msg2 - _msg1
_msg2len:   equ     _msg3 - _msg2
_msg3len:   equ     _msg4 - _msg3
_msg4len:   equ     _start - _msg4

_start:
        call    _getrandomnumber
        push    ax          ; save random number(AL) in stack
_readA:
        call    _getcursorposition
        mov     cx, #_msg1len
        mov     ax, #_msg1
        call    _printmsg
        call    _getkey
        call    _outkey
        call    _getcursorposition
        inc     dh
        mov     dl, #0
        mov     ah, al      ; save the key in ah
        mov     al, #0x39   
        sub     al, ah      ; 0x39 - input ascii
        jc      _error      ; set carry -> input > 0x39
        mov     al, ah      ; restore saved al
        sub     al, #0x30   ; input ascii - 0x30
        jc      _error      ; set carry -> input < 0x30
inputOK:                    ; input ok
        pop     bx          ; restore random number(BL) from stack
        sub     al, bl      ; input - random
        jnz     _guessfail
        mov     cx, #_msg4len
        mov     ax, #_msg4  ; guess success message
        jmp     _outmsg
_guessfail:
        mov     cx, #_msg3len
        mov     ax, #_msg3  ; guess fail message
        jmp     _outmsg
_error:
        mov     cx, #_msg2len
        mov     ax, #_msg2  ; input error
_outmsg:
        call    _printmsg
        nop
_endp:
        mov     ax, #0x4c00
        int     0x21     

_getcursorposition:
        mov     ah, #0x03
        mov     bx, #0
        int     0x10
        ret

_printmsg:
        add     ax, #0x100
        mov     bp, ax
        mov     bx, #0x000f
        mov     ax, #0x1301
        int     0x10
        ret

_getcurrenttime:
        mov     ah, #0x2c       ; get time
        int     0x21
        ret

_getrandomnumber:
        call    _getcurrenttime
        mov     al, dl          ; dl almost random 0~99
        mov     ah, #0
        mov     bl, #11
        dec     bl
        div     bl              ; random / 10 , al 0 ~ 9
        ret

_getkey:
        mov     ah, #0x10
        int     0x16
        ret

_outkey:
        mov     cx, #1
        mov     bh, #0
        mov     ah, #5
        add     ah, #5      ; user press a key
        int     0x10        ; al = key pressed
        ret
.data
.bss
