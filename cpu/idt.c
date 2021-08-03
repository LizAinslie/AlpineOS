#include "idt.h"

idt_entry_t idt_handlers[256];
idt_handlers_pointer_t idt_handlers_pointer;

const char* exception_messages[32] = {
        "Division By Zero",
        "Debug Breakpoint",
        "Non Maskable Interrupt",
        "Breakpoint",
        "Overflow",
        "Bounds",
        "Invalid Opcode",
        "Coprocessor Unavailable",
        "Double Fault",
        "Coprocessor Segment Overrun",
        "Invalid Task State Segment",
        "Segment Not Present",
        "Stack Fault",
        "General Protection Fault",
        "Page Fault",
        "Reserved",
        "x87 Floating-Point Exception",
        "Alignment Check",
        "Machine Check",
        "SIMD Floating-Point Exception",
        "Virtualization Exception",
        "Reserved",
        "Security Exception",
        "Reserved",
        "Triple Fault",
        "Reserved",
        "Reserved",
        "Reserved",
        "Reserved",
        "Reserved",
        "Reserved",
        "Reserved"
};

void isr_handler(registers_t registers) {
    if(registers.intNum < 32) {
//        error("Exception: %s Identifier: %ld", exception_messages[registers.intNum], registers.intNum);
    }
}

void set_idt_handler(uint32_t num, uint64_t handler) {
    idt_handlers[num].lowOffset = (uint16_t)(handler & 0xFFFF);
    idt_handlers[num].selector = (uint16_t)0x08;
    idt_handlers[num].always0 = (uint8_t)0;
    idt_handlers[num].flags = (uint8_t)0x8E;
    idt_handlers[num].middleOffset = (uint16_t)((handler >> 16) & 0xFFFF);
    idt_handlers[num].highOffset = (uint32_t)((handler >> 32) & 0xFFFFFFFF);
    idt_handlers[num].reserved = (uint32_t)0;
}

void init_idt(void) {
    idt_handlers_pointer.limit = 256 * sizeof(idt_entry_t) - 1;
    idt_handlers_pointer.base = (uint64_t) &idt_handlers;

    set_idt_handler(0, (uint64_t)isr_handler_0);
    set_idt_handler(1, (uint64_t)isr_handler_1);
    set_idt_handler(2, (uint64_t)isr_handler_2);
    set_idt_handler(3, (uint64_t)isr_handler_3);
    set_idt_handler(4, (uint64_t)isr_handler_4);
    set_idt_handler(5, (uint64_t)isr_handler_5);
    set_idt_handler(6, (uint64_t)isr_handler_6);
    set_idt_handler(7, (uint64_t)isr_handler_7);
    set_idt_handler(8, (uint64_t)isr_handler_8);
    set_idt_handler(9, (uint64_t)isr_handler_9);
    set_idt_handler(10, (uint64_t)isr_handler_10);
    set_idt_handler(11, (uint64_t)isr_handler_11);
    set_idt_handler(12, (uint64_t)isr_handler_12);
    set_idt_handler(13, (uint64_t)isr_handler_13);
    set_idt_handler(14, (uint64_t)isr_handler_14);
    set_idt_handler(15, (uint64_t)isr_handler_15);
    set_idt_handler(16, (uint64_t)isr_handler_16);
    set_idt_handler(17, (uint64_t)isr_handler_17);
    set_idt_handler(18, (uint64_t)isr_handler_18);
    set_idt_handler(19, (uint64_t)isr_handler_19);
    set_idt_handler(20, (uint64_t)isr_handler_20);
    set_idt_handler(21, (uint64_t)isr_handler_21);
    set_idt_handler(22, (uint64_t)isr_handler_22);
    set_idt_handler(23, (uint64_t)isr_handler_23);
    set_idt_handler(24, (uint64_t)isr_handler_24);
    set_idt_handler(25, (uint64_t)isr_handler_25);
    set_idt_handler(26, (uint64_t)isr_handler_26);
    set_idt_handler(27, (uint64_t)isr_handler_27);
    set_idt_handler(28, (uint64_t)isr_handler_28);
    set_idt_handler(29, (uint64_t)isr_handler_29);
    set_idt_handler(30, (uint64_t)isr_handler_30);
    set_idt_handler(31, (uint64_t)isr_handler_31);

    load_idt();
}