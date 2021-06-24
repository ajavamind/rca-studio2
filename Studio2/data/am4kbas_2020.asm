; Origin set to 00000H, EOF = 00FFFH
		ORG  00000H

; CPU Type:
		CPU 1802

; Labels:
R002C	EQU 002CH
R002D	EQU 002DH
R003E	EQU 003EH
R004A	EQU 004AH
R005C	EQU 005CH
R006C	EQU 006CH
R0074	EQU 0074H
R007A	EQU 007AH
R0088	EQU 0088H
R00A3	EQU 00A3H
R00A8	EQU 00A8H
R00C2	EQU 00C2H
R00DA	EQU 00DAH
R00EF	EQU 00EFH
R00F7	EQU 00F7H
S0100	EQU 0100H
R0103	EQU 0103H
R0104	EQU 0104H
R0106	EQU 0106H
S0120	EQU 0120H
R0123	EQU 0123H
S0126	EQU 0126H
S0133	EQU 0133H
S013E	EQU 013EH
S0143	EQU 0143H
S0147	EQU 0147H
S0152	EQU 0152H
S0156	EQU 0156H
S0161	EQU 0161H
R0166	EQU 0166H
R016C	EQU 016CH
R0175	EQU 0175H
R0179	EQU 0179H
R017C	EQU 017CH
S017F	EQU 017FH
R0181	EQU 0181H
R0188	EQU 0188H
R018A	EQU 018AH
R018D	EQU 018DH
R0195	EQU 0195H
S019A	EQU 019AH
R01A1	EQU 01A1H
S01A6	EQU 01A6H
R01AB	EQU 01ABH
R01B4	EQU 01B4H
R01BA	EQU 01BAH
R01BE	EQU 01BEH
S01C0	EQU 01C0H
S01C3	EQU 01C3H
S01CD	EQU 01CDH
S01D7	EQU 01D7H
R01DF	EQU 01DFH
S01E1	EQU 01E1H
S01E6	EQU 01E6H
S01ED	EQU 01EDH
S01F5	EQU 01F5H
S01FD	EQU 01FDH
S0220	EQU 0220H
R025C	EQU 025CH
R0276	EQU 0276H
R028B	EQU 028BH
S0293	EQU 0293H
S02B6	EQU 02B6H
R02BD	EQU 02BDH
S02CC	EQU 02CCH
R02D4	EQU 02D4H
S02DC	EQU 02DCH
S02F2	EQU 02F2H
S02F8	EQU 02F8H
S0300	EQU 0300H
R0320	EQU 0320H
R032A	EQU 032AH
R0336	EQU 0336H
R033E	EQU 033EH
R0350	EQU 0350H
R035B	EQU 035BH
R036C	EQU 036CH
R0370	EQU 0370H
R037D	EQU 037DH
S0389	EQU 0389H
S038D	EQU 038DH
S0394	EQU 0394H
S03D4	EQU 03D4H
R03DC	EQU 03DCH
S03E5	EQU 03E5H
S03EC	EQU 03ECH
R03EE	EQU 03EEH
R03F0	EQU 03F0H
S0400	EQU 0400H
R040E	EQU 040EH
R0415	EQU 0415H
R0425	EQU 0425H
S0436	EQU 0436H
R0446	EQU 0446H
R0449	EQU 0449H
R0450	EQU 0450H
R0457	EQU 0457H
R0465	EQU 0465H
S0470	EQU 0470H
R0478	EQU 0478H
R047A	EQU 047AH
R0484	EQU 0484H
R0487	EQU 0487H
R0489	EQU 0489H
R0492	EQU 0492H
R0493	EQU 0493H
S0497	EQU 0497H
S049E	EQU 049EH
S04A4	EQU 04A4H
S04AD	EQU 04ADH
S04B1	EQU 04B1H
S04B4	EQU 04B4H
S04BA	EQU 04BAH
S04BD	EQU 04BDH
S04C0	EQU 04C0H
S04C5	EQU 04C5H
S04CA	EQU 04CAH
S04CF	EQU 04CFH
R04DB	EQU 04DBH
S04DF	EQU 04DFH
S04ED	EQU 04EDH
S04F3	EQU 04F3H
R04F8	EQU 04F8H
S056E	EQU 056EH
S05C9	EQU 05C9H
R05CE	EQU 05CEH
R05E2	EQU 05E2H
R05EA	EQU 05EAH
R05ED	EQU 05EDH
S05F2	EQU 05F2H
S0605	EQU 0605H
S0752	EQU 0752H
R0756	EQU 0756H
S079F	EQU 079FH
S0898	EQU 0898H
S08DC	EQU 08DCH
S08EA	EQU 08EAH
S09D6	EQU 09D6H
S09DD	EQU 09DDH
S09E3	EQU 09E3H
S09ED	EQU 09EDH
S09F6	EQU 09F6H
S0A50	EQU 0A50H
S0A93	EQU 0A93H
S0AEE	EQU 0AEEH
S0B1E	EQU 0B1EH
S0B2D	EQU 0B2DH
S0B43	EQU 0B43H
S0B6E	EQU 0B6EH
S0BAA	EQU 0BAAH
S0BAE	EQU 0BAEH
S0D09	EQU 0D09H
S0D87	EQU 0D87H
S0DFF	EQU 0DFFH
S0E85	EQU 0E85H
S0F69	EQU 0F69H
R0F73	EQU 0F73H
S0F7E	EQU 0F7EH
R0F8E	EQU 0F8EH
R0F9B	EQU 0F9BH
R0F9F	EQU 0F9FH
R0FA7	EQU 0FA7H
R0FB1	EQU 0FB1H
S0FB8	EQU 0FB8H
R0FCB	EQU 0FCBH
R0FD6	EQU 0FD6H
R0FE0	EQU 0FE0H
R0FEE	EQU 0FEEH
R0FF8	EQU 0FF8H

; Unused or indirect labels:
; S0000
; S0017
; S008D
; R009C
; S00AB
; S00E6
; S0108
; S010A
; S010C
; S010E
; S0110
; S0112
; S0114
; S0116
; S0118
; S011A
; S011C
; S011E
; S01F8
; S0232
; S0236
; S0253
; S0254
; S0274
; S0294
; S02A4
; S02A8
; S02B2
; S02B3
; S02B4
; S02D6
; S02D7
; S02F0
; S02F1
; S02F7
; S0315
; S0344
; S035D
; S036E
; S0387
; S038A
; S038E
; S039D
; S03A1
; S03A9
; S03AA
; S0411
; S0421
; S0429
; S0431
; S0435
; S0471
; S0485
; S0580
; S0581
; S0588
; S0589
; S0B59
; S0F72
; S0F74

; Register Definitions:
R0		EQU 0
R1		EQU 1
R2		EQU 2
R3		EQU 3
R4		EQU 4
R5		EQU 5
R6		EQU 6
R7		EQU 7
R8		EQU 8
R9		EQU 9
RA		EQU 10
RB		EQU 11
RC		EQU 12
RD		EQU 13
RE		EQU 14
RF		EQU 15

; Start code segment
S0000
		LDI  0ABH                ;0000: F8 AB       
		PLO  R4                  ;0002: A4          
		LDI  32H                 ;0003: F8 32       
		PLO  R1                  ;0005: A1          
		LDI  08H                 ;0006: F8 08       
		PHI  R5                  ;0008: B5          
		LDI  20H                 ;0009: F8 20       
		PLO  R5                  ;000B: A5          
		LDI  1CH                 ;000C: F8 1C       
		PHI  R6                  ;000E: B6          
		LDI  13H                 ;000F: F8 13       
		PLO  R6                  ;0011: A6          
		GHI  R0                  ;0012: 90          
		PHI  R4                  ;0013: B4          
		PHI  R1                  ;0014: B1          
		STR  R6                  ;0015: 56          
		SEX  R2                  ;0016: E2          
S0017
		LDI  12H                 ;0017: F8 12       
		PLO  R6                  ;0019: A6          
		LDI  42H                 ;001A: F8 42       
		STR  R6                  ;001C: 56          
		LDI  3DH                 ;001D: F8 3D       
		PLO  R6                  ;001F: A6          
		LDI  27H                 ;0020: F8 27       
		PHI  R2                  ;0022: B2          
		SMI  01H                 ;0023: FF 01       
		STR  R6                  ;0025: 56          
		INC  R6                  ;0026: 16          
		LDI  0FFH                ;0027: F8 FF       
		PLO  R2                  ;0029: A2          
		STR  R6                  ;002A: 56          
		SEP  R4                  ;002B: D4          
R002C
		REQ                      ;002C: 7A          
R002D
		SEX  R2                  ;002D: E2          
		LDA  R2                  ;002E: 42          
		PLO  RB                  ;002F: AB          
		LDA  R2                  ;0030: 42          
		RET                      ;0031: 70          
		DEC  R2                  ;0032: 22          
		SAV                      ;0033: 78          
		DEC  R2                  ;0034: 22          
		STXD                     ;0035: 73          
		GLO  RB                  ;0036: 8B          
		STR  R2                  ;0037: 52          
		LDI  18H                 ;0038: F8 18       
		PHI  R0                  ;003A: B0          
		LDI  03H                 ;003B: F8 03       
		PLO  R0                  ;003D: A0          
R003E
		DEC  R0                  ;003E: 20          
		GLO  R0                  ;003F: 80          
		BNZ  R003E               ;0040: 3A 3E       
		SEX  R1                  ;0042: E1          
		LDI  40H                 ;0043: F8 40       
		PHI  R8                  ;0045: B8          
		LDI  40H                 ;0046: F8 40       
		PLO  R8                  ;0048: A8          
		INC  R9                  ;0049: 19          
R004A
		GLO  R0                  ;004A: 80          
		PLO  RB                  ;004B: AB          
		DEC  R8                  ;004C: 28          
		OUT  5                   ;004D: 65          
		DB   00H                 ;004E: 00
		DEC  R0                  ;004F: 20          
		GLO  RB                  ;0050: 8B          
		PLO  R0                  ;0051: A0          
		GHI  R8                  ;0052: 98          
		BZ   R005C               ;0053: 32 5C       
		OUT  5                   ;0055: 65          
		DB   00H                 ;0056: 00
		DEC  R0                  ;0057: 20          
		GLO  RB                  ;0058: 8B          
		PLO  R0                  ;0059: A0          
		SEX  R1                  ;005A: E1          
		SEX  R1                  ;005B: E1          
R005C
		OUT  5                   ;005C: 65          
		DB   00H                 ;005D: 00
		GLO  R8                  ;005E: 88          
		BNZ  R004A               ;005F: 3A 4A       
		LDI  15H                 ;0061: F8 15       
		PLO  R8                  ;0063: A8          
		GHI  R6                  ;0064: 96          
		PHI  R8                  ;0065: B8          
		LDN  R8                  ;0066: 08          
		PLO  R0                  ;0067: A0          
		DEC  R8                  ;0068: 28          
		BZ   R0088               ;0069: 32 88       
		LDN  R8                  ;006B: 08          
R006C
		PHI  R0                  ;006C: B0          
		DEC  R0                  ;006D: 20          
		GHI  R0                  ;006E: 90          
		STR  R8                  ;006F: 58          
		INC  R8                  ;0070: 18          
		GLO  R0                  ;0071: 80          
		STR  R8                  ;0072: 58          
		DEC  R8                  ;0073: 28          
R0074
		DEC  R8                  ;0074: 28          
		LDN  R8                  ;0075: 08          
		PLO  R0                  ;0076: A0          
		BZ   R007A               ;0077: 32 7A       
		DEC  R0                  ;0079: 20          
R007A
		GLO  R0                  ;007A: 80          
		STR  R8                  ;007B: 58          
		DEC  R8                  ;007C: 28          
		SEX  R8                  ;007D: E8          
		LDN  R8                  ;007E: 08          
		OUT  1                   ;007F: 61          
		BZ   R002C               ;0080: 32 2C       
		LDN  R8                  ;0082: 08          
		BZ   R002C               ;0083: 32 2C       
		SEQ                      ;0085: 7B          
		BR   R002D               ;0086: 30 2D       
R0088
		LDN  R8                  ;0088: 08          
		BZ   R0074               ;0089: 32 74       
		BR   R006C               ;008B: 30 6C       
S008D
		LDA  R5                  ;008D: 45          
		PLO  R6                  ;008E: A6          
		INC  R9                  ;008F: 19          
		GLO  R9                  ;0090: 89          
		PLO  RE                  ;0091: AE          
		SHR                      ;0092: F6          
		SHR                      ;0093: F6          
		SHR                      ;0094: F6          
		SHR                      ;0095: F6          
		SHR                      ;0096: F6          
		SHR                      ;0097: F6          
		PHI  RE                  ;0098: BE          
		GHI  R9                  ;0099: 99          
		SEX  RE                  ;009A: EE          
		ADD                      ;009B: F4          
R009C
		STR  R6                  ;009C: 56          
		SHR                      ;009D: F6          
		SEX  R6                  ;009E: E6          
		ADD                      ;009F: F4          
		PHI  R9                  ;00A0: B9          
		STR  R6                  ;00A1: 56          
		SEP  R4                  ;00A2: D4          
R00A3
		INC  R5                  ;00A3: 15          
		LDA  R5                  ;00A4: 45          
		PHI  R3                  ;00A5: B3          
		LDA  R5                  ;00A6: 45          
		PLO  R3                  ;00A7: A3          
R00A8
		GHI  R6                  ;00A8: 96          
		PHI  R7                  ;00A9: B7          
		SEP  R3                  ;00AA: D3          
S00AB
		LDN  R5                  ;00AB: 05          
		BZ   R00A3               ;00AC: 32 A3       
		SMI  40H                 ;00AE: FF 40       
		BNF  R00C2               ;00B0: 3B C2       
		LDN  R5                  ;00B2: 05          
		ANI  0FH                 ;00B3: FA 0F       
		PLO  R6                  ;00B5: A6          
		LDA  R5                  ;00B6: 45          
		ANI  0F0H                ;00B7: FA F0       
		SHR                      ;00B9: F6          
		SHR                      ;00BA: F6          
		SHR                      ;00BB: F6          
		PLO  R3                  ;00BC: A3          
		LDI  01H                 ;00BD: F8 01       
		PHI  R3                  ;00BF: B3          
		BR   R00A8               ;00C0: 30 A8       
R00C2
		LDA  R5                  ;00C2: 45          
		SHL                      ;00C3: FE          
		ADI  0A0H                ;00C4: FC A0       
		PLO  RF                  ;00C6: AF          
		LDI  07H                 ;00C7: F8 07       
		ADCI 00H                 ;00C9: 7C 00       
		PHI  RF                  ;00CB: BF          
		LDA  RF                  ;00CC: 4F          
		PHI  R3                  ;00CD: B3          
		LDN  RF                  ;00CE: 0F          
		PLO  R3                  ;00CF: A3          
		GLO  RF                  ;00D0: 8F          
		SMI  0D8H                ;00D1: FF D8       
		BDF  R00DA               ;00D3: 33 DA       
		GLO  RF                  ;00D5: 8F          
		SMI  08H                 ;00D6: FF 08       
		BDF  R00A8               ;00D8: 33 A8       
R00DA
		LDN  R5                  ;00DA: 05          
		SHR                      ;00DB: F6          
		SHR                      ;00DC: F6          
		SHR                      ;00DD: F6          
		SHR                      ;00DE: F6          
		PLO  R6                  ;00DF: A6          
		LDA  R5                  ;00E0: 45          
		ANI  0FH                 ;00E1: FA 0F       
		PLO  R7                  ;00E3: A7          
		BR   R00A8               ;00E4: 30 A8       
S00E6
		LDI  18H                 ;00E6: F8 18       
		PHI  RC                  ;00E8: BC          
		PHI  RE                  ;00E9: BE          
		GHI  R1                  ;00EA: 91          
		PLO  RC                  ;00EB: AC          
		LDI  60H                 ;00EC: F8 60       
		PLO  RE                  ;00EE: AE          
R00EF
		LDA  RE                  ;00EF: 4E          
		STR  RC                  ;00F0: 5C          
		INC  RC                  ;00F1: 1C          
		GHI  RE                  ;00F2: 9E          
		SMI  1CH                 ;00F3: FF 1C       
		BNZ  R00EF               ;00F5: 3A EF       
R00F7
		GHI  R1                  ;00F7: 91          
		STR  RC                  ;00F8: 5C          
		INC  RC                  ;00F9: 1C          
		GHI  RC                  ;00FA: 9C          
		SMI  1CH                 ;00FB: FF 1C       
		BNZ  R00F7               ;00FD: 3A F7       
		SEP  RA                  ;00FF: DA          
S0100
		LDI  10H                 ;0100: F8 10       
		PLO  R6                  ;0102: A6          
R0103
		LDN  R6                  ;0103: 06          
R0104
		BZ   S01C0               ;0104: 32 C0       
R0106
		INC  R5                  ;0106: 15          
		SEP  R4                  ;0107: D4          
S0108
		BR   R0103               ;0108: 30 03       
S010A
		BR   R0123               ;010A: 30 23       
S010C
		BR   R0179               ;010C: 30 79       
S010E
		BR   R0181               ;010E: 30 81       
S0110
		BR   R017C               ;0110: 30 7C       
S0112
		BR   R0188               ;0112: 30 88       
S0114
		BR   R018D               ;0114: 30 8D       
S0116
		BR   R0195               ;0116: 30 95       
S0118
		BR   R01AB               ;0118: 30 AB       
S011A
		BR   R01B4               ;011A: 30 B4       
S011C
		BR   R01A1               ;011C: 30 A1       
S011E
		BR   R01BA               ;011E: 30 BA       
S0120
		LDI  10H                 ;0120: F8 10       
		PLO  R6                  ;0122: A6          
R0123
		LDN  R6                  ;0123: 06          
		BR   R01BE               ;0124: 30 BE       
S0126
		LDA  R7                  ;0126: 47          
		PHI  RF                  ;0127: BF          
		LDN  R7                  ;0128: 07          
		PLO  RF                  ;0129: AF          
		LDN  RF                  ;012A: 0F          
		SEX  R6                  ;012B: E6          
		IRX                      ;012C: 60          
		SD                       ;012D: F5          
		STXD                     ;012E: 73          
		GHI  R1                  ;012F: 91          
		SDB                      ;0130: 75          
		BR   R016C               ;0131: 30 6C       
S0133
		LDA  R5                  ;0133: 45          
		PLO  R6                  ;0134: A6          
		LDA  R5                  ;0135: 45          
		SEX  R6                  ;0136: E6          
		IRX                      ;0137: 60          
		SD                       ;0138: F5          
		STXD                     ;0139: 73          
		GHI  R1                  ;013A: 91          
		SDB                      ;013B: 75          
		STR  R6                  ;013C: 56          
		SEP  R4                  ;013D: D4          
S013E
		SEX  R6                  ;013E: E6          
		LDN  R7                  ;013F: 07          
		SD                       ;0140: F5          
		BR   R016C               ;0141: 30 6C       
S0143
		LDA  R5                  ;0143: 45          
		PLO  R6                  ;0144: A6          
		LDA  R5                  ;0145: 45          
		PLO  R7                  ;0146: A7          
