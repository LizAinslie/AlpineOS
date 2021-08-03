%macro push_all 0
    push rax
    push rcx
    push rdx
    push rbx
    push rsp
    push rbp
    push rsi
    push rdi
%endmacro

%macro pop_all 0
    pop rdi
    pop rsi
    pop rbp
    pop rsp
    pop rbx
    pop rdx
    pop rcx
    pop rax
%endmacro

extern isr_handler
isr_handler_wrapper:
    mov rcx, 10
    push_all
    mov ax, ds
    push rax

    call isr_handler

    pop rax

    pop_all
    add rsp, 16
    sti
    iretq

global load_idt
extern idt_handlers_pointer
load_idt:
    lidt [idt_handlers_pointer]
    ret

global isr_handler_0
global isr_handler_1
global isr_handler_2
global isr_handler_3
global isr_handler_4
global isr_handler_5
global isr_handler_6
global isr_handler_7
global isr_handler_8
global isr_handler_9
global isr_handler_10
global isr_handler_11
global isr_handler_12
global isr_handler_13
global isr_handler_14
global isr_handler_15
global isr_handler_16
global isr_handler_17
global isr_handler_18
global isr_handler_19
global isr_handler_20
global isr_handler_21
global isr_handler_22
global isr_handler_23
global isr_handler_24
global isr_handler_25
global isr_handler_26
global isr_handler_27
global isr_handler_28
global isr_handler_29
global isr_handler_30
global isr_handler_31

isr_handler_0:
    cli
    push byte 0
    push byte 0
    jmp isr_handler_wrapper

isr_handler_1:
    cli
    push byte 0
    push byte 1
    jmp isr_handler_wrapper

isr_handler_2:
    cli
    push byte 0
    push byte 2
    jmp isr_handler_wrapper

isr_handler_3:
    cli
    push byte 0
    push byte 3
    jmp isr_handler_wrapper

isr_handler_4:
    cli
    push byte 0
    push byte 4
    jmp isr_handler_wrapper

isr_handler_5:
    cli
    push byte 0
    push byte 5
    jmp isr_handler_wrapper

isr_handler_6:
    cli
    push byte 0
    push byte 6
    jmp isr_handler_wrapper

isr_handler_7:
    cli
    push byte 0
    push byte 7
    jmp isr_handler_wrapper

isr_handler_8:
    cli
    push byte 8
    jmp isr_handler_wrapper

isr_handler_9:
    cli
    push byte 0
    push byte 9
    jmp isr_handler_wrapper

isr_handler_10:
    cli
    push byte 10
    jmp isr_handler_wrapper

isr_handler_11:
    cli
    push byte 11
    jmp isr_handler_wrapper

isr_handler_12:
    cli
    push byte 12
    jmp isr_handler_wrapper

isr_handler_13:
    cli
    push byte 13
    jmp isr_handler_wrapper

isr_handler_14:
    cli
    push byte 14
    jmp isr_handler_wrapper

isr_handler_15:
    cli
    push byte 0
    push byte 15
    jmp isr_handler_wrapper

isr_handler_16:
    cli
    push byte 0
    push byte 16
    jmp isr_handler_wrapper

isr_handler_17:
    cli
    push byte 0
    push byte 17
    jmp isr_handler_wrapper

isr_handler_18:
    cli
    push byte 0
    push byte 18
    jmp isr_handler_wrapper

isr_handler_19:
    cli
    push byte 0
    push byte 19
    jmp isr_handler_wrapper

isr_handler_20:
    cli
    push byte 0
    push byte 20
    jmp isr_handler_wrapper

isr_handler_21:
    cli
    push byte 0
    push byte 21
    jmp isr_handler_wrapper

isr_handler_22:
    cli
    push byte 0
    push byte 22
    jmp isr_handler_wrapper

isr_handler_23:
    cli
    push byte 0
    push byte 23
    jmp isr_handler_wrapper

isr_handler_24:
    cli
    push byte 0
    push byte 24
    jmp isr_handler_wrapper

isr_handler_25:
    cli
    push byte 0
    push byte 25
    jmp isr_handler_wrapper

isr_handler_26:
    cli
    push byte 0
    push byte 26
    jmp isr_handler_wrapper

isr_handler_27:
    cli
    push byte 0
    push byte 27
    jmp isr_handler_wrapper

isr_handler_28:
    cli
    push byte 0
    push byte 28
    jmp isr_handler_wrapper

isr_handler_29:
    cli
    push byte 0
    push byte 29
    jmp isr_handler_wrapper

isr_handler_30:
    cli
    push byte 0
    push byte 30
    jmp isr_handler_wrapper

isr_handler_31:
    cli
    push byte 0
    push byte 31
    jmp isr_handler_wrapper