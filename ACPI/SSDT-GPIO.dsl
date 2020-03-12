/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20180427 (64-bit version)(RM)
 * Copyright (c) 2000 - 2018 Intel Corporation
 * 
 * Disassembling to non-symbolic legacy ASL operators
 *
 * Disassembly of iASLdO7hbW.aml, Wed Mar 11 22:43:08 2020
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x00000053 (83)
 *     Revision         0x02
 *     Checksum         0xE3
 *     OEM ID           "hack"
 *     OEM Table ID     "I2C"
 *     OEM Revision     0x00000000 (0)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20190509 (538510601)
 */
DefinitionBlock ("", "SSDT", 2, "hack", "I2C", 0x00000000)
{
    External (_SB_.PCI0.GPI0, DeviceObj)    // (from opcode)

    Scope (_SB.PCI0.GPI0)
    {
        Method (_STA, 0, NotSerialized)  // _STA: Status
        {
            Return (0x0F)
        }
    }
}

