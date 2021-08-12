#include "../cpu/idt.h"
#include "../drivers/monitor.h"
#include "kernel.h"
#include <stdint.h>

#include "../drivers/sound.h"

void kernel_main(void) {
    install_isr();
    install_irq();

    // Sound works but I'm commenting this out so I don't kill my ears on every boot
    // play_sound(128);

    clear_screen();
    kprint("AlpineOS 2021.0.1 booted successfully.\n");
    kprint("Terminal coming soon(tm)\n>");
}