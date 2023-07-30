// Copyright (c) 2012, Qualcomm Technologies Inc. All rights reserved.

#pragma once

#define ACPI_RESERVED       0

#pragma pack(1)

typedef struct
{
  UINT32  Signature;
  UINT32  Length;
  UINT8   Revision;
  UINT8   Checksum;
  UINT8   OEMID[6];
  UINT64  OEMTableID;
  UINT32  OEMRevision;
  UINT32  CreatorID;
  UINT32  CreatorRevision;
} ACPI_HEADER;

typedef struct
{
  UINT32  Signature;
  UINT32  Length;
  UINT32  HardwareSignature;
  UINT32  FirmwareWakingVector;
  UINT32  GlobalLock;
  UINT32  Flags;
  UINT64  XFirmwareWakingVector;
  UINT8   Version;
  UINT8   Reserved1[3];
  UINT32  OspmFlag;
  UINT8   Reserved2[24];
} ACPI_FACS;

typedef struct
{
  UINT8   AddressSpaceID;
  UINT8   RegisterBitWidth;
  UINT8   RegisterBitOffset;
  UINT8   AccessSize;
  UINT64  Address;
} ACPI_GAS;

#define ACPI_GAS_ID_SYSTEM_MEMORY              0
#define ACPI_GAS_ID_SYSTEM_IO                  1
#define ACPI_GAS_ID_PCI_CONFIGURATION_SPACE    2
#define ACPI_GAS_ID_EMBEDDED_CONTROLLER        3
#define ACPI_GAS_ID_SMBUS                      4
#define ACPI_GAS_ID_FUNCTIONAL_FIXED_HARDWARE  0x7F

#define ACPI_GAS_ACCESS_UNDEFINED              0
#define ACPI_GAS_ACCESS_BYTE                   1
#define ACPI_GAS_ACCESS_WORD                   2
#define ACPI_GAS_ACCESS_DWORD                  3
#define ACPI_GAS_ACCESS_QWORD                  4

// ----------------- Start GTDT section ----------------------

//
// GTDT flag definitions
//

#define GTDT_TIMER_EDGE_TRIGGERED  0x00000001
#define GTDT_TIMER_ACTIVE_LOW      0x00000002
#define GTDT_TIMER_ALWAYS_ON       0x00000004

#define GTDT_PLATFORM_GT_EDGE_TRIGGERED   0x00000001
#define GTDT_PLATFORM_GT_ACTIVE_LOW       0x00000002

#define GTDT_PLATFORM_GT_COMMON_SECURE    0x00000001
#define GTDT_PLATFORM_GT_COMMON_ALWAYS_ON 0x00000002

#define GTDT_WATCHDOG_EDGE_TRIGGERED 0x00000001
#define GTDT_WATCHDOG_ACTIVE_LOW     0x00000002
#define GTDT_WATCHDOG_SECURE         0x00000004

//
// GTDT struct definitions
//

typedef enum _GTDT_PLATFORM_TIMER_BLOCK_TYPE {
    GtdtPlatformGtBlock = 0,
    GtdtPlatformWatchdogBlock = 1,
} GTDT_PLATFORM_TIMER_BLOCK_TYPE, *PGTDT_PLATFORM_TIMER_BLOCK_TYPE;

typedef struct _GTDT_PLATFORM_TIMER_HEADER {
    UINT8  Type;
    UINT16 Length;
} GTDT_PLATFORM_TIMER_HEADER, *PGTDT_PLATFORM_TIMER_HEADER;

typedef struct _GTDT_PLATFORM_GT_INSTANCE {
    UINT8  FrameNumber;
    UINT8  Reserved1;
    UINT8  Reserved2;
    UINT8  Reserved3;
    UINT64 CntBasePhysicalAddress;
    UINT64 CntEL0BasePhysicalAddress;
    UINT32 PhysicalTimerGsiv;
    UINT32 PhysicalTimerFlags;
    UINT32 VirtualTimerGsiv;
    UINT32 VirtualTimerFlags;
    UINT32 CommonFlags;
} GTDT_PLATFORM_GT_INSTANCE, *PGTDT_PLATFORM_GT_INSTANCE;

typedef struct _GTDT_PLATFORM_WATCHDOG_BLOCK {
    GTDT_PLATFORM_TIMER_HEADER Header;
    UINT16 Reserved;
    UINT64 RefreshFramePhysicalAddress;
    UINT64 ControlFramePhysicalAddress;
    UINT32 WatchdogTimerGsiv;
    UINT32 WatchdogTimerFlags;
} GTDT_PLATFORM_WATCHDOG_BLOCK, *PGTDT_PLATFORM_WATCHDOG_BLOCK;

