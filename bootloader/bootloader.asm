; **************************
; bootloader.asm
; Basic bootloader
; **************************
bits 16
org 0x7c00
start: jmp boot

; Constant and variable defs
msg db "Welcome to RaddiOS", 0ah, 0dh, 0h

boot:
    cli ; no interrupts
    cld ; init
    hlt ; halt

; We have to be 512 bytes, clear the rest of the bytes with 0
times 510 - ($-$$) db 0
dw 0xAA55

