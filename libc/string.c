#include "string.h"

uint32_t strlen(char s[]) {
    int i = 0;
    while (s[i] != '\0') ++i;
    return i;
}

int strcmp(char s1[], char s2[]) {
    int i;
    for (i = 0; s1[i] == s2[i]; i++) {
        if (s1[i] == '\0') return 0;
    }
    return s1[i] - s2[i];
}