diff --git a/MSM8909Pkg/CommonDsc.dsc.inc b/MSM8909Pkg/CommonDsc.dsc.inc
index d37b476..4271d99 100644
--- a/MSM8909Pkg/CommonDsc.dsc.inc
+++ b/MSM8909Pkg/CommonDsc.dsc.inc
@@ -214,7 +214,7 @@
   DebugLib|MdePkg/Library/DxeRuntimeDebugLibSerialPort/DxeRuntimeDebugLibSerialPort.inf
 !endif
 
-[LibraryClasses.ARM]
+[LibraryClasses.AARCH64]
   ArmGenericTimerCounterLib|ArmPkg/Library/ArmGenericTimerPhyCounterLib/ArmGenericTimerPhyCounterLib.inf
 
 [BuildOptions]
diff --git a/MSM8909Pkg/Devices/e1m.dsc b/MSM8909Pkg/Devices/e1m.dsc
index 9a3b593..2bcf798 100644
--- a/MSM8909Pkg/Devices/e1m.dsc
+++ b/MSM8909Pkg/Devices/e1m.dsc
@@ -4,7 +4,7 @@
   PLATFORM_VERSION               = 0.1
   DSC_SPECIFICATION              = 0x00010019
   OUTPUT_DIRECTORY               = Build/$(PLATFORM_NAME)
-  SUPPORTED_ARCHITECTURES        = ARM
+  SUPPORTED_ARCHITECTURES        = AARCH64
   BUILD_TARGETS                  = DEBUG|RELEASE
   SKUID_IDENTIFIER               = DEFAULT
   FLASH_DEFINITION               = MSM8909Pkg/MSM8909Pkg.fdf
diff --git a/MSM8909Pkg/Devices/saana.dsc b/MSM8909Pkg/Devices/saana.dsc
index d1aa573..444789c 100644
--- a/MSM8909Pkg/Devices/saana.dsc
+++ b/MSM8909Pkg/Devices/saana.dsc
@@ -4,7 +4,7 @@
   PLATFORM_VERSION               = 0.1
   DSC_SPECIFICATION              = 0x00010019
   OUTPUT_DIRECTORY               = Build/$(PLATFORM_NAME)
-  SUPPORTED_ARCHITECTURES        = ARM
+  SUPPORTED_ARCHITECTURES        = AARCH64
   BUILD_TARGETS                  = DEBUG|RELEASE
   SKUID_IDENTIFIER               = DEFAULT
   FLASH_DEFINITION               = MSM8909Pkg/MSM8909Pkg.fdf
diff --git a/MSM8909Pkg/Devices/y560.dsc b/MSM8909Pkg/Devices/y560.dsc
index 5af6666..914723a 100644
--- a/MSM8909Pkg/Devices/y560.dsc
+++ b/MSM8909Pkg/Devices/y560.dsc
@@ -4,7 +4,7 @@
   PLATFORM_VERSION               = 0.1
   DSC_SPECIFICATION              = 0x00010019
   OUTPUT_DIRECTORY               = Build/$(PLATFORM_NAME)
-  SUPPORTED_ARCHITECTURES        = ARM
+  SUPPORTED_ARCHITECTURES        = AARCH64
   BUILD_TARGETS                  = DEBUG|RELEASE
   SKUID_IDENTIFIER               = DEFAULT
   FLASH_DEFINITION               = MSM8909Pkg/MSM8909Pkg.fdf
diff --git a/MSM8909Pkg/Drivers/BamDxe/BamDxe.inf b/MSM8909Pkg/Drivers/BamDxe/BamDxe.inf
index ac5f105..2991174 100644
--- a/MSM8909Pkg/Drivers/BamDxe/BamDxe.inf
+++ b/MSM8909Pkg/Drivers/BamDxe/BamDxe.inf
@@ -11,7 +11,7 @@
   Driver.c
   bam.c
 
-[BuildOptions.ARM]
+[BuildOptions.AARCH64]
   GCC:*_*_*_CC_FLAGS = -Wno-pointer-to-int-cast -Wno-int-to-pointer-cast
 
 [Packages]
diff --git a/MSM8909Pkg/Drivers/ClockDxe/ClockDxe.inf b/MSM8909Pkg/Drivers/ClockDxe/ClockDxe.inf
index 1feaa8a..4dd4b55 100644
--- a/MSM8909Pkg/Drivers/ClockDxe/ClockDxe.inf
+++ b/MSM8909Pkg/Drivers/ClockDxe/ClockDxe.inf
@@ -25,7 +25,7 @@
   QcomPlatformClockInitLib
   TimerLib
 