typedef struct _GTDT_PLATFORM_GT_BLOCK {
    GTDT_PLATFORM_TIMER_HEADER Header;
    UINT8  Reserved;
    UINT64 CntCtlBasePhysicalAddress;
    UINT32 BlockTimerCount;
    UINT32 BlockTimerOffset;
    GTDT_PLATFORM_GT_INSTANCE TimerInstances[1];
} GTDT_PLATFORM_GT_BLOCK, *PGTDT_PLATFORM_GT_BLOCK;

typedef struct
{
	ACPI_HEADER   Header;
	UINT64 CntControlBasePhysicalAddress;
	UINT32 Reserved;
	UINT32 SecurePhysicalTimerGsiv;
	UINT32 SecurePhysicalTimerFlags;
	UINT32 NonSecurePhysicalTimerGsiv;
	UINT32 NonSecurePhysicalTimerFlags;
	UINT32 VirtualTimerEventGsiv;
	UINT32 VirtualTimerEventFlags;
	UINT32 NonSecurePhysicalTimer2Gsiv;
	UINT32 NonSecurePhysicalTimer2Flags;
	UINT64 CntReadBasePhysicalAddress;
	UINT32 TimerBlockCount;
	UINT32 TimerBlockOffset;
	
	GTDT_PLATFORM_GT_BLOCK TimerBlocks[1];
} ACPI_GTDT;

// ----------- End GTDT definitions -------------------

typedef struct
{
  ACPI_HEADER  Header;
  UINT32       FIRMWARE_CTRL;
  UINT32       DSDT;
  UINT8        Reserved0;
  UINT8        Preferred_PM_Profile;
  UINT16       SCI_INT;
  UINT32       SMI_CMD;
  UINT8        ACPI_ENABLE;
  UINT8        ACPI_DISABLE;
  UINT8        S4BIOS_REQ;
  UINT8        PSTATE_CNT;
  UINT32       PM1a_EVT_BLK;
  UINT32       PM1b_EVT_BLK;
  UINT32       PM1a_CNT_Blk;
  UINT32       PM1b_CNT_Blk;
  UINT32       PM2_CNT_BLk;
  UINT32       PM_TMR_BLK;
  UINT32       GPE0_BLK;
  UINT32       GPE1_BLK;
  UINT8        PM1_EVT_LEN;
  UINT8        PM1_CNT_LEN;
  UINT8        PM2_CNT_LEN;
  UINT8        PM_TMR_LEN;
  UINT8        GPE0_BLK_LEN;
  UINT8        GPE1_BLK_LEN;
  UINT8        GPE1_BASE;
  UINT8        CST_CNT;
  UINT16       P_LVL2_LAT;
  UINT16       P_LVL3_LAT;
  UINT16       FLUSH_SIZE;
  UINT16       FLUSH_STRIDE;
  UINT8        DUTY_OFFSET;
  UINT8        DUTY_WIDTH;
  UINT8        DAY_ALRM;
  UINT8        MON_ALRM;
  UINT8        CENTURY;
  UINT16       IAPC_BOOT_ARCH;
  UINT8        Reserved1;
  UINT32       Flags;
  ACPI_GAS     RESET_REG;
  UINT8        RESET_VALUE;
  UINT8        Reserved2[3];
  UINT64       X_FIRMWARE_CTRL;
  UINT64       X_DSDT;
  ACPI_GAS     X_PM1a_EVT_BLK;
  ACPI_GAS     X_PM1b_EVT_BLK;
  ACPI_GAS     X_PM1a_CNT_BLK;
  ACPI_GAS     X_PM1b_CNT_BLK;
  ACPI_GAS     X_PM2_CNT_BLK;
  ACPI_GAS     X_PM_TMR_BLK;
  ACPI_GAS     X_GPE0_BLK;
  ACPI_GAS     X_GPE1_BLK;
} ACPI_FACP;

#define ACPI_PM_PROFILE_UNSPECIFIED           0
#define ACPI_PM_PROFILE_DESKTOP               1
#define ACPI_PM_PROFILE_MOBILE                2
#define ACPI_PM_PROFILE_WORKSTATION           3
#define ACPI_PM_PROFILE_ENTERPRISE_SERVER     4
#define ACPI_PM_PROFILE_SOHO_SERVER           5
#define ACPI_PM_PROFILE_APPLIANCE_PC          6
#define ACPI_PM_PROFILE_PERFORMANCE_SERVER    7
#define ACPI_PM_PROFILE_SLATE                 8

#define ACPI_HARDWARE_REDUCED   (1 << 20) // Hardware-reduced ACPI
#define LOW_POWER_S0_CAPABLE    (1 << 21) // Low power idle states in ACPI S0

#define SIGNATURE4(a, b, c, d)             (                                            \
                                             ((a) | (b << 8))                           \
                                             |                                          \
                                             ((((c) | (d << 8)) << 16))                 \
                                           )

#define SIGNATURE8(a, b, c, d, e, f, g, h) (                                            \
                                             SIGNATURE4 (a, b, c, d)                    \
                                             |                                          \
                                             ((UINT64) (SIGNATURE4 (e, f, g, h)) << 32) \
                                           )

