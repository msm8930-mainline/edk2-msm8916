
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

        // Include("buses.asl")
		
	// Include("cust_dsdt.asl")

        // Include("usb.asl")

        // Include("touch.asl")
	
        // Include("camera.asl")


        // Thermal Zone devices depend on PEP (included in dsdt_common). Please be CAREFUL on location
	//	Include("thermal_zones.asl")
     
        // Include("data.asl")
        
		
        // Include ("RHProxy.asl")
    }

}
