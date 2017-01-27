*-----------------------------------------------------------
* Title      :
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
    ORG    $8000
START:                  

INCHR   MOVEA.L #DUART,A0  
        MOVEA.L #SCAN,A1 
INCHR2  MOVE.B  SRA(A0),D7
           
        ANDI.B  #1,D7
        BEQ     INCHR2
        MOVE.B  RBA(A0),D0
        
        CMP.B   #CR,D0
        BEQ     EXIT  
        
        JSR     OUT681
        
        BRA     INCHR2
EXIT    TRAP #14

OUT681   MOVE.B   D0,OPR_CLR(A0)
         NOT.B    D0
         MOVE.B   D0,OPR_SET(A0)
         NOT.B    D0             
         RTS
        
        ORG    $9000
DUART   EQU $C001
SRA     EQU 2
RBA     EQU 6
OPR_SET  EQU      14*2      
OPR_CLR  EQU      15*2
CR      EQU $0D
LF      EQU $0A
SCAN    DS.B 20
        END    START        


*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
