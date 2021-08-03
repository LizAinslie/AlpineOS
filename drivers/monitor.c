#include "monitor.h"
#include "../cpu/ports.h"
#include "../libc/mem.h.keep"
#include "../libc/string.h"
#include <stdint.h>

uint16_t cursor_x = 0;
uint16_t cursor_y = 0;

void scrollToBottom(void) {
    
}

void update_cursor_position(void) {
    uint16_t cursor_position = cursor_y * MAX_COLS + cursor_x;
    port_byte_out(0x3D4, 14);
    port_byte_out(0x3D5, cursor_position >> 8);
    port_byte_out(0x3D4, 15);
    port_byte_out(0x3D5, cursor_position);
}

void monitor_write_char(char ch) {
    uint16_t *video_memory = (uint16_t*)VIDEO_LOCATION;

    switch(ch) {
        case '\n':
            cursor_x = 0;
            cursor_y++;
            break;
        case '\t':
            cursor_x += 2;
            break;
        case '\r':
            cursor_x = 0;
            break;
        default:
            video_memory[cursor_y * MAX_COLS + cursor_x] = ch | 3840;
            cursor_x++;
    }

    if(cursor_x >= MAX_COLS) {
        cursor_x = 0;
        cursor_y++;
    }

    update_cursor_position();
}

void monitor_clear(void) {
    uint16_t *video_memory = (uint16_t*)VIDEO_LOCATION;
    uint16_t i;

    for(i = 0; i < SIZE; ++i) {
        video_memory[i] = 0x20 | 3840;
    }

    cursor_x = 0;
    cursor_y = 0;
    update_cursor_position();
}

void monitor_write(char* str) {
    uint16_t i = 0;
    while(str[i] != 0) {
        monitor_write_char(str[i++]);
    }
}

void monitor_print_center(char* str) {
    uint32_t len = strlen(str);
    cursor_x = (MAX_COLS / 2) - len;
    cursor_y = (MAX_ROWS / 2) - 1;
    monitor_write(str);
}