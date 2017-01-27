*-----------------------------------------------------------
* Title      :
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
        ORG     $8000
START:  CLR.L   D0 
LOOPS   CMPI    #2,D0
        BGT     EXIT
        
        MOVE.B  D0,D1
        ADDQ    #1,D1
LOOP2   CMPI    #3,D1
        BGT     LOOPE
        
        MOVE.L  D0,D4       ;[i][]
        MULU    #4,D4
        ADD.L   #ARRAY,D4
        MOVEA.L D4,A0
        
        MOVE.L  D1,D5       ;[j][]
        MULU    #4,D5
        ADD.L   #ARRAY,D5
        MOVEA.L D5,A1
        
        MOVE.B  (A0,D1),D6  ;SWAP HERE
        MOVE.B  (A1,D0),D7
                            ;MOVE.B  (A1,D0),(A0,D1)
                            ;MOVE.B   D3,(A0,D1)
        MOVE.B  D6,(A1,D0)
        MOVE.B  D7,(A0,D1)
                            
        ADDQ    #1,D1
        BRA     LOOP2
LOOPE   ADDQ    #1,D0
        BRA     LOOPS
    
EXIT    TRAP    #14
    
        ORG     $9000
ARRAY   DC.B    1,2,3,4
        DC.B    5,6,7,8
        DC.B    9,10,11,12
        DC.B    13,14,15,16
        
        END     START        ; last line of source
*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
