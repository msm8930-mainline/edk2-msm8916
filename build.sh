#!/bin/bash
# based on the instructions from edk2-platform
set -e
. build_common.sh
# not actually GCC5; it's GCC7 on Ubuntu 18.04.
GCC5_AARCH64_PREFIX=aarch64-linux-gnu- build -s -n 0 -a AARCH64 -t GCC5 -p MSM8909Pkg/Devices/y560.dsc
#cd BootShim
#make UEFI_BASE=0x80200000 UEFI_SIZE=0x00100000
#rm BootShim.elf
#cd ..
cat workspace/Build/MSM8909Pkg/DEBUG_GCC5/FV/MSM8909PKG_UEFI.fd > workspace/bootpayload.bin
gzip -c < workspace/bootpayload.bin >MSM8909_UEFI.fd.gz
cat ~/Downloads/j5lte.dtb >>MSM8909_UEFI.fd.gz
