export _main
.text
_main:
        jmp start             
_msg1:
        .ascii  "Please input your name : $"
_msg2:
        .ascii  "Welcome $"
_inbuffer:
        db      80
_incount:
        db      0
_indata:
        .space  80
start:
        mov     dx, #_msg1
        add     dx, #0x100
        mov     ah, #0x09       ; ah=0x09 output string
        int     0x21
        mov     dx, #_inbuffer
        add     dx, #0x100
        mov     ah, #0x05
        add     ah, #0x05       ; ah=0x0a input string
        int     0x21
        mov     al, #0x05       
        add     al, #0x05       ; al=0x0a newline
        mov     dl, al
        mov     ah, #0x02       ; ah=0x02 output character
        int     0x21
        mov     dx, #_msg2
        add     dx, #0x100
        mov     ah, #0x09       ; ah=0x09 output string
        int     0x21
        mov     bx, #_indata    
        add     bx, #0x100      ; bx=_indata address
        mov     al, [_incount+0x100]    ; al=_incount 
        mov     ah, #0x0
        add     bx, ax          ; bx=end of input string
        mov     [bx], #0x24     ; ascii 0x24 is '$'
        mov     dx, #_indata
        add     dx, #0x100      ; dx=_indata address
        mov     ah, #0x09       ; ah=0x09 output string
        int     0x21
        mov     ax, #0x4c00
        int     0x21
.data
.bss