S0147
		SEX  R6                  ;0147: E6          
		IRX                      ;0148: 60          
		INC  R7                  ;0149: 17          
		LDN  R7                  ;014A: 07          
		ADD                      ;014B: F4          
		STXD                     ;014C: 73          
		DEC  R7                  ;014D: 27          
		LDN  R7                  ;014E: 07          
		ADC                      ;014F: 74          
		BR   R016C               ;0150: 30 6C       
S0152
		LDA  R5                  ;0152: 45          
		PLO  R6                  ;0153: A6          
		LDA  R5                  ;0154: 45          
		PLO  R7                  ;0155: A7          
S0156
		SEX  R6                  ;0156: E6          
		IRX                      ;0157: 60          
		INC  R7                  ;0158: 17          
		LDN  R7                  ;0159: 07          
		SD                       ;015A: F5          
		STXD                     ;015B: 73          
		DEC  R7                  ;015C: 27          
		LDN  R7                  ;015D: 07          
		SDB                      ;015E: 75          
		BR   R016C               ;015F: 30 6C       
S0161
		LDA  R7                  ;0161: 47          
		PHI  RF                  ;0162: BF          
		LDN  R7                  ;0163: 07          
		PLO  RF                  ;0164: AF          
		LDN  RF                  ;0165: 0F          
R0166
		SEX  R6                  ;0166: E6          
		IRX                      ;0167: 60          
		ADD                      ;0168: F4          
		STXD                     ;0169: 73          
		GHI  R1                  ;016A: 91          
		ADC                      ;016B: 74          
R016C
		STR  R6                  ;016C: 56          
		LDI  10H                 ;016D: F8 10       
		PLO  R6                  ;016F: A6          
		BDF  R0175               ;0170: 33 75       
		GHI  R1                  ;0172: 91          
		STR  R6                  ;0173: 56          
		SEP  R4                  ;0174: D4          
R0175
		LDI  01H                 ;0175: F8 01       
		STR  R6                  ;0177: 56          
		SEP  R4                  ;0178: D4          
R0179
		LDA  R5                  ;0179: 45          
		STR  R6                  ;017A: 56          
		INC  R6                  ;017B: 16          
R017C
		LDA  R5                  ;017C: 45          
		STR  R6                  ;017D: 56          
		SEP  R4                  ;017E: D4          
S017F
		LDA  R5                  ;017F: 45          
		PLO  R6                  ;0180: A6          
R0181
		LDA  R5                  ;0181: 45          
		PLO  R7                  ;0182: A7          
		LDA  R7                  ;0183: 47          
		STR  R6                  ;0184: 56          
		INC  R6                  ;0185: 16          
		BR   R018A               ;0186: 30 8A       
R0188
		LDA  R5                  ;0188: 45          
		PLO  R7                  ;0189: A7          
R018A
		LDN  R7                  ;018A: 07          
		STR  R6                  ;018B: 56          
		SEP  R4                  ;018C: D4          
R018D
		LDA  R5                  ;018D: 45          
		PLO  R7                  ;018E: A7          
		LDA  R6                  ;018F: 46          
		STR  R7                  ;0190: 57          
		INC  R7                  ;0191: 17          
		LDN  R6                  ;0192: 06          
		STR  R7                  ;0193: 57          
		SEP  R4                  ;0194: D4          
R0195
		LDA  R5                  ;0195: 45          
		PLO  R7                  ;0196: A7          
		LDA  R6                  ;0197: 46          
		STR  R7                  ;0198: 57          
		SEP  R4                  ;0199: D4          
S019A
		LDA  R5                  ;019A: 45          
		PLO  R6                  ;019B: A6          
		LDA  R5                  ;019C: 45          
		PLO  R7                  ;019D: A7          
		LDN  R7                  ;019E: 07          
		BR   R0166               ;019F: 30 66       
R01A1
		LDA  R5                  ;01A1: 45          
		SEX  R6                  ;01A2: E6          
		ADD                      ;01A3: F4          
		STR  R6                  ;01A4: 56          
		SEP  R4                  ;01A5: D4          
S01A6
		SEX  R6                  ;01A6: E6          
		LDN  R7                  ;01A7: 07          
		ADD                      ;01A8: F4          
		BR   R016C               ;01A9: 30 6C       
R01AB
		LDA  R5                  ;01AB: 45          
		SEX  R6                  ;01AC: E6          
		IRX                      ;01AD: 60          
		ADD                      ;01AE: F4          
		STXD                     ;01AF: 73          
		GHI  R1                  ;01B0: 91          
		ADC                      ;01B1: 74          
		STR  R6                  ;01B2: 56          
		SEP  R4                  ;01B3: D4          
R01B4
		SEX  R5                  ;01B4: E5          
		LDN  R6                  ;01B5: 06          
		SM                       ;01B6: F7          
		INC  R5                  ;01B7: 15          
		BR   R0104               ;01B8: 30 04       
R01BA
		SEX  R5                  ;01BA: E5          
		LDN  R6                  ;01BB: 06          
		SM                       ;01BC: F7          
		INC  R5                  ;01BD: 15          
R01BE
		BZ   R0106               ;01BE: 32 06       
S01C0
		LDA  R5                  ;01C0: 45          
		PLO  R5                  ;01C1: A5          
		SEP  R4                  ;01C2: D4          
S01C3
		LDA  R5                  ;01C3: 45          
		PLO  R7                  ;01C4: A7          
		SEX  R5                  ;01C5: E5          
		LDN  R7                  ;01C6: 07          
		SM                       ;01C7: F7          
		INC  R5                  ;01C8: 15          
		BDF  S01C0               ;01C9: 33 C0       
		INC  R5                  ;01CB: 15          
		SEP  R4                  ;01CC: D4          
S01CD
		LDA  R5                  ;01CD: 45          
		PLO  R7                  ;01CE: A7          
		SEX  R5                  ;01CF: E5          
		LDN  R7                  ;01D0: 07          
		SM                       ;01D1: F7          
		INC  R5                  ;01D2: 15          
		BDF  R0106               ;01D3: 33 06       
		BR   S01C0               ;01D5: 30 C0       
S01D7
		LDA  R5                  ;01D7: 45          
		PLO  R6                  ;01D8: A6          
		LDA  R6                  ;01D9: 46          
		BNZ  R01DF               ;01DA: 3A DF       
		LDN  R6                  ;01DC: 06          
		BZ   S01C0               ;01DD: 32 C0       
R01DF
		INC  R5                  ;01DF: 15          
		SEP  R4                  ;01E0: D4          
S01E1
		SEX  R2                  ;01E1: E2          
		GHI  R5                  ;01E2: 95          
		STXD                     ;01E3: 73          
		GLO  R5                  ;01E4: 85          
		STXD                     ;01E5: 73          
S01E6
		LDA  R5                  ;01E6: 45          
		PLO  R7                  ;01E7: A7          
		LDA  R5                  ;01E8: 45          
		PLO  R5                  ;01E9: A5          
		GLO  R7                  ;01EA: 87          
		PHI  R5                  ;01EB: B5          
		SEP  R4                  ;01EC: D4          
S01ED
		INC  R2                  ;01ED: 12          
		LDA  R2                  ;01EE: 42          
		PLO  R5                  ;01EF: A5          
		LDN  R2                  ;01F0: 02          
		PHI  R5                  ;01F1: B5          
		INC  R5                  ;01F2: 15          
		INC  R5                  ;01F3: 15          
		SEP  R4                  ;01F4: D4          
S01F5
		GHI  R1                  ;01F5: 91          
		PLO  R6                  ;01F6: A6          
		SEP  R5                  ;01F7: D5          
S01F8
		IDL                      ;01F8: 00          
		SEP  R4                  ;01F9: D4          
		DB   47H                 ;01FA: 47
		DB   80H                 ;01FB: 80
		DB   0B7H                ;01FC: B7
S01FD
		DB   00H                 ;01FD: 00
		SEP  R4                  ;01FE: D4          
		DB   20H                 ;01FF: 20
		DB   '0123456789,;<=>'   ;0200: 30
		                         ;0201: 31
		                         ;0202: 32
		                         ;0203: 33
		                         ;0204: 34
		                         ;0205: 35
		                         ;0206: 36
		                         ;0207: 37
		                         ;0208: 38
		                         ;0209: 39
		                         ;020A: 2C
		                         ;020B: 3B
		                         ;020C: 3C
		                         ;020D: 3D
		                         ;020E: 3E
		DB   00H                 ;020F: 00
		DB   ' !"#%()/-:+'       ;0210: 20
		                         ;0211: 21
		                         ;0212: 22
		                         ;0213: 23
		                         ;0214: 25
		                         ;0215: 28
		                         ;0216: 29
		                         ;0217: 2F
		                         ;0218: 2D
		                         ;0219: 3A
		                         ;021A: 2B
		DB   00H                 ;021B: 00
		DB   '$*?'               ;021C: 24
		                         ;021D: 2A
		                         ;021E: 3F
		DB   00H                 ;021F: 00
S0220
		SEX  R2                  ;0220: E2          
		STR  R2                  ;0221: 52          
		LDI  03H                 ;0222: F8 03       
		PHI  RB                  ;0224: BB          
		LDI  00H                 ;0225: F8 00       
		PLO  RB                  ;0227: AB          
		LDI  06H                 ;0228: F8 06       
		PHI  RF                  ;022A: BF          
		LDI  06H                 ;022B: F8 06       
		PHI  RE                  ;022D: BE          
		LDI  0FBH                ;022E: F8 FB       
		PLO  RE                  ;0230: AE          
		SEP  RB                  ;0231: DB          
S0232
		LDI  8EH                 ;0232: F8 8E       
		PLO  R7                  ;0234: A7          
		SEP  RB                  ;0235: DB          
S0236
		LDI  05H                 ;0236: F8 05       
		PHI  RF                  ;0238: BF          
		LDN  R2                  ;0239: 02          
		ANI  7FH                 ;023A: FA 7F       
		SMI  08H                 ;023C: FF 08       
		BZ   R028B               ;023E: 32 8B       
		SMI  05H                 ;0240: FF 05       
		BZ   R025C               ;0242: 32 5C       
		LDI  06H                 ;0244: F8 06       
		PHI  RE                  ;0246: BE          
		LDN  R2                  ;0247: 02          
		ANI  7FH                 ;0248: FA 7F       
		ADI  6AH                 ;024A: FC 6A       
		PLO  RC                  ;024C: AC          
		LDI  05H                 ;024D: F8 05       
		PHI  RC                  ;024F: BC          
		LDN  RC                  ;0250: 0C          
		PLO  RE                  ;0251: AE          
		SEP  RB                  ;0252: DB          
S0253
		SEP  RB                  ;0253: DB          
S0254
		LDN  R6                  ;0254: 06          
		ADI  06H                 ;0255: FC 06       
		STR  R6                  ;0257: 56          
		SMI  7EH                 ;0258: FF 7E       
		BNZ  S0293               ;025A: 3A 93       
R025C
		GHI  R1                  ;025C: 91          
		STR  R6                  ;025D: 56          
		INC  R6                  ;025E: 16          
		LDN  R6                  ;025F: 06          
		ADI  06H                 ;0260: FC 06       
		STR  R6                  ;0262: 56          
		DEC  R6                  ;0263: 26          
		SMI  3CH                 ;0264: FF 3C       
		BNZ  S0293               ;0266: 3A 93       
		LDI  36H                 ;0268: F8 36       
		INC  R6                  ;026A: 16          
		STR  R6                  ;026B: 56          
		DEC  R6                  ;026C: 26          
		LDI  00H                 ;026D: F8 00       
		PHI  RB                  ;026F: BB          
		LDI  0E6H                ;0270: F8 E6       
		PLO  RB                  ;0272: AB          
		SEP  RB                  ;0273: DB          
S0274
		BR   S0293               ;0274: 30 93       
R0276
		LDI  78H                 ;0276: F8 78       
		STR  R6                  ;0278: 56          
		INC  R6                  ;0279: 16          
		LDN  R6                  ;027A: 06          
		SMI  06H                 ;027B: FF 06       
		STR  R6                  ;027D: 56          
		DEC  R6                  ;027E: 26          
		SMI  0FAH                ;027F: FF FA       
		BNZ  S0293               ;0281: 3A 93       
		GHI  R1                  ;0283: 91          
		INC  R6                  ;0284: 16          
		STR  R6                  ;0285: 56          
		DEC  R6                  ;0286: 26          
		GHI  R1                  ;0287: 91          
		STR  R6                  ;0288: 56          
		BR   S0293               ;0289: 30 93       
R028B
		LDN  R6                  ;028B: 06          
		SMI  06H                 ;028C: FF 06       
		STR  R6                  ;028E: 56          
		SMI  0FAH                ;028F: FF FA       
		BZ   R0276               ;0291: 32 76       
S0293
		SEP  R3                  ;0293: D3          
S0294
		LDI  06H                 ;0294: F8 06       
		PHI  RE                  ;0296: BE          
		LDI  0FBH                ;0297: F8 FB       
		PLO  RE                  ;0299: AE          
		LDI  03H                 ;029A: F8 03       
		PHI  RB                  ;029C: BB          
		LDI  00H                 ;029D: F8 00       
		PLO  RB                  ;029F: AB          
		LDI  06H                 ;02A0: F8 06       
		PHI  RF                  ;02A2: BF          
		SEP  RB                  ;02A3: DB          
S02A4
		LDI  8EH                 ;02A4: F8 8E       
		PLO  R7                  ;02A6: A7          
		SEP  RB                  ;02A7: DB          
S02A8
		LDI  06H                 ;02A8: F8 06       
		PHI  RE                  ;02AA: BE          
		LDI  0FBH                ;02AB: F8 FB       
		PLO  RE                  ;02AD: AE          
		LDI  05H                 ;02AE: F8 05       
		PHI  RF                  ;02B0: BF          
		SEP  RB                  ;02B1: DB          
S02B2
		SEP  RB                  ;02B2: DB          
S02B3
		SEP  R3                  ;02B3: D3          
S02B4
		BR   S0220               ;02B4: 30 20       
S02B6
		SEX  R7                  ;02B6: E7          
		LDI  1BH                 ;02B7: F8 1B       
		PHI  R7                  ;02B9: B7          
		LDI  0FFH                ;02BA: F8 FF       
		PLO  R7                  ;02BC: A7          
R02BD
		GHI  R1                  ;02BD: 91          
		STXD                     ;02BE: 73          
		GHI  R7                  ;02BF: 97          
		SMI  17H                 ;02C0: FF 17       
		BNZ  R02BD               ;02C2: 3A BD       
		LDI  16H                 ;02C4: F8 16       
		PLO  R6                  ;02C6: A6          
		GHI  R1                  ;02C7: 91          
		STR  R6                  ;02C8: 56          
		INC  R6                  ;02C9: 16          
		STR  R6                  ;02CA: 56          
		SEP  R4                  ;02CB: D4          
S02CC
		LDI  16H                 ;02CC: F8 16       
		PLO  R6                  ;02CE: A6          
		GHI  R3                  ;02CF: 93          
		PHI  RA                  ;02D0: BA          
		LDI  20H                 ;02D1: F8 20       
		PLO  RA                  ;02D3: AA          
R02D4
		LDA  R5                  ;02D4: 45          
		SEP  RA                  ;02D5: DA          
S02D6
		SEP  RA                  ;02D6: DA          
S02D7
		LDN  R2                  ;02D7: 02          
		SHL                      ;02D8: FE          
		BNF  R02D4               ;02D9: 3B D4       
		SEP  R4                  ;02DB: D4          
S02DC
		GHI  R6                  ;02DC: 96          
		PHI  RD                  ;02DD: BD          
		LDA  R5                  ;02DE: 45          
		PLO  RD                  ;02DF: AD          
		GHI  R3                  ;02E0: 93          
		PHI  RA                  ;02E1: BA          
		LDI  20H                 ;02E2: F8 20       
		PLO  RA                  ;02E4: AA          
		LDI  16H                 ;02E5: F8 16       
		PLO  R6                  ;02E7: A6          
		LDI  11H                 ;02E8: F8 11       
		PLO  R7                  ;02EA: A7          
		LDN  R7                  ;02EB: 07          
		BNZ  S02F2               ;02EC: 3A F2       
		LDN  RD                  ;02EE: 0D          
		SEP  RA                  ;02EF: DA          
S02F0
		SEP  RA                  ;02F0: DA          
S02F1
		SEP  R4                  ;02F1: D4          
S02F2
		LDI  19H                 ;02F2: F8 19       
		PLO  R6                  ;02F4: A6          
		LDN  RD                  ;02F5: 0D          
		SEP  RA                  ;02F6: DA          
S02F7
		SEP  R4                  ;02F7: D4          
S02F8
		LDA  R7                  ;02F8: 47          
		PHI  RF                  ;02F9: BF          
		LDN  R7                  ;02FA: 07          
		PLO  RF                  ;02FB: AF          
		LDN  RF                  ;02FC: 0F          
		STR  R6                  ;02FD: 56          
		SEP  R4                  ;02FE: D4          
		DB   00H                 ;02FF: 00
S0300
		DEC  R2                  ;0300: 22          
		SEX  R2                  ;0301: E2          
		GHI  RD                  ;0302: 9D          
		STXD                     ;0303: 73          
		GLO  RD                  ;0304: 8D          
		STXD                     ;0305: 73          
		GLO  R6                  ;0306: 86          
		STXD                     ;0307: 73          
		LDN  R6                  ;0308: 06          
		ANI  07H                 ;0309: FA 07       
		STR  R2                  ;030B: 52          
		DEC  R2                  ;030C: 22          
		LDI  0AAH                ;030D: F8 AA       
		PLO  R7                  ;030F: A7          
		GHI  RB                  ;0310: 9B          
		PHI  R7                  ;0311: B7          
		LDI  18H                 ;0312: F8 18       
		SEP  R7                  ;0314: D7          
S0315
		INC  R6                  ;0315: 16          
		INC  R2                  ;0316: 12          
		LDN  R2                  ;0317: 02          
		PHI  R7                  ;0318: B7          
		GLO  R6                  ;0319: 86          
		STR  R2                  ;031A: 52          
		LDI  1DH                 ;031B: F8 1D       
		PLO  R6                  ;031D: A6          
		GHI  RF                  ;031E: 9F          
		PLO  RF                  ;031F: AF          
R0320
		GHI  R1                  ;0320: 91          
		PLO  RD                  ;0321: AD          
		GLO  RF                  ;0322: 8F          
		BZ   R033E               ;0323: 32 3E       
		DEC  RF                  ;0325: 2F          
		LDA  RE                  ;0326: 4E          
		PHI  RD                  ;0327: BD          
		GHI  R7                  ;0328: 97          
		PLO  R7                  ;0329: A7          
R032A
		GLO  R7                  ;032A: 87          
		BZ   R0336               ;032B: 32 36       
		GHI  RD                  ;032D: 9D          
		SHR                      ;032E: F6          
		PHI  RD                  ;032F: BD          
		GLO  RD                  ;0330: 8D          
		SHRC                     ;0331: 76          
		PLO  RD                  ;0332: AD          
		DEC  R7                  ;0333: 27          
		BR   R032A               ;0334: 30 2A       
