export _main
.text
_main:
        jmp     _start
_data1:
        db      0x52
_outstr:
        .ascii  "0x"
        db      0, 0, 0x24
_start:
        mov     ax, cs
        add     ax, #0x10
        push    ax
        mov     ax, #_next
        push    ax
        retf
_next:
        mov     ax, cs
        mov     ds, ax
        mov     es, ax
        mov     ss, ax
        mov     ax, sp
        sub     ax, #0x100
        mov     sp, ax
        mov     al, _data1
        mov     ah, #0x00
        mov     bh, #16
        div     bh
        add     al, #0x30
        add     ah, #0x30
        mov     bx, #_outstr+2
        mov     [bx], al
        inc     bx
        mov     [bx], ah
        mov     dx, #_outstr
        mov     ah, #0x9
        int     0x21
        mov     ax, #0x4c00
        int     0x21
.data
.bss
        end

