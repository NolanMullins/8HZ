*-----------------------------------------------------------
* Title      :
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
        ORG     $7000
START:  MOVE.W  #10,D0
        
        JSR     calc
        TRAP    #14
        
calc    MOVE.W  D0,D1
        MULU    D1,D1
        MULU    #5,D1
        MOVE.W  D0,D2
        MULU    #2,D2
        SUB.W   D2,D1
        ADDQ.W  #6,D1

        rts

        END    START        ; last line of source

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
