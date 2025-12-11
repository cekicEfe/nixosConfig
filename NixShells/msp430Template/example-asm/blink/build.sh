#!/usr/bin/env bash
CHIP="msp430g2553"

CHIP_LD="$MSP_LD_PATH"/lib/"$CHIP".ld
CHIP_LD_SCRPT="$MSP_LD_PATH"/lib/"$CHIP"_symbols.ld

cp $CHIP_LD .
cp $CHIP_LD_SCRPT .

msp430-elf-as -mmcu="$CHIP" \
  -o main.o main.asm
#   # -T "$CHIP".ld -Wl,-Map=main.map \
msp430-elf-ld -T "$CHIP".ld main.o -o main.elf

rm -f *.ld
