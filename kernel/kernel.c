#include "../cpu/idt.h"
#include "../drivers/monitor.h"
#include "kernel.h"
#include <stdint.h>

void kernel_main() {
    init_idt();

    monitor_clear();
    monitor_write("yo.");
}