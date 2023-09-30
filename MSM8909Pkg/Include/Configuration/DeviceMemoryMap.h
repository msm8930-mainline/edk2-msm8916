#ifndef _DEVICE_MEMORY_MAP_H_
#define _DEVICE_MEMORY_MAP_H_

#include <PiPei.h>

#include <Library/ArmLib.h>
#include <Library/HobLib.h>
#include <Library/MemoryAllocationLib.h>
#include <Library/BaseLib.h>

#define MAX_ARM_MEMORY_REGION_DESCRIPTOR_COUNT 64

/* Below flag is used for system memory */
#define SYSTEM_MEMORY_RESOURCE_ATTR_CAPABILITIES                               \
  EFI_RESOURCE_ATTRIBUTE_PRESENT | EFI_RESOURCE_ATTRIBUTE_INITIALIZED |        \
      EFI_RESOURCE_ATTRIBUTE_TESTED | EFI_RESOURCE_ATTRIBUTE_UNCACHEABLE |     \
      EFI_RESOURCE_ATTRIBUTE_WRITE_COMBINEABLE |                               \
      EFI_RESOURCE_ATTRIBUTE_WRITE_THROUGH_CACHEABLE |                         \
      EFI_RESOURCE_ATTRIBUTE_WRITE_BACK_CACHEABLE |                            \
      EFI_RESOURCE_ATTRIBUTE_EXECUTION_PROTECTABLE

typedef enum { NoHob, AddMem, AddDev, HobOnlyNoCacheSetting, MaxMem } DeviceMemoryAddHob;

#define MEMORY_REGION_NAME_MAX_LENGTH 32

typedef struct {
  CHAR8                        Name[MEMORY_REGION_NAME_MAX_LENGTH];
  EFI_PHYSICAL_ADDRESS         Address;
  UINT64                       Length;
  DeviceMemoryAddHob           HobOption;
  EFI_RESOURCE_TYPE            ResourceType;
  EFI_RESOURCE_ATTRIBUTE_TYPE  ResourceAttribute;
  EFI_MEMORY_TYPE              MemoryType;
  ARM_MEMORY_REGION_ATTRIBUTES ArmAttributes;
} ARM_MEMORY_REGION_DESCRIPTOR_EX, *PARM_MEMORY_REGION_DESCRIPTOR_EX;

#define MEM_RES EFI_RESOURCE_MEMORY_RESERVED
#define MMAP_IO EFI_RESOURCE_MEMORY_MAPPED_IO
#define SYS_MEM EFI_RESOURCE_SYSTEM_MEMORY

#define SYS_MEM_CAP SYSTEM_MEMORY_RESOURCE_ATTR_CAPABILITIES
#define INITIALIZED EFI_RESOURCE_ATTRIBUTE_INITIALIZED
#define WRITE_COMBINEABLE EFI_RESOURCE_ATTRIBUTE_WRITE_COMBINEABLE
#define UNCACHEABLE EFI_RESOURCE_ATTRIBUTE_UNCACHEABLE

#define Reserv EfiReservedMemoryType
#define Conv EfiConventionalMemory
#define BsData EfiBootServicesData
#define RtData EfiRuntimeServicesData
#define LdData EfiLoaderData
#define MmIO EfiMemoryMappedIO
#define MaxMem EfiMaxMemoryType
#define BsCode EfiBootServicesCode
#define RtCode EfiRuntimeServicesCode

#define NS_DEVICE ARM_MEMORY_REGION_ATTRIBUTE_DEVICE
#define WRITE_THROUGH ARM_MEMORY_REGION_ATTRIBUTE_WRITE_THROUGH
#define WRITE_THROUGH_XN ARM_MEMORY_REGION_ATTRIBUTE_WRITE_THROUGH
#define WRITE_BACK ARM_MEMORY_REGION_ATTRIBUTE_WRITE_BACK
#define WRITE_BACK_XN ARM_MEMORY_REGION_ATTRIBUTE_WRITE_BACK
#define UNCACHED_UNBUFFERED ARM_MEMORY_REGION_ATTRIBUTE_UNCACHED_UNBUFFERED
#define UNCACHED_UNBUFFERED_XN ARM_MEMORY_REGION_ATTRIBUTE_UNCACHED_UNBUFFERED

