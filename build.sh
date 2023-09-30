#!/bin/bash
# Expected to be run under Linux
rm -rf workspace/Build
set -e
. build_common.sh

wine asl.exe MSM8909Pkg/AcpiTables/Dsdt/Dsdt.asl
mv DSDT.AML MSM8909Pkg/AcpiTables/DSDT.AML	
GCC5_AARCH64_PREFIX=aarch64-linux-gnu- build -s -n 0 -a AARCH64 -t GCC5 -p MSM8909Pkg/Devices/y560.dsc -j4
#cd BootShim
#make UEFI_BASE=0x80200000 UEFI_SIZE=0x00100000
#rm BootShim.elf
#cd ..
cat workspace/Build/MSM8909Pkg/DEBUG_GCC5/FV/MSM8909PKG_UEFI.fd > workspace/bootpayload.bin
gzip -c < workspace/bootpayload.bin >MSM8909_UEFI.fd.gz
cat device_specific/j5lte.dtb >>MSM8909_UEFI.fd.gz