R0336
		GHI  RD                  ;0336: 9D          
		STR  R6                  ;0337: 56          
		INC  R6                  ;0338: 16          
		GLO  RD                  ;0339: 8D          
		STR  R6                  ;033A: 56          
		INC  R6                  ;033B: 16          
		BR   R0320               ;033C: 30 20       
R033E
		LDI  8AH                 ;033E: F8 8A       
		PLO  R7                  ;0340: A7          
		GHI  RB                  ;0341: 9B          
		PHI  R7                  ;0342: B7          
		SEP  RA                  ;0343: DA          
S0344
		SEX  RC                  ;0344: EC          
		LDI  1DH                 ;0345: F8 1D       
		PLO  R6                  ;0347: A6          
		GHI  R6                  ;0348: 96          
		PHI  RD                  ;0349: BD          
		LDN  R2                  ;034A: 02          
		PLO  RD                  ;034B: AD          
		GHI  R1                  ;034C: 91          
		STR  RD                  ;034D: 5D          
		GHI  RF                  ;034E: 9F          
		PLO  RF                  ;034F: AF          
R0350
		GLO  RF                  ;0350: 8F          
		BZ   R037D               ;0351: 32 7D       
		LDN  R6                  ;0353: 06          
		AND                      ;0354: F2          
		DEC  RF                  ;0355: 2F          
		BZ   R035B               ;0356: 32 5B       
		LDI  01H                 ;0358: F8 01       
		STR  RD                  ;035A: 5D          
R035B
		LDN  R6                  ;035B: 06          
		SEP  R7                  ;035C: D7          
S035D
		STR  RC                  ;035D: 5C          
		INC  R6                  ;035E: 16          
		LDN  R2                  ;035F: 02          
		XRI  07H                 ;0360: FB 07       
		BZ   R0370               ;0362: 32 70       
		INC  RC                  ;0364: 1C          
		LDN  R6                  ;0365: 06          
		AND                      ;0366: F2          
		BZ   R036C               ;0367: 32 6C       
		LDI  01H                 ;0369: F8 01       
		STR  RD                  ;036B: 5D          
R036C
		LDN  R6                  ;036C: 06          
		SEP  R7                  ;036D: D7          
S036E
		STR  RC                  ;036E: 5C          
		DEC  RC                  ;036F: 2C          
R0370
		INC  R6                  ;0370: 16          
		GLO  RC                  ;0371: 8C          
		ADI  10H                 ;0372: FC 10       
		PLO  RC                  ;0374: AC          
		GHI  RC                  ;0375: 9C          
		ADCI 00H                 ;0376: 7C 00       
		PHI  RC                  ;0378: BC          
		XRI  1CH                 ;0379: FB 1C       
		BNZ  R0350               ;037B: 3A 50       
R037D
		INC  R2                  ;037D: 12          
		LDN  R2                  ;037E: 02          
		PLO  R6                  ;037F: A6          
		INC  R2                  ;0380: 12          
		LDA  R2                  ;0381: 42          
		PLO  RD                  ;0382: AD          
		LDN  R2                  ;0383: 02          
		PHI  RD                  ;0384: BD          
		INC  R2                  ;0385: 12          
		SEP  RA                  ;0386: DA          
S0387
		BR   S0300               ;0387: 30 00       
S0389
		SEP  RB                  ;0389: DB          
S038A
		XOR                      ;038A: F3          
		BR   S0389               ;038B: 30 89       
S038D
		SEP  RB                  ;038D: DB          
S038E
		OR                       ;038E: F1          
		STR  RC                  ;038F: 5C          
		LDN  R6                  ;0390: 06          
		XOR                      ;0391: F3          
		BR   S038D               ;0392: 30 8D       
S0394
		LDN  R7                  ;0394: 07          
		SEX  R2                  ;0395: E2          
		STXD                     ;0396: 73          
		LDI  0A1H                ;0397: F8 A1       
		PLO  RB                  ;0399: AB          
		GHI  R3                  ;039A: 93          
		PHI  RB                  ;039B: BB          
		SEP  RB                  ;039C: DB          
S039D
		INC  R2                  ;039D: 12          
		LDN  R2                  ;039E: 02          
		STR  RC                  ;039F: 5C          
		SEP  R4                  ;03A0: D4          
S03A1
		LDI  0AAH                ;03A1: F8 AA       
		PLO  R7                  ;03A3: A7          
		GHI  R3                  ;03A4: 93          
		PHI  R7                  ;03A5: B7          
		LDI  28H                 ;03A6: F8 28       
		SEP  R7                  ;03A8: D7          
S03A9
		SEP  R3                  ;03A9: D3          
S03AA
		STXD                     ;03AA: 73          
		LDA  R6                  ;03AB: 46          
		ANI  7FH                 ;03AC: FA 7F       
		SHR                      ;03AE: F6          
		SHR                      ;03AF: F6          
		SHR                      ;03B0: F6          
		STR  R2                  ;03B1: 52          
		LDN  R6                  ;03B2: 06          
		ANI  3FH                 ;03B3: FA 3F       
		SHL                      ;03B5: FE          
		SHL                      ;03B6: FE          
		SHL                      ;03B7: FE          
		SHLC                     ;03B8: 7E          
		PHI  RC                  ;03B9: BC          
		ANI  0F0H                ;03BA: FA F0       
		OR                       ;03BC: F1          
		PLO  RC                  ;03BD: AC          
		GHI  RC                  ;03BE: 9C          
		SHLC                     ;03BF: 7E          
		ANI  03H                 ;03C0: FA 03       
		INC  R2                  ;03C2: 12          
		OR                       ;03C3: F1          
		PHI  RC                  ;03C4: BC          
		SEP  RB                  ;03C5: DB          
		SEP  R4                  ;03C6: D4          
		DB   00H                 ;03C7: 00
		DB   00H                 ;03C8: 00
		DB   00H                 ;03C9: 00
		DB   00H                 ;03CA: 00
		DB   00H                 ;03CB: 00
		DB   00H                 ;03CC: 00
		DB   00H                 ;03CD: 00
		DB   00H                 ;03CE: 00
		DB   00H                 ;03CF: 00
		DB   00H                 ;03D0: 00
		DB   00H                 ;03D1: 00
		DB   00H                 ;03D2: 00
		DB   00H                 ;03D3: 00
S03D4
		SEX  R5                  ;03D4: E5          
		LDA  R5                  ;03D5: 45          
		ADD                      ;03D6: F4          
		SMI  01H                 ;03D7: FF 01       
		PLO  R7                  ;03D9: A7          
		LDA  R5                  ;03DA: 45          
		PLO  RF                  ;03DB: AF          
R03DC
		INC  R2                  ;03DC: 12          
		LDN  R2                  ;03DD: 02          
		STR  R7                  ;03DE: 57          
		DEC  R7                  ;03DF: 27          
		DEC  RF                  ;03E0: 2F          
		GLO  RF                  ;03E1: 8F          
		BNZ  R03DC               ;03E2: 3A DC       
		SEP  R4                  ;03E4: D4          
S03E5
		LDA  R5                  ;03E5: 45          
		PLO  R7                  ;03E6: A7          
		LDA  R7                  ;03E7: 47          
		PHI  R5                  ;03E8: B5          
		LDN  R7                  ;03E9: 07          
		PLO  R5                  ;03EA: A5          
		SEP  R4                  ;03EB: D4          
S03EC
		SEQ                      ;03EC: 7B          
		SEX  R2                  ;03ED: E2          
R03EE
		GHI  R1                  ;03EE: 91          
		PLO  RF                  ;03EF: AF          
R03F0
		GLO  RF                  ;03F0: 8F          
		STR  R2                  ;03F1: 52          
		OUT  2                   ;03F2: 62          
		DEC  R2                  ;03F3: 22          
		B3   R03EE               ;03F4: 36 EE       
		B4   R03EE               ;03F6: 37 EE       
		INC  RF                  ;03F8: 1F          
		GLO  RF                  ;03F9: 8F          
		SMI  0FH                 ;03FA: FF 0F       
		BNZ  R03F0               ;03FC: 3A F0       
		REQ                      ;03FE: 7A          
		SEP  R4                  ;03FF: D4          
S0400
		LDA  R6                  ;0400: 46          
		PHI  RC                  ;0401: BC          
		LDN  R6                  ;0402: 06          
		PLO  RC                  ;0403: AC          
		LDN  R7                  ;0404: 07          
		PLO  RE                  ;0405: AE          
		LDI  71H                 ;0406: F8 71       
		PLO  RB                  ;0408: AB          
		GHI  R3                  ;0409: 93          
		PHI  RB                  ;040A: BB          
		LDI  40H                 ;040B: F8 40       
		PHI  RD                  ;040D: BD          
R040E
		GHI  R1                  ;040E: 91          
		SHR                      ;040F: F6          
		SEP  RB                  ;0410: DB          
S0411
		DEC  RD                  ;0411: 2D          
		GHI  RD                  ;0412: 9D          
		BNZ  R040E               ;0413: 3A 0E       
R0415
		LDI  10H                 ;0415: F8 10       
		PLO  R7                  ;0417: A7          
		LDI  08H                 ;0418: F8 08       
		PLO  RD                  ;041A: AD          
		LDA  RC                  ;041B: 4C          
		PHI  R7                  ;041C: B7          
		LDI  80H                 ;041D: F8 80       
		SHL                      ;041F: FE          
		SEP  RB                  ;0420: DB          
S0421
		GLO  RC                  ;0421: 8C          
		BNZ  R0425               ;0422: 3A 25       
		DEC  RE                  ;0424: 2E          
R0425
		GHI  R7                  ;0425: 97          
		SHR                      ;0426: F6          
		PHI  R7                  ;0427: B7          
		SEP  RB                  ;0428: DB          
S0429
		DEC  RD                  ;0429: 2D          
		GLO  RD                  ;042A: 8D          
		BNZ  R0425               ;042B: 3A 25       
		INC  R7                  ;042D: 17          
		GLO  R7                  ;042E: 87          
		SHR                      ;042F: F6          
		SEP  RB                  ;0430: DB          
S0431
		GLO  RE                  ;0431: 8E          
		BNZ  R0415               ;0432: 3A 15       
		SEP  RB                  ;0434: DB          
S0435
		SEP  R4                  ;0435: D4          
S0436
		LDA  R6                  ;0436: 46          
		PHI  RC                  ;0437: BC          
		LDN  R6                  ;0438: 06          
		PLO  RC                  ;0439: AC          
		LDN  R7                  ;043A: 07          
		PLO  RE                  ;043B: AE          
		LDI  10H                 ;043C: F8 10       
		PLO  R6                  ;043E: A6          
		GHI  R1                  ;043F: 91          
		STR  R6                  ;0440: 56          
		LDI  85H                 ;0441: F8 85       
		PLO  RB                  ;0443: AB          
		GHI  R3                  ;0444: 93          
		PHI  RB                  ;0445: BB          
R0446
		LDI  0AH                 ;0446: F8 0A       
		PHI  RD                  ;0448: BD          
R0449
		SEP  RB                  ;0449: DB          
		BDF  R0446               ;044A: 33 46       
		DEC  RD                  ;044C: 2D          
		GHI  RD                  ;044D: 9D          
		BNZ  R0449               ;044E: 3A 49       
R0450
		SEP  RB                  ;0450: DB          
		BNF  R0450               ;0451: 3B 50       
		LDI  09H                 ;0453: F8 09       
		PLO  RD                  ;0455: AD          
		PLO  R7                  ;0456: A7          
R0457
		GHI  R7                  ;0457: 97          
		SHRC                     ;0458: 76          
		PHI  R7                  ;0459: B7          
		DEC  RD                  ;045A: 2D          
		SEP  RB                  ;045B: DB          
		GLO  RD                  ;045C: 8D          
		BNZ  R0457               ;045D: 3A 57       
		GLO  R7                  ;045F: 87          
		SHR                      ;0460: F6          
		BDF  R0465               ;0461: 33 65       
		BR   S0497               ;0463: 30 97       
R0465
		GHI  R7                  ;0465: 97          
		STR  RC                  ;0466: 5C          
		INC  RC                  ;0467: 1C          
		GLO  RC                  ;0468: 8C          
		BNZ  R0450               ;0469: 3A 50       
		DEC  RE                  ;046B: 2E          
		GLO  RE                  ;046C: 8E          
		BNZ  R0450               ;046D: 3A 50       
		SEP  R4                  ;046F: D4          
S0470
		SEP  R3                  ;0470: D3          
S0471
		LDI  0AH                 ;0471: F8 0A       
		BNF  R0478               ;0473: 3B 78       
		LDI  20H                 ;0475: F8 20       
		INC  R7                  ;0477: 17          
R0478
		SEQ                      ;0478: 7B          
		PHI  RF                  ;0479: BF          
R047A
		SMI  01H                 ;047A: FF 01       
		BNZ  R047A               ;047C: 3A 7A       
		BNQ  S0470               ;047E: 39 70       
		REQ                      ;0480: 7A          
		GHI  RF                  ;0481: 9F          
		BR   R047A               ;0482: 30 7A       
R0484
		SEP  R3                  ;0484: D3          
S0485
		LDI  10H                 ;0485: F8 10       
R0487
		BN2  R0487               ;0487: 3D 87       
R0489
		BN2  R0492               ;0489: 3D 92       
		SMI  01H                 ;048B: FF 01       
		BNZ  R0489               ;048D: 3A 89       
		INC  R7                  ;048F: 17          
		LDI  81H                 ;0490: F8 81       
R0492
		SHL                      ;0492: FE          
R0493
		B2   R0493               ;0493: 35 93       
		BR   R0484               ;0495: 30 84       
S0497
		LDI  10H                 ;0497: F8 10       
		PLO  R6                  ;0499: A6          
		LDI  01H                 ;049A: F8 01       
		STR  R6                  ;049C: 56          
		SEP  R4                  ;049D: D4          
S049E
		LDI  10H                 ;049E: F8 10       
		PLO  R6                  ;04A0: A6          
		GHI  R1                  ;04A1: 91          
		STR  R6                  ;04A2: 56          
		SEP  R4                  ;04A3: D4          
S04A4
		LDA  R7                  ;04A4: 47          
		PHI  RF                  ;04A5: BF          
		LDN  R7                  ;04A6: 07          
		PLO  RF                  ;04A7: AF          
		LDA  R6                  ;04A8: 46          
		STR  RF                  ;04A9: 5F          
		INC  RF                  ;04AA: 1F          
		BR   S04B1               ;04AB: 30 B1       
S04AD
		LDA  R7                  ;04AD: 47          
		PHI  RF                  ;04AE: BF          
		LDN  R7                  ;04AF: 07          
		PLO  RF                  ;04B0: AF          
S04B1
		LDN  R6                  ;04B1: 06          
		STR  RF                  ;04B2: 5F          
		SEP  R4                  ;04B3: D4          
S04B4
		LDA  R7                  ;04B4: 47          
		PLO  RF                  ;04B5: AF          
		LDN  R7                  ;04B6: 07          
		PLO  R7                  ;04B7: A7          
		GLO  RF                  ;04B8: 8F          
		PHI  R7                  ;04B9: B7          
S04BA
		LDA  R7                  ;04BA: 47          
		STR  R6                  ;04BB: 56          
		INC  R6                  ;04BC: 16          
S04BD
		LDN  R7                  ;04BD: 07          
		STR  R6                  ;04BE: 56          
		SEP  R4                  ;04BF: D4          
S04C0
		SEX  R6                  ;04C0: E6          
		LDN  R7                  ;04C1: 07          
		AND                      ;04C2: F2          
		STR  R6                  ;04C3: 56          
		SEP  R4                  ;04C4: D4          
S04C5
		SEX  R6                  ;04C5: E6          
		LDN  R7                  ;04C6: 07          
		OR                       ;04C7: F1          
		STR  R6                  ;04C8: 56          
		SEP  R4                  ;04C9: D4          
S04CA
		SEX  R6                  ;04CA: E6          
		LDN  R7                  ;04CB: 07          
		XOR                      ;04CC: F3          
		STR  R6                  ;04CD: 56          
		SEP  R4                  ;04CE: D4          
S04CF
		INC  R6                  ;04CF: 16          
		LDN  R6                  ;04D0: 06          
		SHL                      ;04D1: FE          
		STR  R6                  ;04D2: 56          
		DEC  R6                  ;04D3: 26          
		LDN  R6                  ;04D4: 06          
		SHLC                     ;04D5: 7E          
		STR  R6                  ;04D6: 56          
		DEC  R7                  ;04D7: 27          
		GLO  R7                  ;04D8: 87          
		BNZ  S04CF               ;04D9: 3A CF       
R04DB
		BDF  S0497               ;04DB: 33 97       
		BR   S049E               ;04DD: 30 9E       
S04DF
		LDN  R6                  ;04DF: 06          
		SHR                      ;04E0: F6          
		STR  R6                  ;04E1: 56          
		INC  R6                  ;04E2: 16          
		LDN  R6                  ;04E3: 06          
		SHRC                     ;04E4: 76          
		STR  R6                  ;04E5: 56          
		DEC  R6                  ;04E6: 26          
		DEC  R7                  ;04E7: 27          
		GLO  R7                  ;04E8: 87          
		BNZ  S04DF               ;04E9: 3A DF       
		BR   R04DB               ;04EB: 30 DB       
S04ED
		LDA  R5                  ;04ED: 45          
		PLO  R6                  ;04EE: A6          
		LDN  R6                  ;04EF: 06          
		SHL                      ;04F0: FE          
		BR   R04DB               ;04F1: 30 DB       
S04F3
		SEX  R2                  ;04F3: E2          
		LDA  R5                  ;04F4: 45          
		PLO  R7                  ;04F5: A7          
		LDA  R5                  ;04F6: 45          
		PLO  RF                  ;04F7: AF          
