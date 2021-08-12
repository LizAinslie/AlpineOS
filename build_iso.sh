#!/usr/bin/env bash
dd if=/dev/zero of=dist/PearOS.img bs=1024 count=1440
dd if=PearOS-image.bin of=dist/PearOS.img seek=0 conv=notrunc
mkdir dist/iso
mv dist/PearOS.img dist/iso
mkisofs -V 'PearOS' -o dist/PearOS.iso -b PearOS.img -hide PearOS.img dist/iso
rm -rf dist/iso
