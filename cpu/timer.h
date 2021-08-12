#ifndef alpine_timer_h
#define alpine_timer_h

#include <stdint.h>

#define HW_CLOCK_FREQ 1193180

void init_timer(uint64_t freq);

#endif