R04F8
		LDA  R7                  ;04F8: 47          
		STXD                     ;04F9: 73          
		DEC  RF                  ;04FA: 2F          
		GLO  RF                  ;04FB: 8F          
		BNZ  R04F8               ;04FC: 3A F8       
		SEP  R4                  ;04FE: D4          
		DB   18H                 ;04FF: 18
		DB   'NABCEFGIJKMODHL'   ;0500: 4E
		                         ;0501: 41
		                         ;0502: 42
		                         ;0503: 43
		                         ;0504: 45
		                         ;0505: 46
		                         ;0506: 47
		                         ;0507: 49
		                         ;0508: 4A
		                         ;0509: 4B
		                         ;050A: 4D
		                         ;050B: 4F
		                         ;050C: 44
		                         ;050D: 48
		                         ;050E: 4C
		DB   00H                 ;050F: 00
		DB   ' PQRTUVXYZ.'       ;0510: 20
		                         ;0511: 50
		                         ;0512: 51
		                         ;0513: 52
		                         ;0514: 54
		                         ;0515: 55
		                         ;0516: 56
		                         ;0517: 58
		                         ;0518: 59
		                         ;0519: 5A
		                         ;051A: 2E
		DB   08H                 ;051B: 08
		DB   'SW'                ;051C: 53
		                         ;051D: 57
		DB   0DH                 ;051E: 0D
		DB   00H                 ;051F: 00
		DB   29H, 0CH            ;0520: LVX   V0,[R6]       
		DB   40H, 40H            ;0522: GOZR  V0,540        
		DB   0CCH, 01H           ;0524: ARI   R6,01         
		DB   14H, 00H, 80H, 2CH  ;0526: GOGE  V0,80,52C     
		DB   04H, 20H            ;052A: GO    520           
		DB   26H, 8EH            ;052C: LRG   R4,R7         
		DB   28H, 3AH            ;052E: LV    V3,VA         
		DB   29H, 2CH            ;0530: LVX   V2,[R6]       
		DB   0CCH, 01H           ;0532: ARI   R6,01         
		DB   25H, 2AH            ;0534: SV    V2,VA         
		DB   42H, 41H            ;0536: GOZR  V2,541        
		DB   26H, 0E8H           ;0538: LRG   R7,R4         
		DB   28H, 0A3H           ;053A: LV    VA,V3         
		DB   04H, 20H            ;053C: GO    520           
		DB   33H, 0AEH           ;053E: SKSP  VA,[R7]       
		DB   02H                 ;0540: RET                 
		DB   29H, 2CH            ;0541: LVX   V2,[R6]       
		DB   14H, 02H, 80H, 3EH  ;0543: GOGE  V2,80,53E     
		DB   42H, 3EH            ;0547: GOZR  V2,53E        
		DB   33H, 0AEH           ;0549: SKSP  VA,[R7]       
		DB   0DAH, 2EH, 3EH      ;054B: GOEQ  VA,2E,53E     
		DB   04H, 30H            ;054E: GO    530           
		DB   29H, 1CH            ;0550: LVX   V1,[R6]       
		DB   25H, 10H            ;0552: SV    V1,V0         
		DB   41H, 60H            ;0554: GOZR  V1,560        
		DB   0CCH, 01H           ;0556: ARI   R6,01         
		DB   29H, 1CH            ;0558: LVX   V1,[R6]       
		DB   14H, 01H, 80H, 52H  ;055A: GOGE  V1,80,552     
		DB   04H, 56H            ;055E: GO    556           
		DB   0CCH, 01H           ;0560: ARI   R6,01         
		DB   29H, 1CH            ;0562: LVX   V1,[R6]       
		DB   14H, 01H, 80H, 40H  ;0564: GOGE  V1,80,540     
		DB   41H, 40H            ;0568: GOZR  V1,540        
		DB   16H, 01H            ;056A: OUTS  V1            
		DB   04H, 60H            ;056C: GO    560           
S056E
		LDA  R5                  ;056E: 45          
		PLO  R7                  ;056F: A7          
		LDA  R7                  ;0570: 47          
		PHI  RE                  ;0571: BE          
		LDN  R7                  ;0572: 07          
		PLO  RE                  ;0573: AE          
		LDA  R5                  ;0574: 45          
		PLO  R6                  ;0575: A6          
		LDA  R5                  ;0576: 45          
		PLO  R7                  ;0577: A7          
		LDN  R7                  ;0578: 07          
		PHI  RF                  ;0579: BF          
		GHI  R3                  ;057A: 93          
		PHI  RA                  ;057B: BA          
		LDI  81H                 ;057C: F8 81       
		PLO  RA                  ;057E: AA          
		SEP  RA                  ;057F: DA          
S0580
		SEP  R4                  ;0580: D4          
S0581
		LDI  03H                 ;0581: F8 03       
		PHI  RB                  ;0583: BB          
		LDI  00H                 ;0584: F8 00       
		PLO  RB                  ;0586: AB          
		SEP  RB                  ;0587: DB          
S0588
		SEP  RB                  ;0588: DB          
S0589
		SEP  R3                  ;0589: D3          
		DB   50H                 ;058A: 50
		DB   49H                 ;058B: 49
		DB   0B6H                ;058C: B6
		DB   0B2H                ;058D: B2
		DB   65H                 ;058E: 65
		DB   12H                 ;058F: 12
		DB   17H                 ;0590: 17
		DB   4FH                 ;0591: 4F
		DB   1CH                 ;0592: 1C
		DB   2CH                 ;0593: 2C
		DB   21H                 ;0594: 21
		DB   45H                 ;0595: 45
		DB   28H                 ;0596: 28
		DB   53H                 ;0597: 53
		DB   27H                 ;0598: 27
		DB   0C7H                ;0599: C7
		DB   0A4H                ;059A: A4
		DB   0E3H                ;059B: E3
		DB   0EEH                ;059C: EE
		DB   86H                 ;059D: 86
		DB   60H                 ;059E: 60
		DB   8AH                 ;059F: 8A
		DB   0F0H                ;05A0: F0
		DB   71H                 ;05A1: 71
		DB   0F2H                ;05A2: F2
		DB   0ECH                ;05A3: EC
		DB   4CH                 ;05A4: 4C
		DB   0BAH                ;05A5: BA
		DB   0BDH                ;05A6: BD
		DB   57H                 ;05A7: 57
		DB   0BFH                ;05A8: BF
		DB   0DFH                ;05A9: DF
		DB   5BH                 ;05AA: 5B
		DB   0F4H                ;05AB: F4
		DB   92H                 ;05AC: 92
		DB   69H                 ;05AD: 69
		DB   96H                 ;05AE: 96
		DB   6DH                 ;05AF: 6D
		DB   9AH                 ;05B0: 9A
		DB   0E8H                ;05B1: E8
		DB   34H                 ;05B2: 34
		DB   7EH                 ;05B3: 7E
		DB   73H                 ;05B4: 73
		DB   0DAH                ;05B5: DA
		DB   7AH                 ;05B6: 7A
		DB   31H                 ;05B7: 31
		DB   9FH                 ;05B8: 9F
		DB   82H                 ;05B9: 82
		DB   77H                 ;05BA: 77
		DB   0A8H                ;05BB: A8
		DB   0ADH                ;05BC: AD
		DB   0D5H                ;05BD: D5
		DB   47H                 ;05BE: 47
		DB   0F7H                ;05BF: F7
		DB   3CH                 ;05C0: 3C
		DB   37H                 ;05C1: 37
		DB   3EH                 ;05C2: 3E
		DB   42H                 ;05C3: 42
		DB   8EH                 ;05C4: 8E
		DB   0CCH                ;05C5: CC
		DB   0C3H                ;05C6: C3
		DB   0D0H                ;05C7: D0
		DB   35H                 ;05C8: 35
S05C9
		LDA  R5                  ;05C9: 45          
		PLO  R7                  ;05CA: A7          
		GHI  R1                  ;05CB: 91          
		PLO  RF                  ;05CC: AF          
		SEX  R7                  ;05CD: E7          
R05CE
		GLO  RF                  ;05CE: 8F          
		STR  R7                  ;05CF: 57          
		OUT  2                   ;05D0: 62          
		DEC  R7                  ;05D1: 27          
		B3   R05E2               ;05D2: 36 E2       
		ADI  10H                 ;05D4: FC 10       
		B4   R05E2               ;05D6: 37 E2       
		INC  RF                  ;05D8: 1F          
		GLO  RF                  ;05D9: 8F          
		SMI  0FH                 ;05DA: FF 0F       
		BNZ  R05CE               ;05DC: 3A CE       
		STR  R7                  ;05DE: 57          
		LDA  R5                  ;05DF: 45          
		PLO  R5                  ;05E0: A5          
		SEP  R4                  ;05E1: D4          
R05E2
		PLO  RF                  ;05E2: AF          
		SEX  R3                  ;05E3: E3          
		OUT  2                   ;05E4: 62          
		DB   0FH                 ;05E5: 0F
		B3   R05EA               ;05E6: 36 EA       
		BN4  R05ED               ;05E8: 3F ED       
R05EA
		LDI  02H                 ;05EA: F8 02       
		SKP                      ;05EC: 38          
R05ED
		GHI  R3                  ;05ED: 93          
		PHI  RF                  ;05EE: BF          
		LDN  RF                  ;05EF: 0F          
		STR  R7                  ;05F0: 57          
		INC  R5                  ;05F1: 15          
S05F2
		SEP  R4                  ;05F2: D4          
		DB   07H                 ;05F3: 07
		DB   32H                 ;05F4: 32
		DB   0F3H                ;05F5: F3
		DB   0FBH                ;05F6: FB
		DB   0DH                 ;05F7: 0D
		DB   32H                 ;05F8: 32
		DB   0F3H                ;05F9: F3
		DB   07H                 ;05FA: 07
		DB   0FBH                ;05FB: FB
		DB   08H                 ;05FC: 08
		DB   32H                 ;05FD: 32
		DB   0F3H                ;05FE: F3
		DB   25H                 ;05FF: 25
		DB   91H                 ;0600: 91
		DB   57H                 ;0601: 57
		DB   45H                 ;0602: 45
		DB   0A5H                ;0603: A5
		DB   0D4H                ;0604: D4
S0605
		LDA  R5                  ;0605: 45          
		PLO  R7                  ;0606: A7          
		LDN  R7                  ;0607: 07          
		SEX  R7                  ;0608: E7          
		OUT  4                   ;0609: 64          
		SEP  R4                  ;060A: D4          
		DB   00H                 ;060B: 00
		DB   00H                 ;060C: 00
		DB   00H                 ;060D: 00
		DB   00H                 ;060E: 00
		DB   09H                 ;060F: 09
		DB   0D4H                ;0610: D4
		DB   00H                 ;0611: 00
		DB   88H                 ;0612: 88
		DB   10H                 ;0613: 10
		DB   20H                 ;0614: 20
		DB   40H                 ;0615: 40
		DB   88H                 ;0616: 88
		DB   40H                 ;0617: 40
		DB   0A0H                ;0618: A0
		DB   40H                 ;0619: 40
		DB   0A0H                ;061A: A0
		DB   50H                 ;061B: 50
		DB   10H                 ;061C: 10
		DB   20H                 ;061D: 20
		DB   20H                 ;061E: 20
		DB   20H                 ;061F: 20
		DB   10H                 ;0620: 10
		DB   20H                 ;0621: 20
		DB   0A8H                ;0622: A8
		DB   70H                 ;0623: 70
		DB   0A8H                ;0624: A8
		DB   20H                 ;0625: 20
		DB   50H                 ;0626: 50
		DB   00H                 ;0627: 00
		DB   00H                 ;0628: 00
		DB   00H                 ;0629: 00
		DB   00H                 ;062A: 00
		DB   20H                 ;062B: 20
		DB   40H                 ;062C: 40
		DB   20H                 ;062D: 20
		DB   20H                 ;062E: 20
		DB   20H                 ;062F: 20
		DB   40H                 ;0630: 40
		DB   0D8H                ;0631: D8
		DB   0F8H                ;0632: F8
		DB   0A8H                ;0633: A8
		DB   88H                 ;0634: 88
		DB   88H                 ;0635: 88
		DB   0F8H                ;0636: F8
		DB   88H                 ;0637: 88
		DB   88H                 ;0638: 88
		DB   0A8H                ;0639: A8
		DB   0F8H                ;063A: F8
		DB   0D8H                ;063B: D8
		DB   88H                 ;063C: 88
		DB   88H                 ;063D: 88
		DB   88H                 ;063E: 88
		DB   50H                 ;063F: 50
		DB   20H                 ;0640: 20
		DB   50H                 ;0641: 50
		DB   88H                 ;0642: 88
		DB   88H                 ;0643: 88
		DB   0F8H                ;0644: F8
		DB   20H                 ;0645: 20
		DB   20H                 ;0646: 20
		DB   0F8H                ;0647: F8
		DB   20H                 ;0648: 20
		DB   20H                 ;0649: 20
		DB   20H                 ;064A: 20
		DB   20H                 ;064B: 20
		DB   00H                 ;064C: 00
		DB   20H                 ;064D: 20
		DB   00H                 ;064E: 00
		DB   20H                 ;064F: 20
		DB   00H                 ;0650: 00
		DB   00H                 ;0651: 00
		DB   00H                 ;0652: 00
		DB   00H                 ;0653: 00
		DB   00H                 ;0654: 00
		DB   0F8H                ;0655: F8
		DB   00H                 ;0656: 00
		DB   00H                 ;0657: 00
		DB   0F8H                ;0658: F8
		DB   00H                 ;0659: 00
		DB   0F8H                ;065A: F8
		DB   00H                 ;065B: 00
		DB   70H                 ;065C: 70
		DB   70H                 ;065D: 70
		DB   70H                 ;065E: 70
		DB   00H                 ;065F: 00
		DB   10H                 ;0660: 10
		DB   90H                 ;0661: 90
		DB   0F8H                ;0662: F8
		DB   10H                 ;0663: 10
		DB   10H                 ;0664: 10
		DB   0F8H                ;0665: F8
		DB   0A0H                ;0666: A0
		DB   0F8H                ;0667: F8
		DB   28H                 ;0668: 28
		DB   0F8H                ;0669: F8
		DB   80H                 ;066A: 80
		DB   80H                 ;066B: 80
		DB   80H                 ;066C: 80
		DB   0F8H                ;066D: F8
		DB   80H                 ;066E: 80
		DB   0F0H                ;066F: F0
		DB   80H                 ;0670: 80
		DB   0F8H                ;0671: F8
		DB   08H                 ;0672: 08
		DB   08H                 ;0673: 08
		DB   08H                 ;0674: 08
		DB   08H                 ;0675: 08
		DB   88H                 ;0676: 88
		DB   0F8H                ;0677: F8
		DB   88H                 ;0678: 88
		DB   0F8H                ;0679: F8
		DB   80H                 ;067A: 80
		DB   80H                 ;067B: 80
		DB   80H                 ;067C: 80
		DB   80H                 ;067D: 80
		DB   0F8H                ;067E: F8
		DB   20H                 ;067F: 20
		DB   20H                 ;0680: 20
		DB   20H                 ;0681: 20
		DB   0F8H                ;0682: F8
		DB   88H                 ;0683: 88
		DB   88H                 ;0684: 88
		DB   88H                 ;0685: 88
		DB   0F8H                ;0686: F8
		DB   08H                 ;0687: 08
		DB   38H                 ;0688: 38
		DB   08H                 ;0689: 08
		DB   0F8H                ;068A: F8
		DB   80H                 ;068B: 80
		DB   0F8H                ;068C: F8
		DB   08H                 ;068D: 08
		DB   0F8H                ;068E: F8
		DB   10H                 ;068F: 10
		DB   20H                 ;0690: 20
		DB   40H                 ;0691: 40
		DB   0F8H                ;0692: F8
		DB   48H                 ;0693: 48
		DB   78H                 ;0694: 78
		DB   48H                 ;0695: 48
		DB   0F8H                ;0696: F8
		DB   48H                 ;0697: 48
		DB   48H                 ;0698: 48
		DB   48H                 ;0699: 48
		DB   0F8H                ;069A: F8
		DB   80H                 ;069B: 80
		DB   0F0H                ;069C: F0
		DB   80H                 ;069D: 80
		DB   80H                 ;069E: 80
		DB   0C8H                ;069F: C8
		DB   0C8H                ;06A0: C8
		DB   0A8H                ;06A1: A8
		DB   98H                 ;06A2: 98
		DB   98H                 ;06A3: 98
		DB   70H                 ;06A4: 70
		DB   98H                 ;06A5: 98
		DB   0A8H                ;06A6: A8
		DB   0C8H                ;06A7: C8
		DB   70H                 ;06A8: 70
		DB   88H                 ;06A9: 88
		DB   88H                 ;06AA: 88
		DB   98H                 ;06AB: 98
		DB   78H                 ;06AC: 78
		DB   0F8H                ;06AD: F8
		DB   88H                 ;06AE: 88
		DB   0F8H                ;06AF: F8
		DB   90H                 ;06B0: 90
		DB   88H                 ;06B1: 88
		DB   50H                 ;06B2: 50
		DB   0F8H                ;06B3: F8
		DB   50H                 ;06B4: 50
		DB   0F8H                ;06B5: F8
		DB   50H                 ;06B6: 50
		DB   50H                 ;06B7: 50
		DB   00H                 ;06B8: 00
		DB   00H                 ;06B9: 00
		DB   00H                 ;06BA: 00
		DB   20H                 ;06BB: 20
		DB   00H                 ;06BC: 00
		DB   20H                 ;06BD: 20
		DB   40H                 ;06BE: 40
		DB   80H                 ;06BF: 80
		DB   40H                 ;06C0: 40
		DB   20H                 ;06C1: 20
		DB   40H                 ;06C2: 40
		DB   80H                 ;06C3: 80
		DB   40H                 ;06C4: 40
		DB   20H                 ;06C5: 20
		DB   10H                 ;06C6: 10
		DB   08H                 ;06C7: 08
		DB   10H                 ;06C8: 10
		DB   20H                 ;06C9: 20
		DB   40H                 ;06CA: 40
		DB   80H                 ;06CB: 80
		DB   30H                 ;06CC: 30
		DB   20H                 ;06CD: 20
		DB   10H                 ;06CE: 10
		DB   20H                 ;06CF: 20
		DB   30H                 ;06D0: 30
		DB   10H                 ;06D1: 10
		DB   10H                 ;06D2: 10
		DB   10H                 ;06D3: 10
		DB   30H                 ;06D4: 30
		DB   78H                 ;06D5: 78
		DB   80H                 ;06D6: 80
		DB   70H                 ;06D7: 70
		DB   08H                 ;06D8: 08
		DB   0F0H                ;06D9: F0
		DB   88H                 ;06DA: 88
		DB   90H                 ;06DB: 90
		DB   0E0H                ;06DC: E0
		DB   90H                 ;06DD: 90
		DB   88H                 ;06DE: 88
		DB   70H                 ;06DF: 70
		DB   88H                 ;06E0: 88
		DB   10H                 ;06E1: 10
		DB   20H                 ;06E2: 20
		DB   20H                 ;06E3: 20
		DB   60H                 ;06E4: 60
		DB   20H                 ;06E5: 20
		DB   20H                 ;06E6: 20
		DB   70H                 ;06E7: 70
		DB   0F8H                ;06E8: F8
		DB   80H                 ;06E9: 80
		DB   98H                 ;06EA: 98
		DB   88H                 ;06EB: 88
		DB   0F8H                ;06EC: F8
		DB   88H                 ;06ED: 88
		DB   0F8H                ;06EE: F8
		DB   08H                 ;06EF: 08
		DB   0F8H                ;06F0: F8
		DB   80H                 ;06F1: 80
		DB   0F8H                ;06F2: F8
		DB   88H                 ;06F3: 88
		DB   0F8H                ;06F4: F8
		DB   88H                 ;06F5: 88
		DB   0F8H                ;06F6: F8
		DB   88H                 ;06F7: 88
		DB   88H                 ;06F8: 88
		DB   88H                 ;06F9: 88
		DB   88H                 ;06FA: 88
		DB   0F8H                ;06FB: F8
		DB   0F8H                ;06FC: F8
		DB   0F8H                ;06FD: F8
		DB   0F8H                ;06FE: F8
		DB   0F8H                ;06FF: F8
		DB   8CH, 00H            ;0700: LVI   VC,00         
		DB   89H, 05H            ;0702: LVI   V9,05         
		DB   62H, 07H, 2DH       ;0704: LRGI  R1,072D       
		DB   85H, 30H            ;0707: LVI   V5,30         
		DB   84H, 00H            ;0709: LVI   V4,00         
		DB   27H, 62H            ;070B: LRX   R3,[R1]       
		DB   23H, 06H            ;070D: SRG   R0,R3         
		DB   06H, 15H            ;070F: GONC  715           
		DB   0E4H, 01H           ;0711: AVI   V4,01         
		DB   04H, 0DH            ;0713: GO    70D           
		DB   44H, 26H            ;0715: GOZR  V4,726        
		DB   2DH, 45H            ;0717: VOR   V4,V5         
		DB   16H, 04H            ;0719: OUTS  V4            
		DB   8CH, 01H            ;071B: LVI   VC,01         
		DB   20H, 06H            ;071D: ARG   R0,R3         
		DB   0C2H, 02H           ;071F: ARI   R1,02         
		DB   0E9H, 0FFH          ;0721: AVI   V9,FF         
		DB   59H, 09H            ;0723: GONZ  V9,709        
		DB   02H                 ;0725: RET                 
		DB   5CH, 17H            ;0726: GONZ  VC,717        
		DB   0D9H, 01H, 17H      ;0728: GOEQ  V9,01,717     
		DB   04H, 1DH            ;072B: GO    71D           
		DB   27H                 ;072D: 27
		DB   10H                 ;072E: 10
		DB   03H                 ;072F: 03
		DB   0E8H                ;0730: E8
		DB   00H                 ;0731: 00
		DB   64H                 ;0732: 64
		DB   00H                 ;0733: 00
		DB   0AH                 ;0734: 0A
		DB   00H                 ;0735: 00
		DB   01H                 ;0736: 01
		DB   68H, 00H, 00H       ;0737: LRGI  R4,0000       
		DB   6CH, 10H, 10H       ;073A: LRGI  R6,1010       
		DB   26H, 68H            ;073D: LRG   R3,R4         
		DB   28H, 2CH            ;073F: LV    V2,VC         
		DB   2FH, 61H            ;0741: COLOR R3,V1         
		DB   0E6H, 08H           ;0743: AVI   V6,08         
		DB   0E2H, 0FFH          ;0745: AVI   V2,FF         
		DB   52H, 41H            ;0747: GONZ  V2,741        
		DB   28H, 68H            ;0749: LV    V6,V8         
		DB   0E7H, 04H           ;074B: AVI   V7,04         
		DB   0EDH, 0FFH          ;074D: AVI   VD,FF         
		DB   5DH, 3FH            ;074F: GONZ  VD,73F        
		DB   02H                 ;0751: RET                 
