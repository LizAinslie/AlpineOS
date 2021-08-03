[org 0x7c00]

[bits 16]
main:
    mov [BOOT_DRIVE], dl ; Remember that the BIOS sets us the boot drive in 'dl' on boot

    mov bp, 0x1000
    mov sp, bp

    call load_kernel

    call switch_to_lm

%include "boot/disk.asm"
%include "boot/long_mode.asm"
%include "boot/gdt.asm"

[bits 16]
load_kernel:
    mov bx, 0x1000
    mov es, bx
    mov bx, 0

    mov dh, 25
    mov dl, [BOOT_DRIVE]
    call disk_load
    ret

[bits 64]
BEGIN_LM:
    call 0x10000 ; Give control to the kernel
    hlt

BOOT_DRIVE db 0 ; It is a good idea to store it in memory because 'dl' may get overwritten

; padding
times 510 - ($-$$) db 0
dw 0xaa55