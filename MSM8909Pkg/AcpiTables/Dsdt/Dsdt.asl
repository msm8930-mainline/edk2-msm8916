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


//
// Copyright (c) 2013-2015 Qualcomm Technologies, Inc.  All Rights Reserved.
// Qualcomm Technologies Proprietary and Confidential.
//

//
// NOTE: The 3rd parameter (i.e. ComplianceRevision) must be >=2 for 64-bit integer support.
//
/* Minimum DSDT for WoA boot */

DefinitionBlock("DSDT.AML", "DSDT", 0x02, "QCOMM ", "MSM8916 ", 3)
{
	/* CPU */
	Scope(\_SB_)
	{
		/* 8 CPU Cores */
		Device(CPU0) 
		{
			Name(_HID, "ACPI0007")
			Name(_UID, 0)
		}
		Device(CPU1) 
		{
			Name(_HID, "ACPI0007")
			Name(_UID, 1)
		}
		Device(CPU2) 
		{
			Name(_HID, "ACPI0007")
			Name(_UID, 2)
		}
		Device(CPU3) 
		{
			Name(_HID, "ACPI0007")
			Name(_UID, 3)
		}
	}

	/* EMMC */
	Device (SDC1)
	{
		Name (_HID, "QCOM2466")
		Name (_CID, "ACPI\QCOM2466")
		Name (_UID, Zero)  // _UID: Unique ID
		Name (_CCA, Zero)  // _CCA: Cache Coherency Attribute

		Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
		{
			Name (RBUF, ResourceTemplate ()
			{
				Memory32Fixed (ReadWrite,
				0x07824900,	 // Address Base
				0x00000200,	 // Address Length
				)
				Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, ,, )
				{
					155,
				}
			})
			Return (RBUF) /* \_SB_.SDC1._CRS.RBUF */
		}

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

		Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
		{
		}

		Method (_STA, 0, NotSerialized)  // _STA: Status
		{
			Return (0x0F)
		}
	}

	Device (SDC2)
	{
		Name (_HID, "QCOM2466")
		Name (_CID, "ACPI\QCOM2466")
		Name (_UID, 1)  // _UID: Unique ID
		Name (_CCA, Zero)  // _CCA: Cache Coherency Attribute

		Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
		{
			Name (RBUF, ResourceTemplate ()
			{
				Memory32Fixed (ReadWrite,
					0x07864900,	 // Address Base
					0x00000200,	 // Address Length
				)
				Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, ,, )
				{
					157,
				}
			})
			Return (RBUF) /* \_SB_.SDC1._CRS.RBUF */
		}

		Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
		{
		}

		Method (_STA, 0, NotSerialized)  // _STA: Status
		{
			Return (0x0F)
		}
	}
}