S0752
		LDA  R7                  ;0752: 47          
		PHI  RF                  ;0753: BF          
		LDN  R7                  ;0754: 07          
		PLO  RF                  ;0755: AF          
R0756
		LDN  RF                  ;0756: 0F          
		STR  R6                  ;0757: 56          
		SMI  20H                 ;0758: FF 20       
		INC  RF                  ;075A: 1F          
		BZ   R0756               ;075B: 32 56       
		GLO  RF                  ;075D: 8F          
		STR  R7                  ;075E: 57          
		DEC  R7                  ;075F: 27          
		GHI  RF                  ;0760: 9F          
		STR  R7                  ;0761: 57          
		SEP  R4                  ;0762: D4          
		DB   01H, 07H, 8FH       ;0763: DO    DIGIT         
		DB   64H, 00H, 00H       ;0766: LRGI  R2,0000       
		DB   06H, 8CH            ;0769: GONC  78C           
		DB   04H, 7FH            ;076B: GO    77F           
		DB   1CH, 41H            ;076D: RSHL  R2,1          
		DB   05H, 8DH            ;076F: GOCR  78D           
		DB   26H, 64H            ;0771: LRG   R3,R2         
		DB   1CH, 41H            ;0773: RSHL  R2,1          
		DB   05H, 8DH            ;0775: GOCR  78D           
		DB   1CH, 41H            ;0777: RSHL  R2,1          
		DB   05H, 8DH            ;0779: GOCR  78D           
		DB   20H, 46H            ;077B: ARG   R2,R3         
		DB   05H, 8DH            ;077D: GOCR  78D           
		DB   12H, 04H, 00H       ;077F: ARD   R2,00         
		DB   05H, 8DH            ;0782: GOCR  78D           
		DB   01H, 07H, 8FH       ;0784: DO    DIGIT         
		DB   05H, 6DH            ;0787: GOCR  76D           
		DB   0A4H, 1DH           ;0789: STRD  [1D],R2       
		DB   10H                 ;078B: SCR                 
		DB   02H                 ;078C: RET                 
		DB   11H                 ;078D: RCR                 
		DB   02H                 ;078E: RET                 
		DB   15H, 0AH, 30H, 8DH  ;078F: GOLT  VA,30,78D     
		DB   14H, 0AH, 3AH, 8DH  ;0793: GOGE  VA,3A,78D     
		DB   28H, 0AH            ;0797: LV    V0,VA         
		DB   0E0H, 0D0H          ;0799: AVI   V0,D0         
		DB   33H, 0AEH           ;079B: SKSP  VA,[R7]       
		DB   10H                 ;079D: SCR                 
		DB   02H                 ;079E: RET                 
S079F
		SEX  R5                  ;079F: E5          
		OUT  7                   ;07A0: 67          
		SEP  R4                  ;07A1: D4          
		DW   S01E1               ;07A2: 01 E1
		DW   S01ED               ;07A4: 01 ED
		DW   S01E6               ;07A6: 01 E6
		DW   S01C0               ;07A8: 01 C0
		DW   S0120               ;07AA: 01 20
		DW   S0100               ;07AC: 01 00
		DW   S03E5               ;07AE: 03 E5
		DW   S03EC               ;07B0: 03 EC
		DW   S05F2               ;07B2: 05 F2
		DW   S079F               ;07B4: 07 9F
		DW   S05C9               ;07B6: 05 C9
		DW   S02B6               ;07B8: 02 B6
		DW   S0605               ;07BA: 06 05
		DW   S01F5               ;07BC: 01 F5
		DW   S02CC               ;07BE: 02 CC
		DW   S0497               ;07C0: 04 97
		DW   S049E               ;07C2: 04 9E
		DW   S019A               ;07C4: 01 9A
		DW   S0133               ;07C6: 01 33
		DW   S01C3               ;07C8: 01 C3
		DW   S01CD               ;07CA: 01 CD
		DW   S02DC               ;07CC: 02 DC
		DW   S01D7               ;07CE: 01 D7
		DW   S056E               ;07D0: 05 6E
		DW   S008C               ;07D2: 00 8C
		DW   S04F3               ;07D4: 04 F3
		DW   S03D4               ;07D6: 03 D4
		DW   S04CF               ;07D8: 04 CF
		DW   S04DF               ;07DA: 04 DF
		DW   S0400               ;07DC: 04 00
		DW   S0436               ;07DE: 04 36
		DW   S0147               ;07E0: 01 47
		DW   S0161               ;07E2: 01 61
		DW   S01A6               ;07E4: 01 A6
		DW   S0156               ;07E6: 01 56
		DW   S0126               ;07E8: 01 26
		DW   S013E               ;07EA: 01 3E
		DW   S04BA               ;07EC: 04 BA
		DW   S04B4               ;07EE: 04 B4
		DW   S04BD               ;07F0: 04 BD
		DW   S02F8               ;07F2: 02 F8
		DW   S04A4               ;07F4: 04 A4
		DW   S04AD               ;07F6: 04 AD
		DW   S04C0               ;07F8: 04 C0
		DW   S04C5               ;07FA: 04 C5
		DW   S04CA               ;07FC: 04 CA
		DW   S0394               ;07FE: 03 94
		DB   0AAH                ;0800: AA
		DB   0ABH                ;0801: AB
		DW   S08DC               ;0802: 08 DC
		DB   00H                 ;0804: 00
		DB   00H                 ;0805: 00
		DW   S0752               ;0806: 07 52
		DW   S01FD               ;0808: 01 FD
		DW   S01D7               ;080A: 01 D7
		DB   00H                 ;080C: 00
		DB   00H                 ;080D: 00
		DW   S04ED               ;080E: 04 ED
		DW   S017F               ;0810: 01 7F
		DW   S0F69               ;0812: 0F 69
		DW   S017F               ;0814: 01 7F
		DW   S017F               ;0816: 01 7F
		DW   S0143               ;0818: 01 43
		DW   S0152               ;081A: 01 52
		DW   S0F7E               ;081C: 0F 7E
		DW   S0FB8               ;081E: 0F B8
		DB   0BH, 00H, 25H       ;0820: KEY   V0,825        
		DB   04H, 2AH            ;0823: GO    82A           
		DB   60H, 1DH, 0AH       ;0825: LRGI  R0,1D0A       
		DB   0A0H, 8EH           ;0828: STRD  [8E],R0       
		DB   81H, 10H            ;082A: LVI   V1,10         
		DB   0B1H, 1CH           ;082C: STVD  [1C],V1       
		DB   0CH                 ;082E: CLRTV               
		DB   00H, 00H, 17H       ;082F: EXEC  INIT          
		DB   0AH, 00H            ;0832: TAPE  00            
		DB   60H, 00H, 72H       ;0834: LRGI  R0,0072       
		DB   0B0H, 9DH           ;0837: STVD  [9D],V0       
		DB   0B0H, 11H           ;0839: STVD  [11],V0       
		DB   0B1H, 3FH           ;083B: STVD  [3F],V1       
		DB   81H, 07H            ;083D: LVI   V1,07         
		DB   01H, 07H, 37H       ;083F: DO    SETCOL        
		DB   0DH, 3FH            ;0842: TV    [3F]          
		DB   0FH                 ;0844: OUTSI               
		DB   'READY'             ;0845: 52
		                         ;0846: 45
		                         ;0847: 41
		                         ;0848: 44
		                         ;0849: 59
		                         ;084A: 8D
		DB   0FH                 ;084B: OUTSI               
		DB   '>'                 ;084C: BE
		DB   01H, 08H, 0B5H      ;084D: DO    08B5          
		DB   6EH, 1CH, 45H       ;0850: LRGI  R7,1C45       
		DB   60H, 00H, 00H       ;0853: LRGI  R0,0000       
		DB   0A0H, 41H           ;0856: STRD  [41],R0       
		DB   0A0H, 9FH           ;0858: STRD  [9F],R0       
		DB   0B0H, 44H           ;085A: STVD  [44],V0       
		DB   33H, 0AEH           ;085C: SKSP  VA,[R7]       
		DB   01H, 08H, 0DCH      ;085E: DO    08DC          
		DB   06H, 7DH            ;0861: GONC  87D           
		DB   01H, 09H, 2DH       ;0863: DO    092D          
		DB   01H, 09H, 5AH       ;0866: DO    095A          
		DB   06H, 77H            ;0869: GONC  877           
		DB   01H, 09H, 78H       ;086B: DO    0978          
		DB   15H, 43H, 03H, 4BH  ;086E: GOLT  [43],03,84B   
		DB   01H, 09H, 94H       ;0872: DO    0994          
		DB   04H, 4BH            ;0875: GO    84B           
		DB   15H, 43H, 03H, 4BH  ;0877: GOLT  [43],03,84B   
		DB   04H, 72H            ;087B: GO    872           
		DB   01H, 09H, 2DH       ;087D: DO    092D          
		DB   15H, 43H, 03H, 2FH  ;0880: GOLT  [43],03,82F   
		DB   8BH, 01H            ;0884: LVI   VB,01         
		DB   6EH, 1CH, 41H       ;0886: LRGI  R7,1C41       
		DB   04H, 0AAH           ;0889: GO    8AA           
		DB   64H, 0BH, 64H       ;088B: LRGI  R2,0B64       
		DB   21H, 4EH            ;088E: ARX   R2,[R7]       
		DB   0CEH, 01H           ;0890: ARI   R7,01         
		DB   33H, 0AEH           ;0892: SKSP  VA,[R7]       
		DB   27H, 64H            ;0894: LRX   R3,[R2]       
		DB   07H, 06H            ;0896: GOX   R3            
S0898
		DB   0CH                 ;0898: CLRTV               
		DB   5BH, 2FH            ;0899: GONZ  VB,82F        
		DB   01H, 0BH, 1AH       ;089B: DO    0B1A          
		DB   01H, 09H, 26H       ;089E: DO    0926          
		DB   05H, 2FH            ;08A1: GOCR  82F           
		DB   0BH, 01H, 0AAH      ;08A3: KEY   V1,8AA        
		DB   0B1H, 9DH           ;08A6: STVD  [9D],V1       
		DB   41H, 0B0H           ;08A8: GOZR  V1,8B0        
		DB   0AEH, 9BH           ;08AA: STRD  [9B],R7       
		DB   0CEH, 03H           ;08AC: ARI   R7,03         
		DB   04H, 8BH            ;08AE: GO    88B           
		DB   08H                 ;08B0: WKEY                
		DB   0FH                 ;08B1: OUTSI               
		DB   8DH                 ;08B2: 8D
		DB   04H, 2FH            ;08B3: GO    82F           
		DB   62H, 1CH, 45H       ;08B5: LRGI  R1,1C45       
		DB   0BH, 00H, 0B8H      ;08B8: KEY   V0,8B8        
		DB   09H                 ;08BB: KEYT                
		DB   40H, 0B2H           ;08BC: GOZR  V0,8B2        
		DB   2BH, 02H            ;08BE: STVX  V0,[R1]       
		DB   0D0H, 08H, 0CEH     ;08C0: GOEQ  V0,08,8CE     
		DB   16H, 00H            ;08C3: OUTS  V0            
		DB   08H                 ;08C5: WKEY                
		DB   0D0H, 0DH, 0E6H     ;08C6: GOEQ  V0,0D,8E6     
		DB   0E3H, 01H           ;08C9: AVI   V3,01         
		DB   0F3H, 8EH, 0B8H     ;08CB: GONE  V3,8E,8B8     
		DB   0E3H, 0FFH          ;08CE: AVI   V3,FF         
		DB   0F3H, 44H, 0D7H     ;08D0: GONE  V3,44,8D7     
		DB   0E3H, 01H           ;08D3: AVI   V3,01         
		DB   04H, 0D9H           ;08D5: GO    8D9           
		DB   0FH                 ;08D7: OUTSI               
		DB   88H                 ;08D8: 88
		DB   08H                 ;08D9: WKEY                
		DB   04H, 0B8H           ;08DA: GO    8B8           
S08DC
		DB   01H, 07H, 63H       ;08DC: DO    INTEG         
		DB   06H, 0E4H           ;08DF: GONC  8E4           
		DB   17H, 04H, 0E7H      ;08E1: GOEZ  R2,8E7        
		DB   0A4H, 41H           ;08E4: STRD  [41],R2       
		DB   02H                 ;08E6: RET                 
		DB   03H, 0AH, 6DH       ;08E7: GOTO  0A6D          
S08EA
		DB   01H, 0CH, 0DAH      ;08EA: DO    0CDA          
		DB   1AH, 0CH, 02H       ;08ED: PUSHM R6,02         
		DB   01H, 09H, 0CFH      ;08F0: DO    09CF          
		DB   06H, 0FBH           ;08F3: GONC  8FB           
		DB   6CH, 01H, 01H       ;08F5: LRGI  R6,0101       
		DB   03H, 09H, 03H       ;08F8: GOTO  0903          
		DB   0FAH, 2CH, 0E7H     ;08FB: GONE  VA,2C,8E7     
		DB   33H, 0AEH           ;08FE: SKSP  VA,[R7]       
		DB   01H, 0CH, 0DAH      ;0900: DO    0CDA          
		DB   1BH, 08H, 02H       ;0903: POPM  R4,02         
		DB   26H, 68H            ;0906: LRG   R3,R4         
		DB   60H, 1CH, 0DBH      ;0908: LRGI  R0,1CDB       
		DB   95H, 1CH            ;090B: LVD   V5,[1C]       
		DB   28H, 2CH            ;090D: LV    V2,VC         
		DB   0A6H, 19H           ;090F: STRD  [19],R3       
		DB   18H, 00H, 19H, 1CH  ;0911: SHOW  R0,[19],[1C]  
		DB   0E6H, 08H           ;0915: AVI   V6,08         
		DB   0E2H, 0FFH          ;0917: AVI   V2,FF         
		DB   52H, 0FH            ;0919: GONZ  V2,90F        
		DB   28H, 68H            ;091B: LV    V6,V8         
		DB   22H, 75H            ;091D: AV    V7,V5         
		DB   0EDH, 0FFH          ;091F: AVI   VD,FF         
		DB   5DH, 0DH            ;0921: GONZ  VD,90D        
		DB   03H, 08H, 99H       ;0923: GOTO  0899          
		DB   74H, 8EH            ;0926: LRD   R2,[8E]       
		DB   26H, 6EH            ;0928: LRG   R3,R7         
		DB   23H, 64H            ;092A: SRG   R3,R2         
		DB   02H                 ;092C: RET                 
		DB   6CH, 0EH, 0EAH      ;092D: LRGI  R6,0EEA       
		DB   01H, 05H, 20H       ;0930: DO    LOOKUP        
		DB   0B0H, 44H           ;0933: STVD  [44],V0       
		DB   62H, 1CH, 45H       ;0935: LRGI  R1,1C45       
		DB   26H, 62H            ;0938: LRG   R3,R1         
		DB   2BH, 0A2H           ;093A: STVX  VA,[R1]       
		DB   0DAH, 0DH, 47H      ;093C: GOEQ  VA,0D,947     
		DB   29H, 0AEH           ;093F: LVX   VA,[R7]       
		DB   0CEH, 01H           ;0941: ARI   R7,01         
		DB   0C2H, 01H           ;0943: ARI   R1,01         
		DB   04H, 3AH            ;0945: GO    93A           
		DB   23H, 26H            ;0947: SRG   R1,R3         
		DB   40H, 52H            ;0949: GOZR  V0,952        
		DB   0E3H, 01H           ;094B: AVI   V3,01         
		DB   0E3H, 02H           ;094D: AVI   V3,02         
		DB   0B3H, 43H           ;094F: STVD  [43],V3       
		DB   02H                 ;0951: RET                 
		DB   43H, 4DH            ;0952: GOZR  V3,94D        
		DB   80H, 90H            ;0954: LVI   V0,90         
		DB   0B0H, 44H           ;0956: STVD  [44],V0       
		DB   04H, 4BH            ;0958: GO    94B           
		DB   6CH, 1DH, 0AH       ;095A: LRGI  R6,1D0A       
		DB   72H, 8EH            ;095D: LRD   R1,[8E]       
		DB   26H, 4CH            ;095F: LRG   R2,R6         
		DB   23H, 42H            ;0961: SRG   R2,R1         
		DB   17H, 04H, 0D2H      ;0963: GOEZ  R2,9D2        
		DB   27H, 6CH            ;0966: LRX   R3,[R6]       
		DB   74H, 41H            ;0968: LRD   R2,[41]       
		DB   23H, 46H            ;096A: SRG   R2,R3         
		DB   17H, 04H, 0D4H      ;096C: GOEZ  R2,9D4        
		DB   05H, 72H            ;096F: GOCR  972           
		DB   02H                 ;0971: RET                 
		DB   0CCH, 02H           ;0972: ARI   R6,02         
		DB   21H, 0CCH           ;0974: ARX   R6,[R6]       
		DB   04H, 5DH            ;0976: GO    95D           
		DB   26H, 2CH            ;0978: LRG   R1,R6         
		DB   26H, 8CH            ;097A: LRG   R4,R6         
		DB   0C2H, 02H           ;097C: ARI   R1,02         
		DB   21H, 22H            ;097E: ARX   R1,[R1]       
		DB   74H, 8EH            ;0980: LRD   R2,[8E]       
		DB   23H, 42H            ;0982: SRG   R2,R1         
		DB   17H, 04H, 91H       ;0984: GOEZ  R2,991        
		DB   29H, 02H            ;0987: LVX   V0,[R1]       
		DB   2BH, 08H            ;0989: STVX  V0,[R4]       
		DB   0C8H, 01H           ;098B: ARI   R4,01         
		DB   0C2H, 01H           ;098D: ARI   R1,01         
		DB   04H, 80H            ;098F: GO    980           
		DB   0A8H, 8EH           ;0991: STRD  [8E],R4       
		DB   02H                 ;0993: RET                 
		DB   70H, 8EH            ;0994: LRD   R0,[8E]       
		DB   26H, 20H            ;0996: LRG   R1,R0         
		DB   12H, 02H, 43H       ;0998: ARD   R1,43         
		DB   0C2H, 02H           ;099B: ARI   R1,02         
		DB   74H, 3DH            ;099D: LRD   R2,[3D]       
		DB   23H, 42H            ;099F: SRG   R2,R1         
		DB   06H, 0CCH           ;09A1: GONC  9CC           
		DB   0A2H, 8EH           ;09A3: STRD  [8E],R1       
		DB   26H, 4CH            ;09A5: LRG   R2,R6         
		DB   23H, 40H            ;09A7: SRG   R2,R0         
		DB   17H, 04H, 0B8H      ;09A9: GOEZ  R2,9B8        
		DB   13H, 00H, 01H       ;09AC: SRI   R0,01         
		DB   13H, 02H, 01H       ;09AF: SRI   R1,01         
		DB   29H, 80H            ;09B2: LVX   V8,[R0]       
		DB   2BH, 82H            ;09B4: STVX  V8,[R1]       
		DB   04H, 0A5H           ;09B6: GO    9A5           
		DB   60H, 1CH, 41H       ;09B8: LRGI  R0,1C41       
		DB   98H, 43H            ;09BB: LVD   V8,[43]       
		DB   0E8H, 02H           ;09BD: AVI   V8,02         
		DB   29H, 90H            ;09BF: LVX   V9,[R0]       
		DB   2BH, 9CH            ;09C1: STVX  V9,[R6]       
		DB   0C0H, 01H           ;09C3: ARI   R0,01         
		DB   0CCH, 01H           ;09C5: ARI   R6,01         
		DB   0E8H, 0FFH          ;09C7: AVI   V8,FF         
		DB   58H, 0BFH           ;09C9: GONZ  V8,9BF        
		DB   02H                 ;09CB: RET                 
		DB   03H, 0AH, 77H       ;09CC: GOTO  0A77          
		DB   0DAH, 0DH, 0D4H     ;09CF: GOEQ  VA,0D,9D4     
		DB   11H                 ;09D2: RCR                 
		DB   02H                 ;09D3: RET                 
		DB   10H                 ;09D4: SCR                 
		DB   02H                 ;09D5: RET                 