-[BuildOptions.ARM]
+[BuildOptions.AARCH64]
   GCC:*_*_*_CC_FLAGS = -Wno-pointer-to-int-cast -Wno-overflow
 
 [Protocols]
diff --git a/MSM8909Pkg/Drivers/ClockDxe/ClockImplLib.inf b/MSM8909Pkg/Drivers/ClockDxe/ClockImplLib.inf
index 51a9406..eb1ef4a 100644
--- a/MSM8909Pkg/Drivers/ClockDxe/ClockImplLib.inf
+++ b/MSM8909Pkg/Drivers/ClockDxe/ClockImplLib.inf
@@ -14,7 +14,7 @@
   clock-local.c
   clock_pll.c
 
-[BuildOptions.ARM]
+[BuildOptions.AARCH64]
   GCC:*_*_*_CC_FLAGS = -Wno-pointer-to-int-cast -Wno-overflow
 
 [Packages]
diff --git a/MSM8909Pkg/Drivers/ClockDxe/ClockLib.inf b/MSM8909Pkg/Drivers/ClockDxe/ClockLib.inf
index e6713d0..d01c877 100644
--- a/MSM8909Pkg/Drivers/ClockDxe/ClockLib.inf
+++ b/MSM8909Pkg/Drivers/ClockDxe/ClockLib.inf
@@ -18,7 +18,7 @@
 [LibraryClasses]
   UefiBootServicesTableLib
 
-[BuildOptions.ARM]
+[BuildOptions.AARCH64]
   GCC:*_*_*_CC_FLAGS = -Wno-pointer-to-int-cast -Wno-overflow
 
 [Protocols]
diff --git a/MSM8909Pkg/Drivers/SdhciMMCHSDxe/SdhciMMCHS.inf b/MSM8909Pkg/Drivers/SdhciMMCHSDxe/SdhciMMCHS.inf
index 9d5a798..950ec6a 100644
--- a/MSM8909Pkg/Drivers/SdhciMMCHSDxe/SdhciMMCHS.inf
+++ b/MSM8909Pkg/Drivers/SdhciMMCHSDxe/SdhciMMCHS.inf
@@ -32,7 +32,7 @@
   QcomPlatformMmcLib
   QcomTargetMmcSdhciLib
 
-[BuildOptions.ARM]
+[BuildOptions.AARCH64]
   GCC:*_*_*_CC_FLAGS = -Wno-pointer-to-int-cast
 
 [Protocols]
diff --git a/MSM8909Pkg/Drivers/SimpleFbDxe/SimpleFbDxe.inf b/MSM8909Pkg/Drivers/SimpleFbDxe/SimpleFbDxe.inf
index 9d088e3..7be37d2 100644
--- a/MSM8909Pkg/Drivers/SimpleFbDxe/SimpleFbDxe.inf
+++ b/MSM8909Pkg/Drivers/SimpleFbDxe/SimpleFbDxe.inf
@@ -8,7 +8,7 @@
   VERSION_STRING                 = 1.0
   ENTRY_POINT                    = SimpleFbDxeInitialize
 
-[BuildOptions.ARM]
+[BuildOptions.AARCH64]
   GCC:*_*_*_CC_FLAGS = -Wno-pointer-to-int-cast -Wno-overflow -Wno-int-to-pointer-cast
 
 [Sources.common]
