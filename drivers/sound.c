#include "sound.h"

#include "../cpu/ports.h"
#include "../cpu/timer.h"

void play_sound(uint32_t freq) {
    //Set the PIT to the desired frequency
    uint32_t divisor = HW_CLOCK_FREQ / freq;
    port_byte_out(0x43, 0xb6);
    port_byte_out(0x42, (uint8_t)divisor);
    port_byte_out(0x42, (uint8_t)(divisor >> 8));

    //And play the sound using the PC speaker
    uint8_t tmp;
    tmp = port_byte_in(0x61);
    if (tmp != (tmp | 3)) {
        port_byte_out(0x61, tmp | 3);
    }
}

void silence() {
    uint8_t tmp = port_byte_in(0x61) & 0xFC;
    port_byte_out(0x61, tmp);
}