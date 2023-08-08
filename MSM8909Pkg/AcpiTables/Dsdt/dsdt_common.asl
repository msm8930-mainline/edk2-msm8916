/** @file
  Differentiated System Description Table Fields (DSDT)

  Copyright (c) 2014-2018, ARM Ltd. All rights reserved.<BR>
  Copyright (c) 2019-2020, Bingxing Wang. All rights reserved.<BR>
  Copyright (c) 2022-2023, Ivaylo Ivanov. All rights reserved.<BR>
  Portion retrieved from NintendoSwitchPkg

  This program and the accompanying materials are licensed and made available under 
  the terms and conditions of the BSD License which accompanies this distribution.  
  The full text of the license may be found at
  http://opensource.org/licenses/bsd-license.php

  THE PROGRAM IS DISTRIBUTED UNDER THE BSD LICENSE ON AN "AS IS" BASIS,
  WITHOUT WARRANTIES OR REPRESENTATIONS OF ANY KIND, EITHER EXPRESS OR IMPLIED.

**/

// These should be overwritten by UEFI with the correct values.
Name(SOID, 0xffffffff)          // Holds the Chip Id
Name(SIDS, "891600000000000")   // Holds the Chip ID translated to a string
Name(SIDV, 0xffffffff)          // Holds the Chip Version as (major<<16)|(minor&0xffff)
Name(SVMJ, 0xffff)              // Holds the major Chip Version
Name(SVMI, 0xffff)              // Holds the minor Chip Version
Name(SDFE, 0xffff)              // Holds the Chip Family enum
Name(SFES, "891600000000000")   // Holds the Chip Family translated to a string
Name(SIDM, 0xffffffff)          // Holds the Modem Support bit field

//
// TLMM controller.
//

Device (GIO0)
{
    Name (_HID, "QCOM2405")
    Name (_UID, 0)

    Method (_CRS, 0x0, NotSerialized) {
        Name (RBUF, ResourceTemplate ()
        {
           // TLMM register address space
            Memory32Fixed (ReadWrite, 0x01000000, 0x00300000)

            // Summary Interrupt shared by all banks
            Interrupt(ResourceConsumer, Level, ActiveHigh, Shared, , , ) {240}
            Interrupt(ResourceConsumer, Level, ActiveHigh, Shared, , , ) {240}
        })
        Return (RBUF)
    }
    // ACPI method to return Num pins
    Method(OFNI, 0x0, NotSerialized) {
        Name(RBUF, Buffer()
        {    
            0x7A,  // 0: TOTAL_GPIO_PINS
            0x00   // 1: TOTAL_GPIO_PINS
        })
        Return (RBUF)
    }
}

//
// CPUs
//
Device(CPU0)
{
	Name (_HID, "ACPI0007")
	Name (_UID, 0)
}

#if 0
Device(CPU1)
{
	Name (_HID, "ACPI0007")
	Name (_UID, 1)
}
Device(CPU2)
{
	Name (_HID, "ACPI0007")
	Name (_UID, 2)
}
Device(CPU3)
{
	Name (_HID, "ACPI0007")
	Name (_UID, 3)
}

#endif

#if 0

//
//SPMI driver.
//

Device(SPMI)
{
    Name(_HID, "HID_SPMI")
    Name(_UID, One)
    Method(_CRS, 0x0, NotSerialized)
    {
        Name(RBUF, ResourceTemplate ()
        {
            Memory32Fixed(ReadWrite, 0x02000000, 0x01200000)
        })
        Return(RBUF)
    }
    Method (CONF)
    {
        Name (XBUF, Buffer ()
        {
            0x0, // uThisOwnerNumber
            0x1  // Polling Mode  
        })
        Return (XBUF)
    }
}

#endif

#if 0

//
// SMEM
//
Device (SMD0)
{
    Name (_HID, "HID_SMD0")
    Name (_UID, 0)

    Method (_CRS, 0x0, NotSerialized) {
        Name (RBUF, ResourceTemplate ()
        {
            // Shared memory
            Memory32Fixed (ReadWrite, 0x86300000, 0x00100000)

            // Hardware mutexes used to synchronize processors:
            // HWIO_TCSR_MUTEX_MUTEX_REGn_PHYS(0)
            Memory32Fixed (ReadWrite, 0x1905000, 0x00020000)

            // IMEM or TZ_WONCE
            Memory32Fixed (ReadWrite, 0x0193D000, 0x00000008);

            // RPM MSG RAM
            Memory32Fixed (ReadWrite, 0x00060000, 0x00004000);

            // The rest of the memory resources are those used by SMD
            // and SMSM to send interrupts

            // APCS_IPC
            Memory32Fixed (ReadWrite, 0x0B011008, 0x00000004)

            // Inbound interrupt from modem:
            // mss_sw_to_kpss_ipc_irq0 = CsrIrq0 = 57
            Interrupt(ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {57}

            // Inbound interrupt from wcnss:
            // o_wcss_apss_smd_med = WcssAppsSmdMedIrq = 174
            Interrupt(ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {174}

            // Inbound SMP2Pinterrupt from modem:
            Interrupt(ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {59}

            // Inbound SMP2P interrupt from wcnss:
            Interrupt(ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {175}

            // Inbound SMSM interrupt from modem:
            // mss_sw_to_kpss_ipc_irq1 = CsrIrq1 = 50
            Interrupt(ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {58}

            // Inbound SMSM interrupt from WCNSS:
            // o_wcss_apss_smsm_irq = WcssApssSmsmIrq = 176
            Interrupt(ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {176}
        })
        Return (RBUF)
    }

    // ACPI method to return interrupt descriptor
    Method(INTR, 0x0, NotSerialized) {
        Name(RBUF, Package()
        {
            // Version
            0x00000003,
            // Number of SMD interrupts
            0x00000002,
            // Number of SMP2P interrupts
            0x00000002,
            // Number of SMSM interrupts
            0x00000002,

            // Modem: APCS_IPC(12)
            // Host = SMEM_MODEM
            0x00000001,
            // Physical address
            0x0B011008,
            // Value
            0x00001000,
            // Reserved
            0x00000000,

            // WCNSS: APCS_IPC(17)
            // Host = SMEM_WCNSS
            0x00000004,
            // Physical address
            0x0B011008,
            // Value
            0x00020000,
            // Reserved
            0x00000000,

            // Modem: APCS_IPC(14)
            // Host = SMEM_MODEM
            0x00000001,
            // Physical address
            0x0B011008,
            // Value
            0x00004000,
            // Reserved
            0x00000000,

            // WCNSS: APCS_IPC(18)
            // Host = SMEM_WCNSS
            0x00000004,
            // Physical address
            0x0B011008,
            // Value
            0x00040000,
            // Reserved
            0x00000000,

            // Modem: APCS_IPC(13)
            // Host = SMSM_MODEM
            0x00000001,
            // Physical address
            0x0B011008,
            // Value
            0x00002000,
            // Reserved
            0x00000000,

            // WCNSS (RIVA): APCS_IPC(19)
            // Host = SMSM_WCNSS
            0x00000003,
            // Physical address
            0x0B011008,
            // Value
            0x00080000,
            // Reserved
            0x00000000,
        })
        Return (RBUF)
    }
}

#endif

Device (EMMC)
{
	Method (_ADR, 0, NotSerialized)  // _ADR: Address
	{
		Return (0x08)
	}

	Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
	{
		Return (Zero)
	}
}

//
// WWAN Coexistence Manager
//
Device (COEX)
{
    Name (_HID, "QCOM2487")
}

