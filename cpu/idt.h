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

extern void isr_handler(registers_t registers);

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

extern void load_idt(void);

void set_idt_handler(uint32_t num, uint64_t handler);
void init_idt(void);

#endif