; =============================================================================
; SYSTEM CONSTANTS
; =============================================================================

; --- GAME STATES -------------------------------------------------------------

STANONE     EQU     -1                      ; PLACEHOLDER TO FORCE CHANGE
STAINTR     EQU     0                       ; INTRO/PRESS FIRE STATE
STAPLAY     EQU     1                       ; NORMAL GAME STATE
STAGOVR     EQU     2                       ; GAME OVER STATE

; --- AGENT TYPES -------------------------------------------------------------


BOMBTYPE     EQU     2


; --- BACKGROUND RELATED CONSTANTS --------------------------------------------

BCKSKYW     EQU     SCRWIDTH                ; SKY WIDTH
BCKSKYH     EQU     120                     ; SKY HEIGHT
BCKGRW      EQU     SCRWIDTH                ; GROUND WIDTH
BCKGRH      EQU     SCRHEIGH-120            ; GROUND HEIGHT
BCKSKYCL    EQU     $00FF6150               ; SKY COLOR
BCKGRCL     EQU     $000E6800               ; GROUND COLOR

; --- PLAYER RELATED CONSTANTS ------------------------------------------------

PLRWIDTH    EQU     55                      ; PLAYER WIDTH (PIXELS)
PLRHEIGH    EQU     20                      ; PLAYER HEIGHT (PIXELS)
PLRINIEN    EQU     500                     ; PLAYER INITIAL ENERGY (<SCRWIDTH)
PLRSPEED    EQU     13                      ; PLAYER SPEED (PIXELS PER INT)
PLRNRMCL    EQU     $00696969               ; PLAYER NORMAL COLOR
PLRWTRCL    EQU     $00FF8000               ; PLAYER WATER COLOR
PLRDMGCL    EQU     $000000FF               ; PLAYER DAMAGED COLOR
PLRTXTCL    EQU     $00FFFFFF               ; FONT COLOR
PLRTXTX     EQU     2                       ; SCORE X COORDINATE
PLRTXTY     EQU     1                       ; SCORE Y COORDINATE
PLRLIFEH    EQU     20                      ; HEIGHT OF LIFE BAR
PLRLIFEY    EQU     SCRHEIGH-PLRLIFEH*2     ; LIFE BAR Y POS
PLRLIFEC    EQU     $000000FF               ; LIFE BAR COLOR
PLRUMDMG    EQU     %00000001               ; UPDATE DAMAGE MASK
PLRPMDMG    EQU     %00000010               ; PLOT DAMAGE MASK
PLRUBDMG    EQU     0                       ; UPDATE DAMAGE BIT
PLRPBDMG    EQU     1                       ; PLOT DAMAGE BIT

PLRCLIFE    EQU     3                       ; PLAYER CONSTANT LIFE 

; --- BOMB RELATED CONSTANTS ----------------------------------------------

BOMBSIZE    EQU     30                      ; ASTEROID DIAMETER
BOMBPENCL   EQU     $00000000               ; ASTEROID PEN COLOR
BOMBFILCL   EQU     $00000000               ; ASTEROID FIL COLOR
WICKPENCL   EQU     $00727272               ; WICK PEN COLOR
WICKFILCL   EQU     $00727272               ; WICK FIL COLOR
FIREPENCL   EQU     $005A70BD               ; FIRE PEN COLOR
FIREFILCL   EQU     $005A70BD               ; FIRE FIL COLOR
BOMBDMG     EQU     1                       ; ASTEROID DAMAGE TO PLAYER
BOMBFRAG    EQU     5                       ; NUMBER OF FRAGMENTS IN EXPLOSION
BOMBSCORE   EQU     5                       ; SCORE ASTEROID DESTRUCTION

; --- INTRO STATE RELATED CONSTANTS -------------------------------------------

INTTITX     EQU     31                      ; TITLE X COORDINATE
INTTITY     EQU     5                       ; TITLE Y COORDINATE
INTTITC     EQU     $000000FF               ; TITLE COLOR
INTPRSX     EQU     31                      ; PRESS FIRE X COORDINATE
INTPRSY     EQU     26                      ; PRESS FIRE Y COORDINATE
INTPRSC     EQU     $00FFFFFF               ; PRESS FIRE COLOR

; --- PAUSED STATE RELATED CONSTANTS -------------------------------------------

PAUSTITX     EQU     25                     ; TITLE X COORDINATE
PAUSTITY     EQU     15                     ; TITLE Y COORDINATE


; --- GAME OVER STATE RELATED CONSTANTS ---------------------------------------

GOVSTRX     EQU     35                      ; TITLE X COORDINATE
GOVSTRY     EQU     15                      ; TITLE Y COORDINATE
GOVSTRC     EQU     $00FFFFFF               ; TITLE COLOR

; --- BOMBMAN RELATED CONSTANTS ------------------------------------------------

BMNWIDTH    EQU     50                      ; BOMBMAN WIDTH  (PIXELS)
BMNHEIGH    EQU     80                      ; BOMBMAN HEIGHT (PIXELS)
BMNHANDW    EQU     10                      ; BOMBMAN HAND WIDTH
BMNHANDH    EQU     5                       ; BOMBMAN HAND HEIGHT
BMNBODYW    EQU     50                      ; BOMBMAN BODY WIDTH
BMNBODYH    EQU     50                      ; BOMBMAN BODY HEIGHT
BMNARMW     EQU     1                       ; BOMBMAN ARM WIDTH
BMNARMH     EQU     40                      ; BOMBMAN ARM HEIGHT
BMNBDYNCKW  EQU     30                      ; BOMBMAN SHIRT NECK WIDTH
BMNBDYNCKH  EQU     2                       ; BOMBMAN SHIRT NECK HEIGHT
BMNNECKW    EQU     10                      ; BOMBMAN NECK WIDTH
BMNNECKH    EQU     2                       ; BOMBMAN NECK HEIGHT
BMNHEADW    EQU     20                      ; BOMBMAN HEAD WIDTH
BMNHEADH    EQU     20                      ; BOMBMAN HEAD HEIGHT
BMNMASKW    EQU     24                      ; BOMBMAN MASK WIDTH
BMNMASKH    EQU     5                       ; BOMBMAN MASK HEIGHT
BMNEYEW     EQU     5                       ; BOMBMAN EYE WIDTH
BMNEYEH     EQU     5                       ; BOMBMAN EYE HEIGHT
BMNPUPILW   EQU     1                       ; BOMBMAN PUPIL WIDTH
BMNPUPILH   EQU     1                       ; BOMBMAN PUPIL HEIGHT
BMNLINEW    EQU     50                      ; BOMBMAN BLACK LINES WIDTH
BMNLINEH    EQU     5                       ; BOMBMAN BLACK LINES HEIGHT
BMNNRMCL    EQU     $00FFFFFF               ; BOMBMAN NORMAL COLOR
BMNSKINCL   EQU     $00DCDCFF               ; BOMNMAN SKIN COLOR
BMNLINECL   EQU     $00000000               ; BOMBMAN LINES COLOR



















*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
