[bits 16]

switch_to_lm:
    cli ; Disable Interrupts

    ; Setup paging tables
    fill:
        mov dword [0x1000 + ecx], 0x2000
        or dword [0x1000 + ecx], 111b
        mov dword [0x1000 + ecx + 4], 0
        mov dword [0x2000 + ecx], 0x3000
        or dword [0x2000 + ecx], 111b
        mov dword [0x2000 + ecx + 4], 0
        mov dword [0x3000 + ecx], 0x4000
        or dword [0x3000 + ecx], 111b
        mov dword [0x3000 + ecx + 4], 0

        mov eax, (4096/8)
        mul ecx
        mov dword [0x4000 + ecx], eax
        or dword [0x4000 + ecx], 111b
        mov dword [0x4000 + ecx + 4], 0

        add ecx, 8
        cmp ecx, 4096
        jl fill

    ; Setup PAE
    mov eax, cr4
    or eax, 1 << 5
    mov cr4, eax

    ; Use page table in control register
    mov eax, 0x1000
    mov cr3, eax

    ; Setup Long Mode bit in EFER MSR
    mov ecx, 0xC0000080
    rdmsr
    or eax, 1 << 8
    wrmsr

    ; Enable Paging
    mov eax, cr0
    or eax, 1 << 31 | 1
    mov cr0, eax

    lgdt [gdt.pointer]                ; Load GDT.Pointer defined below.
    jmp gdt.code_seg:init_lm             ; Load CS with 64 bit segment and flush the instruction cache

[bits 64]
init_lm:
    mov ax, gdt.data_seg
    mov ds, ax
    mov es, ax
    mov ss, ax
    mov fs, ax
    mov gs, ax
    mov ss, ax

    call BEGIN_LM