S09D6
		DB   4BH, 0E0H           ;09D6: GOZR  VB,9E0        
		DB   62H, 1DH, 0AH       ;09D8: LRGI  R1,1D0A       
		DB   0A2H, 8EH           ;09DB: STRD  [8E],R1       
S09DD
		DB   03H, 08H, 2FH       ;09DD: GOTO  082F          
		DB   03H, 08H, 99H       ;09E0: GOTO  0899          
S09E3
		DB   4BH, 0E0H           ;09E3: GOZR  VB,9E0        
		DB   8BH, 00H            ;09E5: LVI   VB,00         
		DB   6EH, 1DH, 0AH       ;09E7: LRGI  R7,1D0A       
		DB   03H, 08H, 9EH       ;09EA: GOTO  089E          
S09ED
		DB   5BH, 0DDH           ;09ED: GONZ  VB,9DD        
		DB   13H, 0EH, 03H       ;09EF: SRI   R7,03         
		DB   21H, 0EEH           ;09F2: ARX   R7,[R7]       
		DB   04H, 0EAH           ;09F4: GO    9EA           
S09F6
		DB   4BH, 0E0H           ;09F6: GOZR  VB,9E0        
		DB   01H, 08H, 0DCH      ;09F8: DO    08DC          
		DB   01H, 09H, 5AH       ;09FB: DO    095A          
		DB   26H, 0ECH           ;09FE: LRG   R7,R6         
		DB   88H, 03H            ;0A00: LVI   V8,03         
		DB   06H, 07H            ;0A02: GONC  A07           
		DB   01H, 0AH, 20H       ;0A04: DO    0A20          
		DB   01H, 09H, 26H       ;0A07: DO    0926          
		DB   05H, 90H            ;0A0A: GOCR  A90           
		DB   0E8H, 0FFH          ;0A0C: AVI   V8,FF         
		DB   58H, 04H            ;0A0E: GONZ  V8,A04        
		DB   0BH, 00H, 10H       ;0A10: KEY   V0,A10        
		DB   09H                 ;0A13: KEYT                
		DB   08H                 ;0A14: WKEY                
		DB   0D0H, 20H, 1CH      ;0A15: GOEQ  V0,20,A1C     
		DB   50H, 10H            ;0A18: GONZ  V0,A10        
		DB   04H, 90H            ;0A1A: GO    A90           
		DB   88H, 01H            ;0A1C: LVI   V8,01         
		DB   04H, 04H            ;0A1E: GO    A04           
		DB   27H, 0EH            ;0A20: LRX   R0,[R7]       
		DB   0CEH, 03H           ;0A22: ARI   R7,03         
		DB   17H, 00H, 2CH       ;0A24: GOEZ  R0,A2C        
		DB   01H, 07H, 00H       ;0A27: DO    CBD           
		DB   0FH                 ;0A2A: OUTSI               
		DB   0A0H                ;0A2B: A0
		DB   29H, 0EH            ;0A2C: LVX   V0,[R7]       
		DB   40H, 38H            ;0A2E: GOZR  V0,A38        
		DB   6CH, 0EH, 0EAH      ;0A30: LRGI  R6,0EEA       
		DB   01H, 05H, 50H       ;0A33: DO    KEYOUT        
		DB   0FH                 ;0A36: OUTSI               
		DB   0A0H                ;0A37: A0
		DB   0CEH, 01H           ;0A38: ARI   R7,01         
		DB   29H, 0EH            ;0A3A: LVX   V0,[R7]       
		DB   40H, 48H            ;0A3C: GOZR  V0,A48        
		DB   16H, 00H            ;0A3E: OUTS  V0            
		DB   0D0H, 0DH, 45H      ;0A40: GOEQ  V0,0D,A45     
		DB   04H, 38H            ;0A43: GO    A38           
		DB   0CEH, 01H           ;0A45: ARI   R7,01         
		DB   02H                 ;0A47: RET                 
		DB   0FH                 ;0A48: OUTSI               
		DB   '?'                 ;0A49: BF
		DB   90H, 40H            ;0A4A: LVD   V0,[40]       
		DB   2BH, 0EH            ;0A4C: STVX  V0,[R7]       
		DB   04H, 3EH            ;0A4E: GO    A3E           
S0A50
		DB   5BH, 90H            ;0A50: GONZ  VB,A90        
		DB   01H, 0AH, 5AH       ;0A52: DO    0A5A          
		DB   26H, 0ECH           ;0A55: LRG   R7,R6         
		DB   03H, 08H, 0A3H      ;0A57: GOTO  08A3          
		DB   01H, 08H, 0DCH      ;0A5A: DO    08DC          
		DB   06H, 6DH            ;0A5D: GONC  A6D           
		DB   01H, 09H, 5AH       ;0A5F: DO    095A          
		DB   05H, 47H            ;0A62: GOCR  A47           
		DB   0FH                 ;0A64: OUTSI               
		DB   0DH                 ;0A65: 0D
		DB   'HOW?'              ;0A66: 48
		                         ;0A67: 4F
		                         ;0A68: 57
		                         ;0A69: 3F
		DB   0A0H                ;0A6A: A0
		DB   04H, 80H            ;0A6B: GO    A80           
		DB   0FH                 ;0A6D: OUTSI               
		DB   0DH                 ;0A6E: 0D
		DB   'WHAT?'             ;0A6F: 57
		                         ;0A70: 48
		                         ;0A71: 41
		                         ;0A72: 54
		                         ;0A73: 3F
		DB   0A0H                ;0A74: A0
		DB   04H, 80H            ;0A75: GO    A80           
		DB   0FH                 ;0A77: OUTSI               
		DB   0DH                 ;0A78: 0D
		DB   'SORRY?'            ;0A79: 53
		                         ;0A7A: 4F
		                         ;0A7B: 52
		                         ;0A7C: 52
		                         ;0A7D: 59
		                         ;0A7E: 3F
		DB   0A0H                ;0A7F: A0
		DB   13H, 0EH, 01H       ;0A80: SRI   R7,01         
		DB   29H, 0EH            ;0A83: LVX   V0,[R7]       
		DB   0B0H, 40H           ;0A85: STVD  [40],V0       
		DB   81H, 00H            ;0A87: LVI   V1,00         
		DB   2BH, 1EH            ;0A89: STVX  V1,[R7]       
		DB   7EH, 9BH            ;0A8B: LRD   R7,[9B]       
		DB   01H, 0AH, 20H       ;0A8D: DO    0A20          
		DB   03H, 08H, 2FH       ;0A90: GOTO  082F          
S0A93
		DB   80H, 00H            ;0A93: LVI   V0,00         
		DB   0DH, 00H            ;0A95: TV    V0            
		DB   66H, 1DH, 00H       ;0A97: LRGI  R3,1D00       
		DB   72H, 3DH            ;0A9A: LRD   R1,[3D]       
		DB   26H, 46H            ;0A9C: LRG   R2,R3         
		DB   23H, 24H            ;0A9E: SRG   R1,R2         
		DB   0E2H, 01H           ;0AA0: AVI   V2,01         
		DB   0AH, 01H            ;0AA2: TAPE  01            
		DB   1FH, 62H            ;0AA4: RT    [R3],V2       
		DB   0AH, 00H            ;0AA6: TAPE  00            
		DB   27H, 0C6H           ;0AA8: LRX   R6,[R3]       
		DB   0C6H, 02H           ;0AAA: ARI   R3,02         
		DB   27H, 46H            ;0AAC: LRX   R2,[R3]       
		DB   60H, 1DH, 00H       ;0AAE: LRGI  R0,1D00       
		DB   20H, 40H            ;0AB1: ARG   R2,R0         
		DB   60H, 1DH, 09H       ;0AB3: LRGI  R0,1D09       
		DB   23H, 04H            ;0AB6: SRG   R0,R2         
		DB   05H, 0C8H           ;0AB8: GOCR  AC8           
		DB   70H, 3DH            ;0ABA: LRD   R0,[3D]       
		DB   23H, 04H            ;0ABC: SRG   R0,R2         
		DB   06H, 0C8H           ;0ABE: GONC  AC8           
		DB   01H, 0AH, 0DEH      ;0AC0: DO    0ADE          
		DB   23H, 0C8H           ;0AC3: SRG   R6,R4         
		DB   17H, 0CH, 0D5H      ;0AC5: GOEZ  R6,AD5        
		DB   0DH, 3FH            ;0AC8: TV    [3F]          
		DB   0FH                 ;0ACA: OUTSI               
		DB   0DH, 4CH            ;0ACB: TV    [4C]          
		DB   44H, 45H            ;0ACD: GOZR  V4,A45        
		DB   52H, 52H            ;0ACF: GONZ  V2,A52        
		DB   8DH, 03H            ;0AD1: LVI   VD,03         
		DB   09H                 ;0AD3: KEYT                
		DB   0D8H, 0A4H, 8EH     ;0AD4: GOEQ  V8,A4,A8E     
		DB   0DH, 3FH            ;0AD7: TV    [3F]          
		DB   5BH, 90H            ;0AD9: GONZ  VB,A90        
		DB   03H, 09H, 0E7H      ;0ADB: GOTO  09E7          
		DB   68H, 00H, 00H       ;0ADE: LRGI  R4,0000       
		DB   21H, 86H            ;0AE1: ARX   R4,[R3]       
		DB   0C6H, 01H           ;0AE3: ARI   R3,01         
		DB   26H, 04H            ;0AE5: LRG   R0,R2         
		DB   23H, 06H            ;0AE7: SRG   R0,R3         
		DB   50H, 0E3H           ;0AE9: GONZ  V0,AE3        
		DB   51H, 0E1H           ;0AEB: GONZ  V1,AE1        
		DB   02H                 ;0AED: RET                 
S0AEE
		DB   80H, 00H            ;0AEE: LVI   V0,00         
		DB   0DH, 00H            ;0AF0: TV    V0            
		DB   74H, 8EH            ;0AF2: LRD   R2,[8E]       
		DB   66H, 1EH, 00H       ;0AF4: LRGI  R3,1E00       
		DB   23H, 46H            ;0AF7: SRG   R2,R3         
		DB   0C6H, 02H           ;0AF9: ARI   R3,02         
		DB   26H, 26H            ;0AFB: LRG   R1,R3         
		DB   2AH, 46H            ;0AFD: STRX  [R3],R2       
		DB   74H, 8EH            ;0AFF: LRD   R2,[8E]       
		DB   01H, 0AH, 0DEH      ;0B01: DO    0ADE          
		DB   66H, 1EH, 00H       ;0B04: LRGI  R3,1E00       
		DB   2AH, 86H            ;0B07: STRX  [R3],R4       
		DB   23H, 46H            ;0B09: SRG   R2,R3         
		DB   0E4H, 01H           ;0B0B: AVI   V4,01         
		DB   0AH, 02H            ;0B0D: TAPE  02            
		DB   1EH, 64H            ;0B0F: WT    [R3],R2       
		DB   0AH, 00H            ;0B11: TAPE  00            
		DB   04H, 0AAH           ;0B13: GO    BAA           
		DB   03H, 08H, 2FH       ;0B15: GOTO  082F          
		DB   33H, 0AEH           ;0B18: SKSP  VA,[R7]       
		DB   0FAH, 0DH, 18H      ;0B1A: GONE  VA,0D,B18     
		DB   02H                 ;0B1D: RET                 
S0B1E
		DB   5BH, 15H            ;0B1E: GONZ  VB,B15        
		DB   92H, 9DH            ;0B20: LVD   V2,[9D]       
		DB   42H, 0B2H           ;0B22: GOZR  V2,BB2        
		DB   0B2H, 9EH           ;0B24: STVD  [9E],V2       
		DB   82H, 00H            ;0B26: LVI   V2,00         
		DB   0B2H, 9DH           ;0B28: STVD  [9D],V2       
		DB   03H, 0AH, 52H       ;0B2A: GOTO  0A52          
S0B2D
		DB   5BH, 15H            ;0B2D: GONZ  VB,B15        
		DB   01H, 0AH, 5AH       ;0B2F: DO    0A5A          
		DB   01H, 0BH, 55H       ;0B32: DO    0B55          
		DB   1AH, 0EH, 02H       ;0B35: PUSHM R7,02         
		DB   72H, 9FH            ;0B38: LRD   R1,[9F]       
		DB   0C2H, 01H           ;0B3A: ARI   R1,01         
		DB   0A2H, 9FH           ;0B3C: STRD  [9F],R1       
		DB   26H, 0ECH           ;0B3E: LRG   R7,R6         
		DB   03H, 08H, 0A3H      ;0B40: GOTO  08A3          
S0B43
		DB   72H, 9FH            ;0B43: LRD   R1,[9F]       
		DB   17H, 02H, 52H       ;0B45: GOEZ  R1,B52        
		DB   13H, 02H, 01H       ;0B48: SRI   R1,01         
		DB   0A2H, 9FH           ;0B4B: STRD  [9F],R1       
		DB   1BH, 0EH, 02H       ;0B4D: POPM  R7,02         
		DB   04H, 0B2H           ;0B50: GO    BB2           
		DB   03H, 0AH, 64H       ;0B52: GOTO  0A64          
		DB   1BH, 06H, 02H       ;0B55: POPM  R3,02         
		DB   0EH                 ;0B58: EML                 
S0B59
		GHI  R2                  ;0B59: 92          
		STR  R6                  ;0B5A: 56          
		INC  R6                  ;0B5B: 16          
		GLO  R2                  ;0B5C: 82          
		STR  R6                  ;0B5D: 56          
		SEP  R4                  ;0B5E: D4          
		DB   72H, 3DH            ;0B5F: LRD   R1,[3D]       
		DB   0C2H, 28H           ;0B61: ARI   R1,28         
		DB   23H, 02H            ;0B63: SRG   R0,R1         
		DB   06H, 6BH            ;0B65: GONC  B6B           
		DB   1AH, 06H, 02H       ;0B67: PUSHM R3,02         
		DB   02H                 ;0B6A: RET                 
		DB   03H, 0AH, 77H       ;0B6B: GOTO  0A77          
S0B6E
		DB   01H, 0CH, 0CH       ;0B6E: DO    0C0C          
		DB   3BH, 00H, 1DH       ;0B71: FIX   R0,[1D]       
		DB   80H, 07H            ;0B74: LVI   V0,07         
		DB   2CH, 10H            ;0B76: VAND  V1,V0         
		DB   01H, 09H, 0CFH      ;0B78: DO    09CF          
		DB   06H, 85H            ;0B7B: GONC  B85           
		DB   90H, 3FH            ;0B7D: LVD   V0,[3F]       
		DB   82H, 0F0H           ;0B7F: LVI   V2,F0         
		DB   2CH, 20H            ;0B81: VAND  V2,V0         
		DB   04H, 0A6H           ;0B83: GO    BA6           
		DB   0FAH, 2CH, 0B5H     ;0B85: GONE  VA,2C,BB5     
		DB   33H, 0AEH           ;0B88: SKSP  VA,[R7]       
		DB   1AH, 01H, 01H       ;0B8A: PUSHM R0,01         
		DB   01H, 0CH, 0DAH      ;0B8D: DO    0CDA          
		DB   1AH, 0CH, 02H       ;0B90: PUSHM R6,02         
		DB   0FAH, 2CH, 0B5H     ;0B93: GONE  VA,2C,BB5     
		DB   33H, 0AEH           ;0B96: SKSP  VA,[R7]       
		DB   01H, 0CH, 0DAH      ;0B98: DO    0CDA          
		DB   1BH, 08H, 02H       ;0B9B: POPM  R4,02         
		DB   1BH, 01H, 01H       ;0B9E: POPM  R0,01         
		DB   01H, 07H, 3DH       ;0BA1: DO    COLDOT        
		DB   04H, 0B2H           ;0BA4: GO    BB2           
		DB   2DH, 21H            ;0BA6: VOR   V2,V1         
		DB   0B2H, 3FH           ;0BA8: STVD  [3F],V2       
