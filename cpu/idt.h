#ifndef pearos_idt_h
#define pearos_idt_h

#include <stdint.h>

typedef struct {
    uint16_t lowOffset;
    uint16_t selector;
    uint8_t always0;
    uint8_t flags;
    uint16_t middleOffset;
    uint32_t highOffset;
    uint32_t reserved;
} __attribute__((packed)) idt_entry_t;

typedef struct {
    uint16_t limit;
    uint64_t base;
} __attribute__((packed)) idt_handlers_pointer_t;

typedef struct {
    uint64_t ds;
    uint64_t rdi, rsi, rbp, rsp, rbx, rdx, rcx, rax;
    uint64_t intNum, errorCode;
    uint64_t rip, cs, eflags, useresp, ss;
} registers_t;

void isr_handler(registers_t r);
void irq_handler(registers_t r);

extern void isr_handler_0(void);
extern void isr_handler_1(void);
extern void isr_handler_2(void);
extern void isr_handler_3(void);
extern void isr_handler_4(void);
extern void isr_handler_5(void);
extern void isr_handler_6(void);
extern void isr_handler_7(void);
extern void isr_handler_8(void);
extern void isr_handler_9(void);
extern void isr_handler_10(void);
extern void isr_handler_11(void);
extern void isr_handler_12(void);
extern void isr_handler_13(void);
extern void isr_handler_14(void);
extern void isr_handler_15(void);
extern void isr_handler_16(void);
extern void isr_handler_17(void);
extern void isr_handler_18(void);
extern void isr_handler_19(void);
extern void isr_handler_20(void);
extern void isr_handler_21(void);
extern void isr_handler_22(void);
extern void isr_handler_23(void);
extern void isr_handler_24(void);
extern void isr_handler_25(void);
extern void isr_handler_26(void);
extern void isr_handler_27(void);
extern void isr_handler_28(void);
extern void isr_handler_29(void);
extern void isr_handler_30(void);
extern void isr_handler_31(void);

extern void irq_0();
extern void irq_1();
extern void irq_2();
extern void irq_3();
extern void irq_4();
extern void irq_5();
extern void irq_6();
extern void irq_7();
extern void irq_8();
extern void irq_9();
extern void irq_10();
extern void irq_11();
extern void irq_12();
extern void irq_13();
extern void irq_14();
extern void irq_15();

#define IRQ0 32
#define IRQ1 33
#define IRQ2 34
#define IRQ3 35
#define IRQ4 36
#define IRQ5 37
#define IRQ6 38
#define IRQ7 39
#define IRQ8 40
#define IRQ9 41
#define IRQ10 42
#define IRQ11 43
#define IRQ12 44
#define IRQ13 45
#define IRQ14 46
#define IRQ15 47

extern void load_idt(void);

void set_idt_handler(uint32_t num, uint64_t handler);
void install_isr(void);
void install_irq(void);

typedef void (*isr_t)(registers_t*);
void register_interrupt_handler(uint8_t n, isr_t handler);

#endif