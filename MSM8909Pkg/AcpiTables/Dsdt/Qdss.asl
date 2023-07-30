//
// QDSS device
//
Device (QDSS)
{
    Name (_DEP, Package () { \_SB_.PEP0 })

    Name (_HID, "HID_QDSS")
    Name (_UID, 0)

    Method (_CRS, 0x0, NotSerialized)
    {
        Return
        (
            ResourceTemplate ()
            {
                Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {198}   // The ETR byte counter interrupt qdss_etrbytecnt_irq, according to ipcat.
                Memory32Fixed (ReadWrite, 0x00800000, 0x000A0000)                       // The QDSS_QDSS address space, according to QDSS address map
                Memory32Fixed (ReadWrite, 0x09000000, 0x01000000)                       // The STM Stimulus port address space, according to memory map on ipcat
            }
        )
    }

    // The CHPD method returns a 32-bit value that allows us to tweak things on
    // a chip-by-chip basis. Goal is not to use this, but it's handy during
    // bring up.

    Method (CHPD)
    {
        Return (0x00000000)
    }

    // The PWRV method returns the version of the power model that is in use by
    // this chip. If 0 (or this method is missing), the QDSS driver will use
    // the default F-state-only power model. If 1, the QDSS driver will use the
    // F-state-and-P-state model.

    Method (PWRV)
    {
        Return (0x1)
    }

    // The ETMV method returns value indicating how to program the ETM registers that is in use by
    // this SoC. Following version numbers are in sync with QDSS_ETM_VER_ENUM as defined in
    // halqdss_ptm.h .
    // If 0 (or this method is missing), the QDSS driver will use the default way of
    // writing/reading ETM registers, eg. co-processor commands. This version works for cortex (8974).
    // If 1, the QDSS driver will use the memory map model. This version works for A7 (8x26).
    // When co-processor command is used, PEP driver needs to save/restore the register values
    // across power collapse; With memory map model, PEP driver needs to keep QDSS clocks on
    // during power collapse (This is not ideal, and it is being discussed with ARM).

    Method (ETMV)
    {
        Return (0x4) // A53 has ETMv4 HW
    }

    // The OFFS method returns the offset and size of each register block
    // within the QDSS. This also returns the type of register block
    // the block types can be 0 - nonCTI; 1 - CTI
    // ECT-UPDATE-FILE
    // Block Type: 0 -NORMAL_BLOCK,
    //             1 -CTI_BLOCK,
    //             2 -ETM_BLOCK,
    //             3 -FUNNEL_BLOCK,
    // Address Base: Since now some projects' qdss has some base address spaces for block 
    // pls refer :Method _CRS and put the block's base address space into "Address Base" area.

    Method (OFFS)
    {
        Return
        (
            Package ()
            {
                //         { "Block Name",  Offset,     Size,       Block Type ,Address Base},
                Package () { "DAPROM",      0x00000000, 0x00001000, 0x0 ,       0x00800000},
                Package () { "CSR",         0x00001000, 0x00001000, 0x0 ,       0x00800000},
                Package () { "STM",         0x00002000, 0x00001000, 0x0 ,       0x00800000},
                Package () { "CTI0",        0x00010000, 0x00001000, 0x1 ,       0x00800000},
                Package () { "CTI1",        0x00011000, 0x00001000, 0x1 ,       0x00800000},
                Package () { "CTI2",        0x00012000, 0x00001000, 0x1 ,       0x00800000},
                Package () { "CTI3",        0x00013000, 0x00001000, 0x1 ,       0x00800000},
                Package () { "CTI4",        0x00014000, 0x00001000, 0x1 ,       0x00800000},
                Package () { "CTI5",        0x00015000, 0x00001000, 0x1 ,       0x00800000},
                Package () { "CTI6",        0x00016000, 0x00001000, 0x1 ,       0x00800000},
                Package () { "CTI7",        0x00017000, 0x00001000, 0x1 ,       0x00800000},
                Package () { "CTI8",        0x00018000, 0x00001000, 0x1 ,       0x00800000},
                Package () { "TPIU",        0x00020000, 0x00001000, 0x0 ,       0x00800000},
                Package () { "IN_FUN0",     0x00021000, 0x00001000, 0x3 ,       0x00800000},
                Package () { "REPLICATOR",  0x00024000, 0x00001000, 0x0 ,       0x00800000},
                Package () { "ETFETB",      0x00025000, 0x00001000, 0x0 ,       0x00800000},
                Package () { "ETR",         0x00026000, 0x00001000, 0x0 ,       0x00800000},
				Package () { "VIDEO_CPU0",  0x00030000, 0x00001000, 0x1 ,       0x00800000},
				Package () { "ETM_PRONTO",  0x00034000, 0x00001000, 0x0 ,       0x00800000},
				Package () { "WCN_CPU0",    0x00035000, 0x00001000, 0x1 ,       0x00800000},
				Package () { "MODEM_CPU0",  0x00038000, 0x00001000, 0x1 ,       0x00800000},
				Package () { "RPM_CPU0",    0x0003C000, 0x00001000, 0x1 ,       0x00800000},
				Package () { "A53_APB",     0x00040000, 0x00001000, 0x0 ,       0x00800000},
				Package () { "A53_FUN",     0x00041000, 0x00001000, 0x3 ,       0x00800000},
                Package () { "CPU0",        0x00058000, 0x00001000, 0x1 ,       0x00800000},
                Package () { "CPU1",        0x00059000, 0x00001000, 0x1 ,       0x00800000},
                Package () { "CPU2",        0x0005A000, 0x00001000, 0x1 ,       0x00800000},
                Package () { "CPU3",        0x0005B000, 0x00001000, 0x1 ,       0x00800000},
                Package () { "ETM",         0x0005C000, 0x00001000, 0x2 ,       0x00800000}, // It is the start of ETM, 8916 has 4 core with its own ETM.Each size if 0x1000)
                Package () { "ETM_1",       0x0005D000, 0x00001000, 0x2 ,       0x00800000}, 
                Package () { "ETM_2",       0x0005E000, 0x00001000, 0x2 ,       0x00800000},
                Package () { "ETM_3",       0x0005F000, 0x00001000, 0x2 ,       0x00800000},
                Package () { "FUN_2X1",     0x00068000, 0x00001000, 0x3 ,       0x00800000}, //HW name: 2X1_FUN
                Package () { "FUN_8X1",     0x00069000, 0x00001000, 0x3 ,       0x00800000}, //HW name: 8X1_FUN
            }
        )
    }

    // The S2FP (Source To Funnel Port) method maps a source to the funnel and
    // port.

    Method (S2FP)
    {
        Return
        (
            Package ()
            {
                Package ()
                {
                    "STM",
                    Package () { "IN_FUN0",     7 },
                },
                Package ()
                {
                    "ETM",
                    Package () { "IN_FUN0",     4 },
                    Package () { "A53_FUN",     0 },
                    Package () { "A53_FUN",     1 },
                    Package () { "A53_FUN",     2 },
                    Package () { "A53_FUN",     3 },					
                },
                Package ()
                {
                    "BUS",
                    Package () { "IN_FUN0",     2 }, //MSSQ6
                    Package () { "IN_FUN0",     3 }, //VENUS
                    Package () { "IN_FUN0",     6 }, //FUN_8X1 output
                    Package () { "FUN_8X1",     0 }, //mdp_vbif mdss
                    Package () { "FUN_8X1",     1 }, //vfe_vbif camss
                    Package () { "FUN_8X1",     2 }, //jpeg_vbif camss
                    Package () { "FUN_8X1",     3 }, //bimc_vbif bimc
                    Package () { "FUN_8X1",     4 }, //mss_vbif modem
                    Package () { "FUN_8X1",     5 }, //snoc
                    Package () { "FUN_8X1",     6 }, //pnoc
                    Package () { "FUN_8X1",     7 }, //FUN_2X1 output
                    Package () { "FUN_2X1",     0 }, //pronto wcnss
                    Package () { "FUN_2X1",     1 }, //oxili_vbif gpu
                },
                Package ()
                {
                    "GFX",
                    Package () { "IN_FUN0",     5 }, //OXILI
                },
            }
        )
    }

    // The HWEV method holds the base addresses and the sizes of the subsystems
    // muxes that are needed to be turned on for collecting the hardware events
    // from the corresponding subsystems.
    // "Address" and "Length" are used to validate if address from QTF is in range
    // "Set" value must match the enum QDSS_HWEVT_PSTATES_ENUM defined in qdssPower.h
    //   0xFF means this mux block has the clock already turned on and doesnt need p-state
    //   It takes values in increments of 2 as in {0,2,4,6,8,... ,etc}
    // "Qdss-Csr" - 1 if it is a Qdss CSR register block or 0 if it is a subsystem block
    Method (HWEV)
    {
        Return
        (
            Package ()
            {
                //              Address, Length,  Set, Qdss-Csr
                Package () { 0x00801020,   0x10,  0x0,   1}, // QDSS CSR - GLOBAL SYS MUX base address
                Package () { 0x0086CFB0,   0x04,  0x0,   0}, // QDSS_WRAPPER - Lock Access Register
                Package () { 0x0086C000,   0xC0,  0x0,   0}, // QDSS_WRAPPER base address and size
            }
        )
    }
}
