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
    ;sti
    iretq

extern irq_handler
irq_handler_wrapper:
    mov rcx, 10
    push_all
    mov ax, ds
    push rbx

    call irq_handler

    pop rbx

    pop_all
    add rsp, 16
    ;sti
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

; IRQs
global irq_0
global irq_1
global irq_2
global irq_3
global irq_4
global irq_5
global irq_6
global irq_7
global irq_8
global irq_9
global irq_10
global irq_11
global irq_12
global irq_13
global irq_14
global irq_15

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

; IRQ handlers
irq_0:
	push byte 0
	push byte 32
	jmp irq_handler_wrapper

irq_1:
	push byte 1
	push byte 33
	jmp irq_handler_wrapper

irq_2:
	push byte 2
	push byte 34
	jmp irq_handler_wrapper

irq_3:
	push byte 3
	push byte 35
	jmp irq_handler_wrapper

irq_4:
	push byte 4
	push byte 36
	jmp irq_handler_wrapper

irq_5:
	push byte 5
	push byte 37
	jmp irq_handler_wrapper

irq_6:
	push byte 6
	push byte 38
	jmp irq_handler_wrapper

irq_7:
	push byte 7
	push byte 39
	jmp irq_handler_wrapper

irq_8:
	push byte 8
	push byte 40
	jmp irq_handler_wrapper

irq_9:
	push byte 9
	push byte 41
	jmp irq_handler_wrapper

irq_10:
	push byte 10
	push byte 42
	jmp irq_handler_wrapper

irq_11:
	push byte 11
	push byte 43
	jmp irq_handler_wrapper

irq_12:
	push byte 12
	push byte 44
	jmp irq_handler_wrapper

irq_13:
	push byte 13
	push byte 45
	jmp irq_handler_wrapper

irq_14:
	push byte 14
	push byte 46
	jmp irq_handler_wrapper

irq_15:
	push byte 15
	push byte 47
	jmp irq_handler_wrapper