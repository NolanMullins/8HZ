*-----------------------------------------------------------
* Title      :
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
        ORG     $1000
START:  MOVE.W  #1234,-(SP)
        MOVE.W  (SP),D0
        JSR     calc
        trap    #14
        
calc    LINK    A6,#-4
        CLR.L   D0
        MOVE.W  8(A6),D0
        CMP.W   #0,D0
        BEQ     EXIT
        
        DIVS    #10,D0
        MOVE.W  D0,-4(A6)   ;quotient
        MOVE.W  D0,-(SP)
        SWAP    D0          
        MOVE.W  D0,-2(A6)   ;remainder
        
        jsr     calc
        
        MOVE.L  #6,D0
        MOVE.W  -2(A6),D1
        ADD.W   #48,D1
        TRAP    #15
        
EXIT    UNLK    A6
        RTS        

        END     START        ; last line of source

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