diff --git a/MSM8909Pkg/Drivers/SpmiDxe/spmi.c b/MSM8909Pkg/Drivers/SpmiDxe/spmi.c
index 66ab52c..be4c8a9 100644
--- a/MSM8909Pkg/Drivers/SpmiDxe/spmi.c
+++ b/MSM8909Pkg/Drivers/SpmiDxe/spmi.c
@@ -147,7 +147,7 @@ static void write_wdata_from_array(uint8_t *array,
  *
  * return value : 0 if success, the error bit set on error
  */
-unsigned int pmic_arb_write_cmd(struct pmic_arb_cmd *cmd,
+long long unsigned int pmic_arb_write_cmd(struct pmic_arb_cmd *cmd,
                                 struct pmic_arb_param *param)
 {
 	uint32_t bytes_written = 0;
@@ -268,7 +268,7 @@ static void read_rdata_into_array(uint8_t *array,
  *
  * return value : 0 if success, the error bit set on error
  */
-unsigned int pmic_arb_read_cmd(struct pmic_arb_cmd *cmd,
+long long unsigned int pmic_arb_read_cmd(struct pmic_arb_cmd *cmd,
                                struct pmic_arb_param *param)
 {
 	uint32_t val = 0;
diff --git a/MSM8909Pkg/Drivers/SpmiDxe/spmi_p.h b/MSM8909Pkg/Drivers/SpmiDxe/spmi_p.h
index 99f1738..00e3a61 100644
--- a/MSM8909Pkg/Drivers/SpmiDxe/spmi_p.h
+++ b/MSM8909Pkg/Drivers/SpmiDxe/spmi_p.h
@@ -127,9 +127,9 @@ enum pmic_arb_chnl_return_values{
 };
 
 int spmi_init(void);
-unsigned int pmic_arb_write_cmd(struct pmic_arb_cmd *cmd,
+long long unsigned int pmic_arb_write_cmd(struct pmic_arb_cmd *cmd,
 	struct pmic_arb_param *param);
-unsigned int pmic_arb_read_cmd(struct pmic_arb_cmd *cmd,
+long long unsigned int pmic_arb_read_cmd(struct pmic_arb_cmd *cmd,
 	struct pmic_arb_param *param);
 
 #endif
diff --git a/MSM8909Pkg/Library/MSM8909PkgLib/Arm/ArmPlatformHelper.S b/MSM8909Pkg/Library/MSM8909PkgLib/Arm/ArmPlatformHelper.S
index a786495..761a8dd 100644
--- a/MSM8909Pkg/Library/MSM8909PkgLib/Arm/ArmPlatformHelper.S
+++ b/MSM8909Pkg/Library/MSM8909PkgLib/Arm/ArmPlatformHelper.S
@@ -1,49 +1,52 @@
-//
-//  Copyright (c) 2012-2013, ARM Limited. All rights reserved.
-//
-//  This program and the accompanying materials
-//  are licensed and made available under the terms and conditions of the BSD License
-//  which accompanies this distribution.  The full text of the license may be found at
-//  http://opensource.org/licenses/bsd-license.php
-//
-//  THE PROGRAM IS DISTRIBUTED UNDER THE BSD LICENSE ON AN "AS IS" BASIS,
-//  WITHOUT WARRANTIES OR REPRESENTATIONS OF ANY KIND, EITHER EXPRESS OR IMPLIED.
-//
-//
+#
+#  Copyright (c) 2018, Linaro Limited. All rights reserved.
+#
+#  This program and the accompanying materials
+#  are licensed and made available under the terms and conditions of the BSD License
+#  which accompanies this distribution.  The full text of the license may be found at
+#  http://opensource.org/licenses/bsd-license.php
+#
+#  THE PROGRAM IS DISTRIBUTED UNDER THE BSD LICENSE ON AN "AS IS" BASIS,
+#  WITHOUT WARRANTIES OR REPRESENTATIONS OF ANY KIND, EITHER EXPRESS OR IMPLIED.
+#
+#
 
-#include <AsmMacroIoLib.h>
+#include <AsmMacroIoLibV8.h>
 #include <Library/ArmLib.h>
 
+.text
+.align 3
+
 ASM_FUNC(ArmPlatformPeiBootAction)
-  bx    lr
+  ret
 
 //UINTN
-//ArmPlatformGetCorePosition (
+//ArmPlatformIsPrimaryCore (
 //  IN UINTN MpId
 //  );
-ASM_FUNC(ArmPlatformGetCorePosition)
-  and   r1, r0, #ARM_CORE_MASK
-  and   r0, r0, #ARM_CLUSTER_MASK
-  add   r0, r1, r0, LSR #7
-  bx    lr
+ASM_FUNC(ArmPlatformIsPrimaryCore)
+  MOV32 (w1, FixedPcdGet32(PcdArmPrimaryCoreMask))
+  and   x0, x0, x1
+  MOV32 (w1, FixedPcdGet32(PcdArmPrimaryCore))
+  cmp   w0, w1
+  cset  x0, eq
+  ret
 
 //UINTN
 //ArmPlatformGetPrimaryCoreMpId (
 //  VOID
 //  );
 ASM_FUNC(ArmPlatformGetPrimaryCoreMpId)
-  MOV32  (r0, FixedPcdGet32 (PcdArmPrimaryCore))
-  bx    lr
+  MOV32 (w0, FixedPcdGet32(PcdArmPrimaryCore))
+  ret
 
 //UINTN
-//ArmPlatformIsPrimaryCore (
+//ArmPlatformGetCorePosition (
 //  IN UINTN MpId
 //  );
-ASM_FUNC(ArmPlatformIsPrimaryCore)
-  MOV32  (r1, FixedPcdGet32 (PcdArmPrimaryCoreMask))
-  and   r0, r0, r1
-  MOV32  (r1, FixedPcdGet32 (PcdArmPrimaryCore))
-  cmp   r0, r1
-  moveq r0, #1
-  movne r0, #0
-  bx    lr
+// With this function: CorePos = (ClusterId * 4) + CoreId
+ASM_FUNC(ArmPlatformGetCorePosition)
+  and   x1, x0, #ARM_CORE_MASK
+  and   x0, x0, #ARM_CLUSTER_MASK
+  add   x0, x1, x0, LSR #6
+  ret
diff --git a/MSM8909Pkg/Library/MSM8909PkgLib/MSM8909PkgMem.c b/MSM8909Pkg/Library/MSM8909PkgLib/MSM8909PkgMem.c
index 42b4172..93540b5 100644
--- a/MSM8909Pkg/Library/MSM8909PkgLib/MSM8909PkgMem.c
+++ b/MSM8909Pkg/Library/MSM8909PkgLib/MSM8909PkgMem.c
@@ -17,6 +17,7 @@
 #include <Library/DebugLib.h>
 #include <Library/HobLib.h>
 #include <Configuration/DeviceMemoryMap.h>
+#include <Library/MemoryAllocationLib.h> 
 /**
   Return the Virtual Memory Map of your platform
 
@@ -49,45 +50,65 @@ AddHob
 	);
 }
 
-VOID
-ArmPlatformGetVirtualMemoryMap (
-  IN ARM_MEMORY_REGION_DESCRIPTOR** VirtualMemoryMap
-  )
+VOID ArmPlatformGetVirtualMemoryMap(IN ARM_MEMORY_REGION_DESCRIPTOR** VirtualMemoryMap)
 {
-  //TO-DO:ADD MEMORY MAP HERE
-    PARM_MEMORY_REGION_DESCRIPTOR_EX MemoryDescriptorEx = gDeviceMemoryDescriptorEx;
-    ARM_MEMORY_REGION_DESCRIPTOR MemoryDescriptor[MAX_ARM_MEMORY_REGION_DESCRIPTOR_COUNT];
-    UINTN Index = 0;
+  //TO-DO: ADD MEMORY MAP HERE
+  PARM_MEMORY_REGION_DESCRIPTOR_EX MemoryDescriptorEx = gDeviceMemoryDescriptorEx;
+  UINTN Index = 0;
+
+  // Count the number of memory descriptors to determine the array size
+  while (MemoryDescriptorEx->Address != (EFI_PHYSICAL_ADDRESS)0xFFFFFFFF)
+  {
+    Index++;
+    MemoryDescriptorEx++;
+  }
+
+  // Allocate memory for the MemoryDescriptor array
+  ARM_MEMORY_REGION_DESCRIPTOR* MemoryDescriptor = (ARM_MEMORY_REGION_DESCRIPTOR*)AllocatePool((Index + 1) * sizeof(ARM_MEMORY_REGION_DESCRIPTOR));
+  if (MemoryDescriptor == NULL)
+  {
+    // Handle allocation failure
+    return;
+  }
 
-    // Run through each memory descriptor
-    while (MemoryDescriptorEx->Address != (EFI_PHYSICAL_ADDRESS)0xFFFFFFFF)
+  // Reset Index for copying the memory descriptors
+  Index = 0;
+  MemoryDescriptorEx = gDeviceMemoryDescriptorEx;
+
+  // Run through each memory descriptor and copy it
+  while (MemoryDescriptorEx->Address != (EFI_PHYSICAL_ADDRESS)0xFFFFFFFF)
+  {
+    switch (MemoryDescriptorEx->HobOption)
     {
-        switch (MemoryDescriptorEx->HobOption)
-        {
-            case AddMem:
-			case AddDev:
-                AddHob(MemoryDescriptorEx);
-                break;
-            case NoHob:
-            default:
-                goto update;
-        }
-
-    update:
-        ASSERT(Index < MAX_ARM_MEMORY_REGION_DESCRIPTOR_COUNT);
-
-        MemoryDescriptor[Index].PhysicalBase = MemoryDescriptorEx->Address;
-        MemoryDescriptor[Index].VirtualBase = MemoryDescriptorEx->Address;
-        MemoryDescriptor[Index].Length = MemoryDescriptorEx->Length;
-		MemoryDescriptor[Index].Attributes = MemoryDescriptorEx->ArmAttributes;
-
-        Index++;
-        MemoryDescriptorEx++;
+      case AddMem:
+      case AddDev:
+        AddHob(MemoryDescriptorEx);
+        break;
+      case NoHob:
+      default:
+        goto update;
     }
 
-    // Last one (terminator)
+  update:
     ASSERT(Index < MAX_ARM_MEMORY_REGION_DESCRIPTOR_COUNT);
-    
-    *VirtualMemoryMap = MemoryDescriptor;
-  //ASSERT(0);
+
+    MemoryDescriptor[Index].PhysicalBase = MemoryDescriptorEx->Address;
+    MemoryDescriptor[Index].VirtualBase = MemoryDescriptorEx->Address;
+    MemoryDescriptor[Index].Length = MemoryDescriptorEx->Length;
+    MemoryDescriptor[Index].Attributes = MemoryDescriptorEx->ArmAttributes;
+
+    Index++;
+    MemoryDescriptorEx++;
+  }
+
+  // Last one (terminator)
+  ASSERT(Index < MAX_ARM_MEMORY_REGION_DESCRIPTOR_COUNT);
+
+  // Set the last descriptor as zero-filled (terminator)
+  MemoryDescriptor[Index].PhysicalBase = 0;
+  MemoryDescriptor[Index].VirtualBase = 0;
+  MemoryDescriptor[Index].Length = 0;
+  MemoryDescriptor[Index].Attributes = 0;
+
+  *VirtualMemoryMap = MemoryDescriptor;
 }
diff --git a/MSM8909Pkg/Library/PlatformBootManagerLib/PlatformBootManagerLib.inf b/MSM8909Pkg/Library/PlatformBootManagerLib/PlatformBootManagerLib.inf
index 2527090..2588a2e 100644
--- a/MSM8909Pkg/Library/PlatformBootManagerLib/PlatformBootManagerLib.inf
+++ b/MSM8909Pkg/Library/PlatformBootManagerLib/PlatformBootManagerLib.inf
@@ -41,7 +41,7 @@
   ShellPkg/ShellPkg.dec
   MSM8909Pkg/MSM8909Pkg.dec
 
-[BuildOptions.ARM]
+[BuildOptions.AARCH64]
   GCC:*_*_*_CC_FLAGS = -Wno-unused-variable
 
 [LibraryClasses]
diff --git a/MSM8909Pkg/Library/PlatformMmcLib/QcomPlatformMmcLib.inf b/MSM8909Pkg/Library/PlatformMmcLib/QcomPlatformMmcLib.inf
index 04f29ee..41a56ce 100644
--- a/MSM8909Pkg/Library/PlatformMmcLib/QcomPlatformMmcLib.inf
+++ b/MSM8909Pkg/Library/PlatformMmcLib/QcomPlatformMmcLib.inf
@@ -16,7 +16,7 @@
   EmbeddedPkg/EmbeddedPkg.dec
   MSM8909Pkg/MSM8909Pkg.dec
 
-[BuildOptions.ARM]
+[BuildOptions.AARCH64]
   GCC:*_*_*_CC_FLAGS = -Wno-unused-value
 
 [LibraryClasses]
diff --git a/MSM8909Pkg/Library/QcomPlatformClockInitLib/QcomPlatformClockInitLib.inf b/MSM8909Pkg/Library/QcomPlatformClockInitLib/QcomPlatformClockInitLib.inf
index d4242ff..3c62755 100644
--- a/MSM8909Pkg/Library/QcomPlatformClockInitLib/QcomPlatformClockInitLib.inf
+++ b/MSM8909Pkg/Library/QcomPlatformClockInitLib/QcomPlatformClockInitLib.inf
@@ -19,6 +19,6 @@
   IoLib
   ArmLib
 
-[BuildOptions.ARM]
+[BuildOptions.AARCH64]
   GCC:*_*_*_CC_FLAGS = -Wno-pointer-to-int-cast -Wno-overflow -Wno-int-conversion
 
diff --git a/MSM8909Pkg/MSM8909Pkg.dsc b/MSM8909Pkg/MSM8909Pkg.dsc
index b325916..e88867c 100644
--- a/MSM8909Pkg/MSM8909Pkg.dsc
+++ b/MSM8909Pkg/MSM8909Pkg.dsc
@@ -21,7 +21,7 @@
   PLATFORM_VERSION               = 0.1
   DSC_SPECIFICATION              = 0x00010019
   OUTPUT_DIRECTORY               = Build/$(PLATFORM_NAME)
-  SUPPORTED_ARCHITECTURES        = ARM
+  SUPPORTED_ARCHITECTURES        = AARCH64
   BUILD_TARGETS                  = DEBUG|RELEASE
   SKUID_IDENTIFIER               = DEFAULT
   FLASH_DEFINITION               = MSM8909Pkg/MSM8909Pkg.fdf
@@ -266,7 +266,7 @@
   #
   # PEI Phase modules
   #
-  MSM8909Pkg/PrePi/PrePi.inf
+  ArmPlatformPkg/PrePi/PeiUniCore.inf
 
   #
   # DXE
diff --git a/MSM8909Pkg/MSM8909Pkg.fdf b/MSM8909Pkg/MSM8909Pkg.fdf
index d4441bd..8d63f4c 100644
--- a/MSM8909Pkg/MSM8909Pkg.fdf
+++ b/MSM8909Pkg/MSM8909Pkg.fdf
@@ -247,7 +247,7 @@ READ_STATUS        = TRUE
 READ_LOCK_CAP      = TRUE
 READ_LOCK_STATUS   = TRUE
 
-  INF MSM8909Pkg/PrePi/PrePi.inf
+  INF ArmPlatformPkg/PrePi/PeiUniCore.inf
 
   FILE FV_IMAGE = 9E21FD93-9C72-4c15-8C4B-E77F1DB2D792 {
     SECTION GUIDED EE4E5898-3914-4259-9D6E-DC7BD79403CF PROCESSING_REQUIRED = TRUE {
diff --git a/MSM8909Pkg/PrePi/PrePi.inf b/MSM8909Pkg/PrePi/PrePi.inf
index 9a01b70..022c103 100644
--- a/MSM8909Pkg/PrePi/PrePi.inf
+++ b/MSM8909Pkg/PrePi/PrePi.inf
@@ -9,12 +9,12 @@
   Pi.c
   EarlyQGic/EarlyQGic.c
 
-[Sources.ARM]
+[Sources.AARCH64]
   ReleaseInfo.S | GCC
   ProcessorSupport.S | GCC
   ModuleEntryPoint.S | GCC
 
-[BuildOptions.ARM]
+[BuildOptions.AARCH64]
   GCC:*_*_*_CC_FLAGS = -Werror -Wno-error=unused-function 
 
 [Packages]
diff --git a/build.sh b/build.sh
index e583440..974723d 100755
--- a/build.sh
+++ b/build.sh
@@ -3,11 +3,11 @@
 set -e
 . build_common.sh
 # not actually GCC5; it's GCC7 on Ubuntu 18.04.
-GCC5_ARM_PREFIX=arm-linux-gnueabi- build -j$(nproc) -s -n 0 -a ARM -t GCC5 -p MSM8909Pkg/Devices/y560.dsc
-cd BootShim
-make UEFI_BASE=0x80200000 UEFI_SIZE=0x00100000
-rm BootShim.elf
-cd ..
+GCC5_AARCH64_PREFIX=aarch64-linux-gnu- build -s -n 0 -a AARCH64 -t GCC5 -p MSM8909Pkg/Devices/y560.dsc
+#cd BootShim
+#make UEFI_BASE=0x80200000 UEFI_SIZE=0x00100000
+#rm BootShim.elf
+#cd ..
 cat BootShim/BootShim.bin workspace/Build/MSM8909Pkg/DEBUG_GCC5/FV/MSM8909PKG_UEFI.fd > workspace/bootpayload.bin
 gzip -c < workspace/bootpayload.bin >MSM8909_UEFI.fd.gz
-mkbootimg --kernel MSM8909_UEFI.fd.gz --kernel_offset 0x00008000 --dtb device_specific/saana.dtb --ramdisk workspace/empty --base 0x80000000 --pagesize 2048 --cmdline "" --output workspace/Y560.img
\ No newline at end of file
+cat ~/Downloads/j5lte.dtb >>MSM8909_UEFI.fd.gz
