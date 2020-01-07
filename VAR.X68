; =============================================================================
; GAME VARS
; =============================================================================
; --- GAME STATE RELATED VARIABLES --------------------------------------------

STATES      DC.L    STAINIT                 ;INITIALIZE STATE 0
            DC.L    STAMENU                 ;MENU STATE       1
            DC.L    STAGAME                 ;GAME STATE       2
            DC.L    STAUPD                  ;UPDATE STATE     3
            DC.L    STAPAUS                 ;PAUSED STATE     4 
            DC.L    STAGOVRU                ;GAME OVER STATE  5
            
STATESP     DC.L    STAINTRP                ;INIT PLOT        0
            DC.L    STAUPDP                 ;UPDATE PLOT      1
            DC.L    STAPAUSP                ;PAUSE PLOT       2
            DC.L    STAGOVRP                ;GAME OVER PLOT   3
            
STATE       DS.L    1                       ;CURRENT STATE
STATEP      DS.L    1                       ;CURRENT STATE PLOT

GAMEOVERB   DS.W    1                      ;GAME OVER BIT 1-NOT SOUND 0-SOUND

; --- PLAYER RELATED VARIABLES ------------------------------------------------

PLRPOSX     DS.W    1                       ; PLAYER X POSITION (PIXELS)
PLRPOSY     DS.W    1                       ; PLAYER Y POSITION (PIXELS)
PLRENER     DS.W    1                       ; PLAYER ENERGY
PLRSCORE    DS.W    1                       ; PLAYER SCORE
PLRLIFE     DS.W    1                       ; PLAYER IN GAME LIFE

PLRDMG      DS.B    1                       ; BIT0: UPD DAMAGE, BIT1 PLOT DMG
            DS.W    0

; --- BOMBMAN RELATED VARIABLES ------------------------------------------------

BMNPOSX     DS.W    1                       ; BOMBMAN X POSITION  (PIXELS) 
BMNPOSY     DS.W    1                       ; BOMBMAN Y POSITION  (PIXELS)
BMNDIR      DS.W    1                       ; BOMBMAN DIRECTION 
                                            ; RIGHT > #128  LEFT < #128 
BMNSPEED    DC.W    9                       ; BOMBMAN SPEED (PIXELS PER INT)
BMNSPEEDB   DS.W    1                       ;SPEED BYTE 1-ABLE SPEED ADD


; --- UTILITY VARIABLES ------------------------------------------------------

UTLRNDIX    DS.B    1                       ; NEXT INDEX TO RANDOM NUMBER
            DS.W    0






















*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