S0BAA
		DB   0DH, 3FH            ;0BAA: TV    [3F]          
		DB   04H, 0B2H           ;0BAC: GO    BB2           
S0BAE
		DB   80H, 00H            ;0BAE: LVI   V0,00         
		DB   0DH, 00H            ;0BB0: TV    V0            
		DB   03H, 08H, 99H       ;0BB2: GOTO  0899          
		DB   03H, 0AH, 6DH       ;0BB5: GOTO  0A6D          
		DB   14H, 0AH, 41H, 0BEH ;0BB8: GOGE  VA,41,BBE     
		DB   11H                 ;0BBC: RCR                 
		DB   02H                 ;0BBD: RET                 
		DB   14H, 0AH, 5BH, 0BCH ;0BBE: GOGE  VA,5B,BBC     
		DB   0EAH, 0BFH          ;0BC2: AVI   VA,BF         
		DB   28H, 1AH            ;0BC4: LV    V1,VA         
		DB   1CH, 01H            ;0BC6: RSHL  R0,1          
		DB   33H, 0AEH           ;0BC8: SKSP  VA,[R7]       
		DB   41H, 0D4H           ;0BCA: GOZR  V1,BD4        
		DB   6CH, 1CH, 0A7H      ;0BCC: LRGI  R6,1CA7       
		DB   12H, 0CH, 01H       ;0BCF: ARD   R6,01         
		DB   10H                 ;0BD2: SCR                 
		DB   02H                 ;0BD3: RET                 
		DB   01H, 0CH, 0C9H      ;0BD4: DO    0CC9          
		DB   06H, 0CCH           ;0BD7: GONC  BCC           
		DB   7CH, 8EH            ;0BD9: LRD   R6,[8E]       
		DB   3BH, 00H, 1DH       ;0BDB: FIX   R0,[1D]       
		DB   1CH, 01H            ;0BDE: RSHL  R0,1          
		DB   20H, 0C0H           ;0BE0: ARG   R6,R0         
		DB   10H                 ;0BE2: SCR                 
		DB   02H                 ;0BE3: RET                 
		DW   S0A50               ;0BE4: 0A 50
		DW   S0B2D               ;0BE6: 0B 2D
		DW   S0B1E               ;0BE8: 0B 1E
		DW   S0D87               ;0BEA: 0D 87
		DW   S0DFF               ;0BEC: 0D FF
		DW   S09E3               ;0BEE: 09 E3
		DW   S09ED               ;0BF0: 09 ED
		DW   S0B43               ;0BF2: 0B 43
		DW   S0D09               ;0BF4: 0D 09
		DW   S09D6               ;0BF6: 09 D6
		DW   S09DD               ;0BF8: 09 DD
		DW   S0E85               ;0BFA: 0E 85
		DW   S0AEE               ;0BFC: 0A EE
		DW   S08EA               ;0BFE: 08 EA
		DW   S0898               ;0C00: 08 98
		DW   S09F6               ;0C02: 09 F6
		DW   S0A93               ;0C04: 0A 93
		DW   S0BAA               ;0C06: 0B AA
		DW   S0B6E               ;0C08: 0B 6E
		DW   S0BAE               ;0C0A: 0B AE
		DB   0DAH, 2DH, 1CH      ;0C0C: GOEQ  VA,2D,C1C     
		DB   0DAH, 2BH, 25H      ;0C0F: GOEQ  VA,2B,C25     
		DB   01H, 0CH, 4CH       ;0C12: DO    0C4C          
		DB   0DAH, 2DH, 29H      ;0C15: GOEQ  VA,2D,C29     
		DB   0DAH, 2BH, 3CH      ;0C18: GOEQ  VA,2B,C3C     
		DB   02H                 ;0C1B: RET                 
		DB   33H, 0AEH           ;0C1C: SKSP  VA,[R7]       
		DB   01H, 0CH, 4CH       ;0C1E: DO    0C4C          
		DB   39H, 1DH            ;0C21: CHGS  [1D]          
		DB   04H, 15H            ;0C23: GO    C15           
		DB   33H, 0AEH           ;0C25: SKSP  VA,[R7]       
		DB   04H, 12H            ;0C27: GO    C12           
		DB   33H, 0AEH           ;0C29: SKSP  VA,[R7]       
		DB   1AH, 1DH, 02H       ;0C2B: PUSHM [1D],02       
		DB   01H, 0CH, 4CH       ;0C2E: DO    0C4C          
		DB   38H, 21H, 1DH       ;0C31: FMOV  [21],[1D]     
		DB   1BH, 1DH, 02H       ;0C34: POPM  [1D],02       
		DB   3DH, 1DH, 21H       ;0C37: FSUB  [1D],[21]     
		DB   04H, 15H            ;0C3A: GO    C15           
		DB   33H, 0AEH           ;0C3C: SKSP  VA,[R7]       
		DB   1AH, 1DH, 02H       ;0C3E: PUSHM [1D],02       
		DB   01H, 0CH, 4CH       ;0C41: DO    0C4C          
		DB   1BH, 21H, 02H       ;0C44: POPM  [21],02       
		DB   3CH, 1DH, 21H       ;0C47: FADD  [1D],[21]     
		DB   04H, 15H            ;0C4A: GO    C15           
		DB   01H, 0CH, 79H       ;0C4C: DO    0C79          
		DB   0DAH, 2AH, 56H      ;0C4F: GOEQ  VA,2A,C56     
		DB   0DAH, 2FH, 66H      ;0C52: GOEQ  VA,2F,C66     
		DB   02H                 ;0C55: RET                 
		DB   33H, 0AEH           ;0C56: SKSP  VA,[R7]       
		DB   1AH, 1DH, 02H       ;0C58: PUSHM [1D],02       
		DB   01H, 0CH, 79H       ;0C5B: DO    0C79          
		DB   1BH, 21H, 02H       ;0C5E: POPM  [21],02       
		DB   3EH, 1DH, 21H       ;0C61: FMPY  [1D],[21]     
		DB   04H, 4FH            ;0C64: GO    C4F           
		DB   33H, 0AEH           ;0C66: SKSP  VA,[R7]       
		DB   1AH, 1DH, 02H       ;0C68: PUSHM [1D],02       
		DB   01H, 0CH, 79H       ;0C6B: DO    0C79          
		DB   38H, 21H, 1DH       ;0C6E: FMOV  [21],[1D]     
		DB   1BH, 1DH, 02H       ;0C71: POPM  [1D],02       
		DB   3FH, 1DH, 21H       ;0C74: FDIV  [1D],[21]     
		DB   04H, 4FH            ;0C77: GO    C4F           
		DB   01H, 07H, 63H       ;0C79: DO    INTEG         
		DB   05H, 0B5H           ;0C7C: GOCR  CB5           
		DB   6CH, 0FH, 51H       ;0C7E: LRGI  R6,0F51       
		DB   01H, 05H, 20H       ;0C81: DO    LOOKUP        
		DB   40H, 0B6H           ;0C84: GOZR  V0,CB6        
		DB   62H, 0CH, 0EH       ;0C86: LRGI  R1,0C0E       
		DB   12H, 02H, 00H       ;0C89: ARD   R1,00         
		DB   07H, 02H            ;0C8C: GOX   R1            
		DB   72H, 8EH            ;0C8E: LRD   R1,[8E]       
		DB   70H, 3DH            ;0C90: LRD   R0,[3D]       
		DB   23H, 02H            ;0C92: SRG   R0,R1         
		DB   3AH, 1DH, 00H       ;0C94: FLOAT [1D],R0       
		DB   02H                 ;0C97: RET                 
		DB   70H, 14H            ;0C98: LRD   R0,[14]       
		DB   04H, 94H            ;0C9A: GO    C94           
		DB   91H, 9EH            ;0C9C: LVD   V1,[9E]       
		DB   80H, 00H            ;0C9E: LVI   V0,00         
		DB   04H, 94H            ;0CA0: GO    C94           
		DB   91H, 1BH            ;0CA2: LVD   V1,[1B]       
		DB   04H, 9EH            ;0CA4: GO    C9E           
		DB   19H, 01H            ;0CA6: RAND  V1            
		DB   04H, 9EH            ;0CA8: GO    C9E           
		DB   01H, 0CH, 0C9H      ;0CAA: DO    0CC9          
		DB   06H, 0C6H           ;0CAD: GONC  CC6           
		DB   37H, 1DH            ;0CAF: SIGN  [1D]          
		DB   06H, 0B5H           ;0CB1: GONC  CB5           
		DB   39H, 1DH            ;0CB3: CHGS  [1D]          
		DB   02H                 ;0CB5: RET                 
		DB   01H, 0BH, 0B8H      ;0CB6: DO    0BB8          
		DB   06H, 0C1H           ;0CB9: GONC  CC1           
		DB   27H, 0CH            ;0CBB: LRX   R0,[R6]       
		DB   38H, 1DH, 00H       ;0CBD: FMOV  [1D],[00]     
		DB   02H                 ;0CC0: RET                 
		DB   01H, 0CH, 0C9H      ;0CC1: DO    0CC9          
		DB   05H, 0C0H           ;0CC4: GOCR  CC0           
		DB   03H, 0AH, 6DH       ;0CC6: GOTO  0A6D          
		DB   0FAH, 28H, 0D8H     ;0CC9: GONE  VA,28,CD8     
		DB   33H, 0AEH           ;0CCC: SKSP  VA,[R7]       
		DB   01H, 0CH, 0CH       ;0CCE: DO    0C0C          
		DB   0FAH, 29H, 0C6H     ;0CD1: GONE  VA,29,CC6     
		DB   33H, 0AEH           ;0CD4: SKSP  VA,[R7]       
		DB   10H                 ;0CD6: SCR                 
		DB   02H                 ;0CD7: RET                 
		DB   11H                 ;0CD8: RCR                 
		DB   02H                 ;0CD9: RET                 
		DB   01H, 0CH, 0CH       ;0CDA: DO    0C0C          
		DB   1AH, 1DH, 02H       ;0CDD: PUSHM [1D],02       
		DB   0FAH, 2CH, 0C6H     ;0CE0: GONE  VA,2C,CC6     
		DB   33H, 0AEH           ;0CE3: SKSP  VA,[R7]       
		DB   01H, 0CH, 0CH       ;0CE5: DO    0C0C          
		DB   3BH, 00H, 1DH       ;0CE8: FIX   R0,[1D]       
		DB   1BH, 1DH, 02H       ;0CEB: POPM  [1D],02       
		DB   3BH, 02H, 1DH       ;0CEE: FIX   R1,[1D]       
		DB   28H, 0D1H           ;0CF1: LV    VD,V1         
		DB   28H, 0C3H           ;0CF3: LV    VC,V3         
		DB   02H                 ;0CF5: RET                 
		DB   80H                 ;0CF6: 80
		DB   'TI'                ;0CF7: 54
		                         ;0CF8: 49
		DB   81H                 ;0CF9: 81
		DB   'TO'                ;0CFA: 54
		                         ;0CFB: 4F
		DB   82H                 ;0CFC: 82
		DB   'FQ'                ;0CFD: 46
		                         ;0CFE: 51
		DB   83H                 ;0CFF: 83
		DB   'PT'                ;0D00: 50
		                         ;0D01: 54
		DB   00H                 ;0D02: 00
		DB   80H                 ;0D03: 80
		DB   'THEN'              ;0D04: 54
		                         ;0D05: 48
		                         ;0D06: 45
		                         ;0D07: 4E
		DB   00H                 ;0D08: 00
S0D09
		DB   6CH, 0CH, 0F6H      ;0D09: LRGI  R6,0CF6       
		DB   01H, 05H, 20H       ;0D0C: DO    LOOKUP        
		DB   1AH, 00H, 01H       ;0D0F: PUSHM R0,01         
		DB   50H, 17H            ;0D12: GONZ  V0,D17        
		DB   01H, 0BH, 0B8H      ;0D14: DO    0BB8          
		DB   0FAH, 3DH, 70H      ;0D17: GONE  VA,3D,D70     
		DB   33H, 0AEH           ;0D1A: SKSP  VA,[R7]       
		DB   0D0H, 83H, 4BH      ;0D1C: GOEQ  V0,83,D4B     
		DB   1AH, 0CH, 02H       ;0D1F: PUSHM R6,02         
		DB   01H, 0CH, 0CH       ;0D22: DO    0C0C          
		DB   1BH, 0CH, 02H       ;0D25: POPM  R6,02         
		DB   1BH, 00H, 01H       ;0D28: POPM  R0,01         
		DB   40H, 45H            ;0D2B: GOZR  V0,D45        
		DB   3BH, 02H, 1DH       ;0D2D: FIX   R1,[1D]       
		DB   0D0H, 80H, 3FH      ;0D30: GOEQ  V0,80,D3F     
		DB   0D0H, 81H, 3BH      ;0D33: GOEQ  V0,81,D3B     
		DB   0B3H, 12H           ;0D36: STVD  [12],V3       
		DB   03H, 08H, 99H       ;0D38: GOTO  0899          
		DB   0B3H, 13H           ;0D3B: STVD  [13],V3       
		DB   04H, 38H            ;0D3D: GO    D38           
		DB   0B3H, 15H           ;0D3F: STVD  [15],V3       
		DB   0B2H, 14H           ;0D41: STVD  [14],V2       
		DB   04H, 38H            ;0D43: GO    D38           
		DB   70H, 1DH            ;0D45: LRD   R0,[1D]       
		DB   2AH, 0CH            ;0D47: STRX  [R6],R0       
		DB   04H, 38H            ;0D49: GO    D38           
		DB   1BH, 00H, 01H       ;0D4B: POPM  R0,01         
		DB   84H, 00H            ;0D4E: LVI   V4,00         
		DB   62H, 1CH, 0DBH      ;0D50: LRGI  R1,1CDB       
		DB   81H, 00H            ;0D53: LVI   V1,00         
		DB   01H, 0DH, 73H       ;0D55: DO    0D73          
		DB   1DH, 04H            ;0D58: RSHR  R0,4          
		DB   01H, 0DH, 73H       ;0D5A: DO    0D73          
		DB   22H, 01H            ;0D5D: AV    V0,V1         
		DB   2BH, 02H            ;0D5F: STVX  V0,[R1]       
		DB   0C2H, 01H           ;0D61: ARI   R1,01         
		DB   0E4H, 01H           ;0D63: AVI   V4,01         
		DB   0B4H, 1CH           ;0D65: STVD  [1C],V4       
		DB   01H, 09H, 0CFH      ;0D67: DO    09CF          
		DB   05H, 38H            ;0D6A: GOCR  D38           
		DB   15H, 04H, 10H, 53H  ;0D6C: GOLT  V4,10,D53     
		DB   03H, 0AH, 6DH       ;0D70: GOTO  0A6D          
		DB   01H, 07H, 8FH       ;0D73: DO    DIGIT         
		DB   05H, 86H            ;0D76: GOCR  D86           
		DB   15H, 0AH, 41H, 70H  ;0D78: GOLT  VA,41,D70     
		DB   14H, 0AH, 47H, 70H  ;0D7C: GOGE  VA,47,D70     
		DB   0EAH, 0C9H          ;0D80: AVI   VA,C9         
		DB   28H, 0AH            ;0D82: LV    V0,VA         
		DB   33H, 0AEH           ;0D84: SKSP  VA,[R7]       
		DB   02H                 ;0D86: RET                 
S0D87
		DB   01H, 0CH, 0CH       ;0D87: DO    0C0C          
		DB   0DAH, 3CH, 98H      ;0D8A: GOEQ  VA,3C,D98     
		DB   0DAH, 3DH, 0C2H     ;0D8D: GOEQ  VA,3D,DC2     
		DB   0DAH, 3EH, 0C9H     ;0D90: GOEQ  VA,3E,DC9     
		DB   38H, 21H, 1DH       ;0D93: FMOV  [21],[1D]     
		DB   04H, 0D1H           ;0D96: GO    DD1           
		DB   33H, 0AEH           ;0D98: SKSP  VA,[R7]       
		DB   0DAH, 3DH, 0AAH     ;0D9A: GOEQ  VA,3D,DAA     
		DB   0DAH, 3EH, 0B8H     ;0D9D: GOEQ  VA,3E,DB8     
		DB   01H, 0DH, 0EEH      ;0DA0: DO    0DEE          
		DB   37H, 21H            ;0DA3: SIGN  [21]          
		DB   05H, 0D8H           ;0DA5: GOCR  DD8           
		DB   03H, 08H, 99H       ;0DA7: GOTO  0899          
		DB   33H, 0AEH           ;0DAA: SKSP  VA,[R7]       
		DB   01H, 0DH, 0EEH      ;0DAC: DO    0DEE          
		DB   37H, 21H            ;0DAF: SIGN  [21]          
		DB   05H, 0D8H           ;0DB1: GOCR  DD8           
		DB   35H, 21H, 0D8H      ;0DB3: GOEZ  [21],DD8      
		DB   04H, 0A7H           ;0DB6: GO    DA7           
		DB   33H, 0AEH           ;0DB8: SKSP  VA,[R7]       
		DB   01H, 0DH, 0EEH      ;0DBA: DO    0DEE          
		DB   35H, 21H, 0A7H      ;0DBD: GOEZ  [21],DA7      
		DB   04H, 0D8H           ;0DC0: GO    DD8           
		DB   33H, 0AEH           ;0DC2: SKSP  VA,[R7]       
		DB   01H, 0DH, 0EEH      ;0DC4: DO    0DEE          
		DB   04H, 0B3H           ;0DC7: GO    DB3           
		DB   33H, 0AEH           ;0DC9: SKSP  VA,[R7]       
		DB   0DAH, 3DH, 0E3H     ;0DCB: GOEQ  VA,3D,DE3     
		DB   01H, 0DH, 0EEH      ;0DCE: DO    0DEE          
		DB   37H, 21H            ;0DD1: SIGN  [21]          
		DB   05H, 0A7H           ;0DD3: GOCR  DA7           
		DB   35H, 21H, 0A7H      ;0DD5: GOEZ  [21],DA7      
		DB   6CH, 0DH, 03H       ;0DD8: LRGI  R6,0D03       
		DB   01H, 05H, 20H       ;0DDB: DO    LOOKUP        
		DB   40H, 70H            ;0DDE: GOZR  V0,D70        
		DB   03H, 0AH, 52H       ;0DE0: GOTO  0A52          
		DB   33H, 0AEH           ;0DE3: SKSP  VA,[R7]       
		DB   01H, 0DH, 0EEH      ;0DE5: DO    0DEE          
		DB   37H, 21H            ;0DE8: SIGN  [21]          
		DB   05H, 0A7H           ;0DEA: GOCR  DA7           
		DB   04H, 0D8H           ;0DEC: GO    DD8           
		DB   1AH, 1DH, 02H       ;0DEE: PUSHM [1D],02       
		DB   01H, 0CH, 0CH       ;0DF1: DO    0C0C          
		DB   1BH, 21H, 02H       ;0DF4: POPM  [21],02       
		DB   3DH, 21H, 1DH       ;0DF7: FSUB  [21],[1D]     
		DB   02H                 ;0DFA: RET                 
		DB   80H                 ;0DFB: 80
		DB   'AT'                ;0DFC: 41
		                         ;0DFD: 54
		DB   00H                 ;0DFE: 00
