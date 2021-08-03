#ifndef pearos_monitor_h
#define pearos_monitor_h

#define VIDEO_LOCATION 0xb8000
#define MAX_ROWS 25
#define MAX_COLS 80
#define SIZE 25 * 80

#define SPACE *" "

#define SCREEN_CONTROL_PORT 0x3d4
#define SCREEN_DATA_PORT 0x3d5

void monitor_init(void);
void monitor_clear(void);
void monitor_write_char(char ch);
void monitor_write(char* ch);
void monitor_print_center(char* ch);

#endif