#define ACPI_FACP_SIGNATURE  SIGNATURE4('F', 'A', 'C', 'P')
#define ACPI_FACS_SIGNATURE  SIGNATURE4('F', 'A', 'C', 'S')
#define ACPI_DBGP_SIGNATURE  SIGNATURE4('D', 'B', 'G', 'P')
#define ACPI_DBG2_SIGNATURE  SIGNATURE4('D', 'B', 'G', '2')
#define ACPI_CSRT_SIGNATURE  SIGNATURE4('C', 'S', 'R', 'T')
#define ACPI_APIC_SIGNATURE  SIGNATURE4('A', 'P', 'I', 'C')
#define ACPI_BGRT_SIGNATURE  SIGNATURE4('B', 'G', 'R', 'T')
#define ACPI_GTDT_SIGNATURE  SIGNATURE4('G', 'T', 'D', 'T')
#define ACPI_TPM2_SIGNATURE  SIGNATURE4('T', 'P', 'M', '2')
#define ACPI_FPDT_SIGNATURE  SIGNATURE4('F', 'P', 'D', 'T')
#define ACPI_MCFG_SIGNATURE  SIGNATURE4('M', 'C', 'F', 'G')
#define ACPI_FACP_REVISION   0x05
#define ACPI_BGRT_REVISION   0x01
#define ACPI_FPDT_REVISION   0x01
#define ACPI_CSRT_REVISION   0x00
#define ACPI_TPM2_REVISION   0x03
#define ACPI_TPM2_QCOM_START_METHOD           0x9
#define ACPI_GTDT_REVISION   0x02

//
// <CSRT> //////////////////////////////////////////////////////
//


//
// Resource Group Header
//
typedef struct {
    UINT32  Length;             // Length of Group, including size of header.
    UINT32  VendorId;           // 4-char ID, 0 => No Vendor/Subvendor info
    UINT32  SubvendorId;        // 4-char ID, 0 => No Subvendor info
    UINT16  DeviceId;           // Additional PnP information...
    UINT16  SubdeviceId;
    UINT16  Revision;
    UINT16  Reserved;           // Reserved, must be 0.
    UINT32  SharedInfoLength;   // Length of appended info, 0 => no info
} CSRT_RESOURCE_GROUP_HEADER;

//
// Resource Descriptor Header
//
typedef struct {
    UINT32 Length;              // Length of Descriptor, including size of header.
    UINT16 ResourceType;        // Type, one of ACPI_CSRT_RESOURCE_TYPE_*
    UINT16 ResourceSubType;     // Subtype, one of ACPI_CSRT_RESOURCE_SUBTYPE_*
    UINT32 ResourceID;          // Unique (within Resource Group) Identifier
} CSRT_RESOURCE_DESCRIPTOR_HEADER;

#define CSRT_RD_TYPE_UNKNOWN                  0
#define CSRT_RD_TYPE_INTERRUPT                1
#define CSRT_RD_TYPE_TIMER                    2
#define CSRT_RD_TYPE_DMA                      3
#define CSRT_RD_TYPE_RESERVED                 0xFFFF

#define CSRT_RD_SUBTYPE_INTERRUPT_LINES       0
#define CSRT_RD_SUBTYPE_INTERRUPT_CONTROLLER  1
#define CSRT_RD_SUBTYPE_TIMER                 0
#define CSRT_RD_SUBTYPE_DMA_CHANNEL           0
#define CSRT_RD_SUBTYPE_DMA_CONTROLLER 1

#define CSRT_RD_UID_ANY 0xFFFF

//
// <BGRT> //////////////////////////////////////////////////////
//

/* ACPI 5.0 BGRT Structure */
typedef struct _BGRT_TABLE {
  ACPI_HEADER Header;
  UINT16 Version;
  UINT8 Status;
  UINT8 ImageType;
  UINT64 ImageAddress;
  UINT32 ImageOffsetX;
  UINT32 ImageOffsetY;
} BGRT_TABLE;

#define BGRT_IMAGE_VALID    0x01
#define BGRT_IMAGE_INVALID  0x00
#define BGRT_BITMAP_IMAGE   0x00

//
// <FPDT> //////////////////////////////////////////////////////
//

/* ACPI 5.0 FPDT Structure With One FBPT Performance Record*/
typedef struct _FPDT_TABLE {
  ACPI_HEADER Header;
  UINT16 PerformanceRecordType;
  UINT8 RecordLength;
  UINT8 RecordRevision;
  UINT32 RecordReserve;
  UINT64 FBPTPointer;
} FPDT_TABLE;

#define FBPT_RECORD_TYPE      0x0000
#define FBPT_RECORD_LENGTH    0x10
#define FBPT_RECORD_REVISION  0x01

#pragma pack()