static ARM_MEMORY_REGION_DESCRIPTOR_EX gDeviceMemoryDescriptorEx[] = {
    /* Name               Address     Length      HobOption        ResourceAttribute    ArmAttributes
                                                          ResourceType          MemoryType */

    /* DDR Regions */
    {"Peripherals",       0x00000000, 0x80000000, AddMem, MEM_RES, UNCACHEABLE,  RtCode, NS_DEVICE}, // todo?

    {"UEFI FD",           0x80080000, 0x00200000, AddMem, SYS_MEM, SYS_MEM_CAP,  BsCode, WRITE_BACK},
    {"MPPark Code",0x80300000, 0x00040000,       AddMem, MEM_RES, UNCACHEABLE, RtCode, UNCACHED_UNBUFFERED},
    { "HLOS 2",  0x80340000, 0x00040000,           AddMem, SYS_MEM, SYS_MEM_CAP, BsData, UNCACHED_UNBUFFERED},
    {"FBPT Payload", 0x80380000, 0x00001000,      AddMem, SYS_MEM, SYS_MEM_CAP, RtData, UNCACHED_UNBUFFERED},
    {"DBG2", 0x80381000, 0x00004000,              AddMem, SYS_MEM, SYS_MEM_CAP, LdData, UNCACHED_UNBUFFERED},
    {"Capsule Header", 0x80385000, 0x00001000,     AddMem, SYS_MEM, SYS_MEM_CAP, RtData, UNCACHED_UNBUFFERED},
    {"TPM Control Area", 0x80386000, 0x00003000,  AddMem, SYS_MEM, SYS_MEM_CAP, RtData, UNCACHED_UNBUFFERED},
//{"UEFI Info Block", 0x80389000, 0x00001000,    AddMem, SYS_MEM, SYS_MEM_CAP, RtData, UNCACHED_UNBUFFERED},
//{"Reset Data",   0x8038A000, 0x00004000,      AddMem, SYS_MEM, SYS_MEM_CAP, RtData, UNCACHED_UNBUFFERED},
    {"Reser. Uncached0", 0x8038E000, 0x00072000,  AddMem, SYS_MEM, SYS_MEM_CAP, BsData, UNCACHED_UNBUFFERED},
//{"UEFI Stack",  0x80C00000, 0x00040000,       AddMem, SYS_MEM, SYS_MEM_CAP, BsData, WRITE_BACK},
    {"CPU Vectors", 0x80C40000, 0x00010000,       AddMem, SYS_MEM, SYS_MEM_CAP, BsCode, WRITE_BACK},
    {"Reser. Cached 0",0x80C50000, 0x000B0000,    AddMem, SYS_MEM, SYS_MEM_CAP, BsData, WRITE_BACK},
//{ "HLOS 3",  0x80D00000, 0x03300000,          AddMem, SYS_MEM, SYS_MEM_CAP, BsData, WRITE_BACK},
    //{"HLOS 4",  0x84000000, 0x02000000,          AddMem, SYS_MEM, SYS_MEM_CAP, Conv,   WRITE_BACK},
    {"TZ Apps",0x86000000, 0x00300000,           AddMem, SYS_MEM, SYS_MEM_CAP, Reserv, NS_DEVICE},
    {"SMEM", 0x86300000, 0x00100000,              AddMem, MEM_RES, UNCACHEABLE, Reserv, UNCACHED_UNBUFFERED},
    {"TZ/HYP", 0x86400000, 0x00280000,           AddMem, SYS_MEM, SYS_MEM_CAP, Reserv, NS_DEVICE},
    {"HLOS 5", 0x86680000, 0x00080000,           AddMem, SYS_MEM, SYS_MEM_CAP, Conv,   WRITE_BACK},
    {"MPSS/EFS/DHMS/PIL", 0x86700000, 0x06C00000, AddMem, SYS_MEM, SYS_MEM_CAP, Reserv, NS_DEVICE},

    {"Display Reserved",  0x8e000000, 0x00800000, AddMem, MEM_RES, WRITE_THROUGH,MaxMem, WRITE_THROUGH},

    /* RAM partition regions */
    {"RAM Partition",     0x8cb00000, 0x01500000, AddMem, SYS_MEM, SYS_MEM_CAP,  Conv,   WRITE_BACK_XN},
    /* Avoid Display Reserved */
    {"RAM Partition",     0x8e800000, 0x11700000, AddMem, SYS_MEM, SYS_MEM_CAP,  Conv,   WRITE_BACK_XN},
    /* carveout */
    {"RAM Partition",     0xa0000000, 0x10000000, AddMem, SYS_MEM, SYS_MEM_CAP,  Conv,   WRITE_BACK_XN},
    /* carveout */
    {"RAM Partition",     0xc0000000, 0x30000000, AddMem, SYS_MEM, SYS_MEM_CAP, Conv,   WRITE_BACK_XN},

    /* Terminator for MMU */
    {"Terminator", 0, 0, 0, 0, 0, 0, 0}};

#endif
