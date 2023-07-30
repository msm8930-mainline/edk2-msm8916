
//
// Copyright (c) 2013-2015 Qualcomm Technologies, Inc.  All Rights Reserved.
// Qualcomm Technologies Proprietary and Confidential.
//

//
// NOTE: The 3rd parameter (i.e. ComplianceRevision) must be >=2 for 64-bit integer support.
//
DefinitionBlock("DSDT.AML", "DSDT", 0x02, "QCOMM ", "MSM8916 ", 3)
{
    Scope(\_SB_) {		
	
        Include("dsdt_common.asl")
      //  Include("buses.asl")
		
	//	Include("cust_dsdt.asl")

        //Include("usb.asl")

        //Include("touch.asl")
	
        //Include("camera.asl")	
        //
        // BAM data mux (BAM DMUX)
        //
        Device (DMUX)
        {
            Name (_HID, "HID_DMUX")
            Name (_UID, 0)
        }

        // Thermal Zone devices depend on PEP (included in dsdt_common). Please be CAREFUL on location
	//	Include("thermal_zones.asl")
     
     //Include("data.asl")


        //
        //Qualcomm Diagnostic Consumer Interface
        //
        Device (QDCI)
        {
            Name (_DEP, Package(0x1)
            {
                \_SB_.SMD0
            })
           Name (_HID, "HID_QDCI")
        }

        //
        // SSM Driver
        //
        Device (SSM)
        {
            Name (_HID, "HID_SSM")
        }       

        // QCOM App Profiler: Used by performance team
        Device (PER0)
        {
            Name (_HID, "QCOM25A0")

        }
        
        // Storage - SD card
        //
        /*Device (SDC2)
        {
            Name (_DEP, Package(0x2) {
                \_SB_.PEP0,
                \_SB_.GIO0
            })

            Name (_HID, "QCOM2466")
            Name (_CID, "ACPI\QCOM2466")
            Name (_UID, 1)

            Method (_CRS, 0x0, NotSerialized) {
                Name (RBUF, ResourceTemplate ()
                {
                    // SDCC2 register address space
                    Memory32Fixed (ReadWrite, 0x7864900, 0x00000200)

                    Interrupt(ResourceConsumer, Level, ActiveHigh, Exclusive, , , ) {157}
                    GpioInt(Edge, ActiveBoth, SharedAndWake, PullNone, 30000, "\\_SB.GIO0", ,) {38}
                    Gpioio(Shared, PullNone, 0, 0, , "\\_SB.GIO0", ,) {38}
                })
                Return (RBUF)
            }
 
            Method(_DIS)
            {
                // Place holder to allow disable
            }
            Method (_STA) 
            {
                Return(0xF)
            }
        }*/
		
		//Include ("RHProxy.asl")
    }

}
