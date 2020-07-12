; +---------------------------------------------------------------+
; | io.asm                                                        |
; | Contains I/O related routines such as printing to the screen. |
; +---------------------------------------------------------------+

.data
cursY DW 0 ; 'cursor' y position
cursX DW 0 ; 'cursor' x position

.text
MovCursor:
        ;; Move a cursor to a specific location on screen
        ;; and remember this location
        ; ebp + 08 :: Y coordinate
        ; ebp + 0c :: X coordinate
        mov eax, [ebp + 0x08] ; eax = Y
        mov ebx, [ebp + 0x0c] ; ebx = X
        
        mov ah, 0x02 ; set cursor position
        mov bh, 0
        mov dh, eax
        mov dl, ebx
        int 0x10 ; call BIOS video service

        ; remember positions
        mov cursY, eax
        mov cursX, ebx
