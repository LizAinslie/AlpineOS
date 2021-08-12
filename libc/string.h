#ifndef pearos_string_h
#define pearos_string_h

#include <stdint.h>

uint32_t strlen(char s[]);
int strcmp(char s1[], char s2[]);
void int_to_ascii(int n, char str[]);
void hex_to_ascii(int n, char str[]);
void reverse(char s[]);
void backspace(char s[]);
void append(char s[], char n);
void append_str(char s[], char n[]);

#endif
