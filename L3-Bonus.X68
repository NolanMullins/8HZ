*-----------------------------------------------------------
* Title      :
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
        ORG     $1000
START:  MOVE.W  W,D0            ;327=MULS, DIVS=299, ADD=267
        MOVE.B  W+2,D1
        EXT.W   D1
        MULS    D1,D0
        MOVE.W  W+4,D1
        MOVE.B  #3,D2
        EXT.L   D2
        DIVS    D2,D1
        SWAP    D1
        MOVE.W  #0,D1
        SWAP    D1
        ADD.L   D1,D0
        MOVE.L  D0,W+6
        TRAP    #14
        
        
        ORG     $9000
W       DC.W    $4
        DC.B    -3
        DC.W    $9
        DS.L    1
*

    SIMHALT             ; halt simulator

* Put variables and constants here

    END    START        ; last line of source

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
