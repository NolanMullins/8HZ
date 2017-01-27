*-----------------------------------------------------------
* Title      :
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------

DUART    EQU      $00C001  ;68681 base address
ACR      EQU      4*2      ;auxiliary control reg.
isr      EQU      $a
stop     EQU      $1e
CTUR     EQU      6*2      ;counter/timer upper reg.
CTLR     EQU      7*2      ;counter/timer lower reg.
OPCR     EQU      13*2     ;output port config. reg.
COUNT    EQU      14400     ;2 Hz count (see above)
OPR_SET  EQU      14*2        ;set bit command reg.
OPR_CLR  EQU      15*2        ;clear bit cmd. reg.

         ORG      $8000
TWOHZ    MOVEA.L  #DUART,A0
         MOVE.L   #COUNT,D0
         MOVEP.W  D0,CTUR(A0)
         MOVE.B   #$70,ACR(A0)   ;crystal clock / 16
         
         
         
LOOP     move.b   isr(a0),d3
         and.b    #8,d3
         beq      LOOP
         tst.b    stop(a0)
         
         MOVE.B   D1,OPR_CLR(A0) ;clr. bits, set pins
         NOT.B    D1
         MOVE.B   D1,OPR_SET(A0) ;set bits, clr. pins
         
         BRA      LOOP              ;now relax a bit
         END      TWOHZ

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
