#ifndef pearos_ports_h
#define pearos_ports_h

#include <stdint.h>

uint8_t port_byte_in(uint16_t port);
void port_byte_out(uint16_t port, uint8_t value);
uint16_t port_word_in(uint16_t port);

#endif