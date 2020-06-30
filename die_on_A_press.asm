.org 0x861C0 ;Start at this point
ADDIU SP, SP, 0xFFE8 ;TAKE 24 off stack to Start Subroutine
SW RA, 0x14(SP) ;STORE WORD (return address RA) to Stack + 20 bytes

LUI T1, 0x8034 ;T1 = 80340000
LH T0, 0xAFA0(T1) ;Current Button - RAM Address holds button Value
ANDI T2, T0, 0x8000 ;Button A

BNE R0, T2, ButtonCheck ;A Button Pressed?
NOP
BEQ R0, T2, Exit ;A Button not Pressed
NOP

ButtonCheck:
LB T4, 0xB21E(T1) ;Mario's Health Meter set to T4 at 0x8034B21E
SUBIU T4, T4, #8 ;SUB 8 to Reg T6 (Mario's Health - 8)
SB T4, 0xB21E(T1) ;LOAD HEALTH

Exit: ;Label for branching
LW RA, 0x14(SP) ;Load Return address RA back to Stack
JR RA
ADDIU SP, SP, 0x18 ;ADD 24 back to Stack and end Subroutine
