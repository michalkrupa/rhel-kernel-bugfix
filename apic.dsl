/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20210604 (64-bit version)
 * Copyright (c) 2000 - 2021 Intel Corporation
 * 
 * Disassembly of apic.dat, Mon May 19 23:14:15 2025
 *
 * ACPI Data Table [APIC]
 *
 * Format: [HexOffset DecimalOffset ByteLength]  FieldName : FieldValue
 */

[000h 0000   4]                    Signature : "APIC"    [Multiple APIC Description Table (MADT)]
[004h 0004   4]                 Table Length : 00000092
[008h 0008   1]                     Revision : 03
[009h 0009   1]                     Checksum : CC
[00Ah 0010   6]                       Oem ID : "ALASKA"
[010h 0016   8]                 Oem Table ID : "A M I"
[018h 0024   4]                 Oem Revision : 01072009
[01Ch 0028   4]              Asl Compiler ID : "AMI "
[020h 0032   4]        Asl Compiler Revision : 00010013

[024h 0036   4]           Local Apic Address : FEE00000
[028h 0040   4]        Flags (decoded below) : 00000001
                         PC-AT Compatibility : 1

    [000h 0000   1]                Subtable Type : 00 [Processor Local APIC]
    [001h 0001   1]                       Length : 08
    [002h 0002   1]                 Processor ID : 00
    [003h 0003   1]                Local Apic ID : 00
    [004h 0004   4]        Flags (decoded below) : 00000001
                               Processor Enabled : 1
                          Runtime Online Capable : 0

    [008h 0008   1]                Subtable Type : 00 [Processor Local APIC]
    [009h 0009   1]                       Length : 08
    [00Ah 0010   1]                 Processor ID : 01
    [00Bh 0011   1]                Local Apic ID : 01
    [00Ch 0012   4]        Flags (decoded below) : 00000001
                               Processor Enabled : 1
                          Runtime Online Capable : 0

    [010h 0016   1]                Subtable Type : 00 [Processor Local APIC]
    [011h 0017   1]                       Length : 08
    [012h 0018   1]                 Processor ID : 02
    [013h 0019   1]                Local Apic ID : 02
    [014h 0020   4]        Flags (decoded below) : 00000001
                               Processor Enabled : 1
                          Runtime Online Capable : 0

    [018h 0024   1]                Subtable Type : 00 [Processor Local APIC]
    [019h 0025   1]                       Length : 08
    [01Ah 0026   1]                 Processor ID : 03
    [01Bh 0027   1]                Local Apic ID : 03
    [01Ch 0028   4]        Flags (decoded below) : 00000001
                               Processor Enabled : 1
                          Runtime Online Capable : 0

    [020h 0032   1]                Subtable Type : 00 [Processor Local APIC]
    [021h 0033   1]                       Length : 08
    [022h 0034   1]                 Processor ID : 04
    [023h 0035   1]                Local Apic ID : 04
    [024h 0036   4]        Flags (decoded below) : 00000001
                               Processor Enabled : 1
                          Runtime Online Capable : 0

    [028h 0040   1]                Subtable Type : 00 [Processor Local APIC]
    [029h 0041   1]                       Length : 08
    [02Ah 0042   1]                 Processor ID : 05
    [02Bh 0043   1]                Local Apic ID : 05
    [02Ch 0044   4]        Flags (decoded below) : 00000001
                               Processor Enabled : 1
                          Runtime Online Capable : 0

    [030h 0048   1]                Subtable Type : 00 [Processor Local APIC]
    [031h 0049   1]                       Length : 08
    [032h 0050   1]                 Processor ID : 06
    [033h 0051   1]                Local Apic ID : 06
    [034h 0052   4]        Flags (decoded below) : 00000001
                               Processor Enabled : 1
                          Runtime Online Capable : 0

    [038h 0056   1]                Subtable Type : 00 [Processor Local APIC]
    [039h 0057   1]                       Length : 08
    [03Ah 0058   1]                 Processor ID : 07
    [03Bh 0059   1]                Local Apic ID : 07
    [03Ch 0060   4]        Flags (decoded below) : 00000001
                               Processor Enabled : 1
                          Runtime Online Capable : 0

[06Ch 0108   1]                Subtable Type : 01 [I/O APIC]
[06Dh 0109   1]                       Length : 0C
[06Eh 0110   1]                  I/O Apic ID : 08
[06Fh 0111   1]                     Reserved : 00
[070h 0112   4]                      Address : FEC00000
[074h 0116   4]                    Interrupt : 00000000

[078h 0120   1]                Subtable Type : 02 [Interrupt Source Override]
[079h 0121   1]                       Length : 0A
[07Ah 0122   1]                          Bus : 00
[07Bh 0123   1]                       Source : 00
[07Ch 0124   4]                    Interrupt : 00000002
[080h 0128   2]        Flags (decoded below) : 0000
                                    Polarity : 0
                                Trigger Mode : 0

[082h 0130   1]                Subtable Type : 02 [Interrupt Source Override]
[083h 0131   1]                       Length : 0A
[084h 0132   1]                          Bus : 00
[085h 0133   1]                       Source : 09
[086h 0134   4]                    Interrupt : 00000009
[08Ah 0138   2]        Flags (decoded below) : 000D
                                    Polarity : 1
                                Trigger Mode : 3

[08Ch 0140   1]                Subtable Type : 04 [Local APIC NMI]
[08Dh 0141   1]                       Length : 06
[08Eh 0142   1]                 Processor ID : FF
[08Fh 0143   2]        Flags (decoded below) : 0005
                                    Polarity : 1
                                Trigger Mode : 1
[091h 0145   1]         Interrupt Input LINT : 01

Raw Table Data: Length 146 (0x92)

    0000: 41 50 49 43 92 00 00 00 03 CC 41 4C 41 53 4B 41  // APIC......ALASKA
    0010: 41 20 4D 20 49 00 00 00 09 20 07 01 41 4D 49 20  // A M I.... ..AMI 
    0020: 13 00 01 00 00 00 E0 FE 01 00 00 00 00 08 01 00  // ................
    0030: 01 00 00 00 00 08 02 02 01 00 00 00 00 08 03 04  // ................
    0040: 01 00 00 00 00 08 04 06 01 00 00 00 00 08 05 01  // ................
    0050: 01 00 00 00 00 08 06 03 01 00 00 00 00 08 07 05  // ................
    0060: 01 00 00 00 00 08 08 07 01 00 00 00 01 0C 08 00  // ................
    0070: 00 00 C0 FE 00 00 00 00 02 0A 00 00 02 00 00 00  // ................
    0080: 00 00 02 0A 00 09 09 00 00 00 0D 00 04 06 FF 05  // ................
    0090: 00 01                                            // ..
