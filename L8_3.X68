*-----------------------------------------------------------
* Title      :
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
        ORG     $8000
START:  PEA     W
        PEA     X
        PEA     Y
        PEA     Z

        JSR     calc
        TRAP    #14
        
calc    MOVEM.L D0-D2/A0-A3,-(SP)
        
        MOVEA.L 48(SP),A0       ;W
        MOVEA.L 44(SP),A1       ;X
        MOVEA.L 40(SP),A2       ;Y
        MOVEA.L 36(SP),A3       ;Z

        MOVE.W  #5,D0
        MULS    (A1),D0
        MULS    (A1),D0
        
        MOVE.W  #-4,D1
        MULS    (A2),D1
        MULS    (A2),D1
        
        MOVE.W  (A3),D2
        MULS    D2,D2
        
        SUB.W   D1,D0
        ADD.W   D2,D0   

        ;Set w //TODO

        MOVEM.L (SP)+,D0-D2/A0-A3
        rts
        
        ORG     $7000
W       DS.W    1
X       DC.W    2
Y       DC.W    3
Z       DC.W    4
        
        END    START





*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
