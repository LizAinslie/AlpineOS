gdt:
    .null:
        dq 0

    .code:
        dw 0
        dw 0
        db 0
        db 10011010b
            db 00100000b
            db 0

    .data:
        dw 0
        dw 0
        db 0
        db 10010010b
            db 00000000b
            db 0

    .pointer:
        dw $ - gdt.null - 1
        dd gdt.null

    .code_seg: equ gdt.code - gdt.null
    .data_seg: equ gdt.data - gdt.null