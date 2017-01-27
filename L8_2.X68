*-----------------------------------------------------------
* Title      :
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
        ORG     $8000
START:  MOVE.W  X,-(SP)
        MOVE.W  Y,-(SP)
        MOVE.W  Z,-(SP)

        JSR     calc
        TRAP    #14
        
calc    MOVEM.L D2-D4,-(SP)
        
        MOVE.W  20(SP),D2       ;X
        MOVE.W  18(SP),D3       ;Y
        MOVE.W  16(SP),D4       ;Z

        MULU    D2,D3
        MULU    D2,D2
        MULU    D4,D4
        MULU    #5,D2
        MULU    #2,D3
        
        MOVE.W  D2,D1
        SUB.W   D3,D1
        ADD.W   D4,D1
        
        MOVEM.L (SP)+,D2-D4
        
        rts
        
        ORG     $7000
X       DC.W    1
Y       DC.W    2
Z       DC.W    3
        
        END    START


*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
