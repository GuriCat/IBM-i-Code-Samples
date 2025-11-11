     H DFTACTGRP(*NO)
      *
     FDADD      CF   E             WORKSTN
      *
     D blue            C                   X'3B'
     D white           C                   X'23'
     D pink            C                   X'39'
      *
       LBOXATR = blue;
       RBOXATR = white;
      *
       DOW (1 = 1);
         IF *IN03;
           LEAVE;
         ENDIF;
         CTR += 1;
         EXFMT RCDR;
         ROW1 = GROW1;
         COL1 = GCOL1;
         ROW2 = GROW2;
         COL2 = GCOL2;
         // Check the source drag range and the destination drag range,
         // then change the color of the destination box.
         IF 10 <= ROW2 AND ROW2 <= 15 AND
            10 <= COL2 AND COL2 <= 20 AND
            10 <= ROW1 AND ROW1 <= 15 AND
            30 <= COL1 AND COL1 <= 40;
           MSG = '  GOTCHA!  ';
           IF RBOXATR = white;
             RBOXATR = pink;
           ELSE;
             RBOXATR = white;
           ENDIF;
         ELSE;
           MSG = '   OOPS!   ';
         ENDIF;
         SROW = GROW1;
         SCOL = GCOL1;
       ENDDO;

       *INLR = *ON;
