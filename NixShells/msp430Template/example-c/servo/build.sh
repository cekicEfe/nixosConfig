#!/usr/bin/env bash
CHIP="msp430g2553"

msp430-elf-gcc -mmcu="$CHIP" -I $MSP_INC -L $MSP_LIB \
  -T "$CHIP".ld -Wl,-Map=main.map \
  -o main.elf main.c
