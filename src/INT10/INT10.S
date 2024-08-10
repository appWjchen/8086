export _main
.text
_main:
        jmp start             ; 跳到 start 處去執行
msg:
        .ascii "Hello world!"
start:
        mov     ah, #0x03     ; ah = 0x03
        mov     bx, #0
        int     0x10          ; int 0x10 取得游標位置
        mov     cx, #12       ; 印出字串長度
        mov     ax, #msg      ; 印出字串的位址
        add     ax, #0x100    ; 加上 PSP 的長度
        mov     bp, ax        ; 真正 msg 位址放到 bp 中
        mov     bh, #0x00     ; 頁碼
        mov     bl, #0x0f     ; 顏色
        mov     ah, #0x13     ; ah = 0x13
        mov     al, #0x01     ; 模式
        int     0x10          ; int 0x10 輸出字串
        mov     ax, #0x4c00
        int     0x21
.data
.bss
