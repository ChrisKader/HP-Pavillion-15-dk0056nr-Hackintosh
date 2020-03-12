/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20180427 (64-bit version)(RM)
 * Copyright (c) 2000 - 2018 Intel Corporation
 * 
 * Disassembling to non-symbolic legacy ASL operators
 *
 * Disassembly of iASLEgiklp.aml, Wed Mar 11 22:45:42 2020
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x0000014D (333)
 *     Revision         0x02
 *     Checksum         0xCA
 *     OEM ID           "ACDT"
 *     OEM Table ID     "XOSI"
 *     OEM Revision     0x00001000 (4096)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20191018 (538513432)
 */
DefinitionBlock ("", "SSDT", 2, "ACDT", "XOSI", 0x00001000)
{
    Method (XOSI, 1, NotSerialized)
    {
        Store (Package (0x11)
            {
                "Windows 2001", 
                "Windows 2001.1", 
                "FreeBSD", 
                "HP-UX", 
                "OpenVMS", 
                "Windows 2001 SP1", 
                "Windows 2001 SP2", 
                "Windows 2001 SP3", 
                "Windows 2006", 
                "Windows 2006 SP1", 
                "Windows 2009", 
                "Windows 2012", 
                "Windows 2013", 
                "Microsoft Windows NT", 
                "Microsoft Windows", 
                "Microsoft WindowsME: Millennium Edition", 
                "Linux"
            }, Local0)
        Return (LNotEqual (Ones, Match (Local0, MEQ, Arg0, MTR, Zero, Zero)))
    }
}