S0DFF
		DB   6CH, 0DH, 0FBH      ;0DFF: LRGI  R6,0DFB       
		DB   01H, 05H, 20H       ;0E02: DO    LOOKUP        
		DB   0B0H, 11H           ;0E05: STVD  [11],V0       
		DB   40H, 0EH            ;0E07: GOZR  V0,E0E        
		DB   01H, 0CH, 0DAH      ;0E09: DO    0CDA          
		DB   0ACH, 19H           ;0E0C: STRD  [19],R6       
		DB   01H, 09H, 0CFH      ;0E0E: DO    09CF          
		DB   06H, 1EH            ;0E11: GONC  E1E           
		DB   80H, 0DH            ;0E13: LVI   V0,0D         
		DB   16H, 00H            ;0E15: OUTS  V0            
		DB   80H, 00H            ;0E17: LVI   V0,00         
		DB   0B0H, 11H           ;0E19: STVD  [11],V0       
		DB   03H, 08H, 99H       ;0E1B: GOTO  0899          
		DB   0DAH, 3BH, 38H      ;0E1E: GOEQ  VA,3B,E38     
		DB   0DAH, 2CH, 3CH      ;0E21: GOEQ  VA,2C,E3C     
		DB   0DAH, 22H, 5DH      ;0E24: GOEQ  VA,22,E5D     
		DB   01H, 0CH, 0CH       ;0E27: DO    0C0C          
		DB   01H, 0EH, 75H       ;0E2A: DO    0E75          
		DB   01H, 09H, 0CFH      ;0E2D: DO    09CF          
		DB   05H, 13H            ;0E30: GOCR  E13           
		DB   0DAH, 2CH, 3CH      ;0E32: GOEQ  VA,2C,E3C     
		DB   0FAH, 3BH, 0D7H     ;0E35: GONE  VA,3B,ED7     
		DB   33H, 0AEH           ;0E38: SKSP  VA,[R7]       
		DB   04H, 56H            ;0E3A: GO    E56           
		DB   33H, 0AEH           ;0E3C: SKSP  VA,[R7]       
		DB   14H, 11H, 80H, 56H  ;0E3E: GOGE  [11],80,E56   
		DB   81H, 2AH            ;0E42: LVI   V1,2A         
		DB   04H, 4EH            ;0E44: GO    E4E           
		DB   90H, 16H            ;0E46: LVD   V0,[16]       
		DB   25H, 01H            ;0E48: SV    V0,V1         
		DB   40H, 56H            ;0E4A: GOZR  V0,E56        
		DB   05H, 48H            ;0E4C: GOCR  E48           
		DB   80H, 20H            ;0E4E: LVI   V0,20         
		DB   16H, 00H            ;0E50: OUTS  V0            
		DB   90H, 16H            ;0E52: LVD   V0,[16]       
		DB   50H, 46H            ;0E54: GONZ  V0,E46        
		DB   01H, 09H, 0CFH      ;0E56: DO    09CF          
		DB   05H, 17H            ;0E59: GOCR  E17           
		DB   04H, 1EH            ;0E5B: GO    E1E           
		DB   01H, 0EH, 62H       ;0E5D: DO    0E62          
		DB   04H, 2DH            ;0E60: GO    E2D           
		DB   29H, 0AEH           ;0E62: LVX   VA,[R7]       
		DB   0CEH, 01H           ;0E64: ARI   R7,01         
		DB   01H, 09H, 0CFH      ;0E66: DO    09CF          
		DB   05H, 74H            ;0E69: GOCR  E74           
		DB   0DAH, 22H, 72H      ;0E6B: GOEQ  VA,22,E72     
		DB   16H, 0AH            ;0E6E: OUTS  VA            
		DB   04H, 62H            ;0E70: GO    E62           
		DB   33H, 0AEH           ;0E72: SKSP  VA,[R7]       
		DB   02H                 ;0E74: RET                 
		DB   3BH, 00H, 1DH       ;0E75: FIX   R0,[1D]       
		DB   37H, 00H            ;0E78: SIGN  [00]          
		DB   06H, 82H            ;0E7A: GONC  E82           
		DB   84H, 2DH            ;0E7C: LVI   V4,2D         
		DB   16H, 04H            ;0E7E: OUTS  V4            
		DB   39H, 00H            ;0E80: CHGS  R0            
		DB   03H, 07H, 00H       ;0E82: GOTO  0700          
S0E85
		DB   5BH, 0DAH           ;0E85: GONZ  VB,EDA        
		DB   0BAH, 0A1H          ;0E87: STVD  [A1],VA       
		DB   0AEH, 0A2H          ;0E89: STRD  [A2],R7       
		DB   0FH                 ;0E8B: OUTSI               
		DB   '?'                 ;0E8C: BF
		DB   01H, 08H, 0B5H      ;0E8D: DO    08B5          
		DB   64H, 1CH, 45H       ;0E90: LRGI  R2,1C45       
		DB   33H, 04H            ;0E93: SKSP  V0,[R2]       
		DB   0B0H, 0A4H          ;0E95: STVD  [A4],V0       
		DB   0A4H, 0A5H          ;0E97: STRD  [A5],R2       
		DB   01H, 0BH, 0B8H      ;0E99: DO    0BB8          
		DB   06H, 0D7H           ;0E9C: GONC  ED7           
		DB   1AH, 0AH, 06H       ;0E9E: PUSHM R5,06         
		DB   9AH, 0A4H           ;0EA1: LVD   VA,[A4]       
		DB   7EH, 0A5H           ;0EA3: LRD   R7,[A5]       
		DB   0DAH, 2DH, 0CCH     ;0EA5: GOEQ  VA,2D,ECC     
		DB   01H, 07H, 63H       ;0EA8: DO    INTEG         
		DB   06H, 0DDH           ;0EAB: GONC  EDD           
		DB   0DAH, 0DH, 0B2H     ;0EAD: GOEQ  VA,0D,EB2     
		DB   33H, 0AEH           ;0EB0: SKSP  VA,[R7]       
		DB   0BAH, 0A4H          ;0EB2: STVD  [A4],VA       
		DB   0AEH, 0A5H          ;0EB4: STRD  [A5],R7       
		DB   1BH, 0AH, 06H       ;0EB6: POPM  R5,06         
		DB   70H, 1DH            ;0EB9: LRD   R0,[1D]       
		DB   2AH, 0CH            ;0EBB: STRX  [R6],R0       
		DB   0DAH, 2CH, 0C8H     ;0EBD: GOEQ  VA,2C,EC8     
		DB   01H, 09H, 0CFH      ;0EC0: DO    09CF          
		DB   06H, 0D7H           ;0EC3: GONC  ED7           
		DB   03H, 08H, 99H       ;0EC5: GOTO  0899          
		DB   33H, 0AEH           ;0EC8: SKSP  VA,[R7]       
		DB   04H, 99H            ;0ECA: GO    E99           
		DB   33H, 0AEH           ;0ECC: SKSP  VA,[R7]       
		DB   01H, 07H, 63H       ;0ECE: DO    INTEG         
		DB   06H, 0DDH           ;0ED1: GONC  EDD           
		DB   39H, 1DH            ;0ED3: CHGS  [1D]          
		DB   04H, 0ADH           ;0ED5: GO    EAD           
		DB   03H, 0AH, 6DH       ;0ED7: GOTO  0A6D          
		DB   03H, 08H, 2FH       ;0EDA: GOTO  082F          
		DB   0FH                 ;0EDD: OUTSI               
		DB   'ERR'               ;0EDE: 45
		                         ;0EDF: 52
		                         ;0EE0: D2
		DB   1BH, 0AH, 06H       ;0EE1: POPM  R5,06         
		DB   9AH, 0A1H           ;0EE4: LVD   VA,[A1]       
		DB   7EH, 0A2H           ;0EE6: LRD   R7,[A2]       
		DB   04H, 8BH            ;0EE8: GO    E8B           
		DB   80H                 ;0EEA: 80
		DB   'GOTO'              ;0EEB: 47
		                         ;0EEC: 4F
		                         ;0EED: 54
		                         ;0EEE: 4F
		DB   82H                 ;0EEF: 82
		DB   'GOSUB'             ;0EF0: 47
		                         ;0EF1: 4F
		                         ;0EF2: 53
		                         ;0EF3: 55
		                         ;0EF4: 42
		DB   84H                 ;0EF5: 84
		DB   'GOKEY'             ;0EF6: 47
		                         ;0EF7: 4F
		                         ;0EF8: 4B
		                         ;0EF9: 45
		                         ;0EFA: 59
		DB   86H                 ;0EFB: 86
		DB   'IF'                ;0EFC: 49
		                         ;0EFD: 46
		DB   88H                 ;0EFE: 88
		DB   'PRINT'             ;0EFF: 50
		                         ;0F00: 52
		                         ;0F01: 49
		                         ;0F02: 4E
		                         ;0F03: 54
		DB   8AH                 ;0F04: 8A
		DB   'RUN'               ;0F05: 52
		                         ;0F06: 55
		                         ;0F07: 4E
		DB   8CH                 ;0F08: 8C
		DB   'REM'               ;0F09: 52
		                         ;0F0A: 45
		                         ;0F0B: 4D
		DB   8EH                 ;0F0C: 8E
		DB   'RETURN'            ;0F0D: 52
		                         ;0F0E: 45
		                         ;0F0F: 54
		                         ;0F10: 55
		                         ;0F11: 52
		                         ;0F12: 4E
		DB   92H                 ;0F13: 92
		DB   'NEW'               ;0F14: 4E
		                         ;0F15: 45
		                         ;0F16: 57
		DB   96H                 ;0F17: 96
		DB   'INPUT'             ;0F18: 49
		                         ;0F19: 4E
		                         ;0F1A: 50
		                         ;0F1B: 55
		                         ;0F1C: 54
		DB   98H                 ;0F1D: 98
		DB   'SAVE'              ;0F1E: 53
		                         ;0F1F: 41
		                         ;0F20: 56
		                         ;0F21: 45
		DB   9AH                 ;0F22: 9A
		DB   'SHOW'              ;0F23: 53
		                         ;0F24: 48
		                         ;0F25: 4F
		                         ;0F26: 57
		DB   9EH                 ;0F27: 9E
		DB   'LIST'              ;0F28: 4C
		                         ;0F29: 49
		                         ;0F2A: 53
		                         ;0F2B: 54
		DB   0A0H                ;0F2C: A0
		DB   'LOAD'              ;0F2D: 4C
		                         ;0F2E: 4F
		                         ;0F2F: 41
		                         ;0F30: 44
		DB   0A4H                ;0F31: A4
		DB   'COLOR'             ;0F32: 43
		                         ;0F33: 4F
		                         ;0F34: 4C
		                         ;0F35: 4F
		                         ;0F36: 52
		DB   9CH                 ;0F37: 9C
		DB   'CLS'               ;0F38: 43
		                         ;0F39: 4C
		                         ;0F3A: 53
		DB   0A2H                ;0F3B: A2
		DB   'TVON'              ;0F3C: 54
		                         ;0F3D: 56
		                         ;0F3E: 4F
		                         ;0F3F: 4E
		DB   0A6H                ;0F40: A6
		DB   'TVOFF'             ;0F41: 54
		                         ;0F42: 56
		                         ;0F43: 4F
		                         ;0F44: 46
		                         ;0F45: 46
		DB   90H                 ;0F46: 90
		DB   'LET'               ;0F47: 4C
		                         ;0F48: 45
		                         ;0F49: 54
		DB   94H                 ;0F4A: 94
		DB   'END'               ;0F4B: 45
		                         ;0F4C: 4E
		                         ;0F4D: 44
		DB   88H                 ;0F4E: 88
		DB   '?'                 ;0F4F: 3F
		DB   00H                 ;0F50: 00
		DB   8AH                 ;0F51: 8A
		DB   'TI'                ;0F52: 54
		                         ;0F53: 49
		DB   98H                 ;0F54: 98
		DB   'RND'               ;0F55: 52
		                         ;0F56: 4E
		                         ;0F57: 44
		DB   8EH                 ;0F58: 8E
		DB   'KEY'               ;0F59: 4B
		                         ;0F5A: 45
		                         ;0F5B: 59
		DB   94H                 ;0F5C: 94
		DB   'HIT'               ;0F5D: 48
		                         ;0F5E: 49
		                         ;0F5F: 54
		DB   9CH                 ;0F60: 9C
		DB   'ABS'               ;0F61: 41
		                         ;0F62: 42
		                         ;0F63: 53
		DB   80H                 ;0F64: 80
		DB   'MEM'               ;0F65: 4D
		                         ;0F66: 45
		                         ;0F67: 4D
		DB   00H                 ;0F68: 00
S0F69
		LDA  R5                  ;0F69: 45          
		PLO  R7                  ;0F6A: A7          
		GHI  R3                  ;0F6B: 93          
		PHI  RB                  ;0F6C: BB          
		LDI  74H                 ;0F6D: F8 74       
		PLO  RB                  ;0F6F: AB          
		SEX  R7                  ;0F70: E7          
		SEP  RB                  ;0F71: DB          
S0F72
		SEP  R4                  ;0F72: D4          
R0F73
		SEP  R3                  ;0F73: D3          
S0F74
		IRX                      ;0F74: 60          
		GHI  R1                  ;0F75: 91          
		SM                       ;0F76: F7          
		STXD                     ;0F77: 73          
		GHI  R1                  ;0F78: 91          
		SMB                      ;0F79: 77          
		STXD                     ;0F7A: 73          
		IRX                      ;0F7B: 60          
		BR   R0F73               ;0F7C: 30 73       
S0F7E
		LDA  R5                  ;0F7E: 45          
		PLO  R6                  ;0F7F: A6          
		LDA  R5                  ;0F80: 45          
		PLO  R7                  ;0F81: A7          
		SEX  R6                  ;0F82: E6          
		GHI  R1                  ;0F83: 91          
		PHI  RF                  ;0F84: BF          
		PLO  RF                  ;0F85: AF          
		LDI  02H                 ;0F86: F8 02       
		PLO  RD                  ;0F88: AD          
		LDI  08H                 ;0F89: F8 08       
		PLO  RE                  ;0F8B: AE          
		LDA  R7                  ;0F8C: 47          
		PHI  RC                  ;0F8D: BC          
R0F8E
		GHI  RC                  ;0F8E: 9C          
		SHL                      ;0F8F: FE          
		PHI  RC                  ;0F90: BC          
		BNF  R0F9B               ;0F91: 3B 9B       
		IRX                      ;0F93: 60          
		GLO  RF                  ;0F94: 8F          
		ADD                      ;0F95: F4          
		PLO  RF                  ;0F96: AF          
		GHI  RF                  ;0F97: 9F          
		DEC  R6                  ;0F98: 26          
		ADC                      ;0F99: 74          
		PHI  RF                  ;0F9A: BF          
R0F9B
		DEC  RE                  ;0F9B: 2E          
		GLO  RE                  ;0F9C: 8E          
		BZ   R0FA7               ;0F9D: 32 A7       
R0F9F
		GLO  RF                  ;0F9F: 8F          
		SHL                      ;0FA0: FE          
		PLO  RF                  ;0FA1: AF          
		GHI  RF                  ;0FA2: 9F          
		SHLC                     ;0FA3: 7E          
		PHI  RF                  ;0FA4: BF          
		BR   R0F8E               ;0FA5: 30 8E       
R0FA7
		DEC  RD                  ;0FA7: 2D          
		GLO  RD                  ;0FA8: 8D          
		BNZ  R0FB1               ;0FA9: 3A B1       
		GHI  RF                  ;0FAB: 9F          
		STR  R6                  ;0FAC: 56          
		INC  R6                  ;0FAD: 16          
		GLO  RF                  ;0FAE: 8F          
		STR  R6                  ;0FAF: 56          
		SEP  R4                  ;0FB0: D4          
R0FB1
		LDI  08H                 ;0FB1: F8 08       
		PLO  RE                  ;0FB3: AE          
		LDA  R7                  ;0FB4: 47          
		PHI  RC                  ;0FB5: BC          
		BR   R0F9F               ;0FB6: 30 9F       
S0FB8
		LDA  R5                  ;0FB8: 45          
		PLO  R6                  ;0FB9: A6          
		LDA  R5                  ;0FBA: 45          
		PLO  R7                  ;0FBB: A7          
		GHI  R3                  ;0FBC: 93          
		PHI  RB                  ;0FBD: BB          
		LDI  74H                 ;0FBE: F8 74       
		PLO  RB                  ;0FC0: AB          
		GHI  R1                  ;0FC1: 91          
		PHI  RF                  ;0FC2: BF          
		PLO  RF                  ;0FC3: AF          
		PLO  RE                  ;0FC4: AE          
		LDA  R7                  ;0FC5: 47          
		BNZ  R0FCB               ;0FC6: 3A CB       
		LDN  R7                  ;0FC8: 07          
		BZ   R0FEE               ;0FC9: 32 EE       
R0FCB
		DEC  R7                  ;0FCB: 27          
		LDN  R7                  ;0FCC: 07          
		SHL                      ;0FCD: FE          
		BNF  R0FD6               ;0FCE: 3B D6       
		SEX  R7                  ;0FD0: E7          
		SEP  RB                  ;0FD1: DB          
		GLO  RE                  ;0FD2: 8E          
		XRI  01H                 ;0FD3: FB 01       
		PLO  RE                  ;0FD5: AE          
R0FD6
		LDN  R6                  ;0FD6: 06          
		SHL                      ;0FD7: FE          
		SEX  R6                  ;0FD8: E6          
		BNF  R0FE0               ;0FD9: 3B E0       
		SEP  RB                  ;0FDB: DB          
		GLO  RE                  ;0FDC: 8E          
		XRI  01H                 ;0FDD: FB 01       
		PLO  RE                  ;0FDF: AE          
R0FE0
		INC  R6                  ;0FE0: 16          
		INC  R7                  ;0FE1: 17          
		LDN  R7                  ;0FE2: 07          
		SD                       ;0FE3: F5          
		STXD                     ;0FE4: 73          
		DEC  R7                  ;0FE5: 27          
		LDN  R7                  ;0FE6: 07          
		SDB                      ;0FE7: 75          
		STR  R6                  ;0FE8: 56          
		BNF  R0FEE               ;0FE9: 3B EE       
		INC  RF                  ;0FEB: 1F          
		BR   R0FE0               ;0FEC: 30 E0       
R0FEE
		GHI  RF                  ;0FEE: 9F          
		STR  R6                  ;0FEF: 56          
		INC  R6                  ;0FF0: 16          
		GLO  RF                  ;0FF1: 8F          
		SEX  R6                  ;0FF2: E6          
		STXD                     ;0FF3: 73          
		GLO  RE                  ;0FF4: 8E          
		BZ   R0FF8               ;0FF5: 32 F8       
		SEP  RB                  ;0FF7: DB          
R0FF8
		SEP  R4                  ;0FF8: D4          
		DB   00H                 ;0FF9: 00
		DB   18H                 ;0FFA: 18
		DB   0CFH                ;0FFB: CF
		DB   50H                 ;0FFC: 50
		DB   0E0H                ;0FFD: E0
		DB   0C3H                ;0FFE: C3
		DB   26H                 ;0FFF: 26
		END
