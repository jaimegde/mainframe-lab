       IDENTIFICATION DIVISION.
       PROGRAM-ID. VSHOW.
      *================================================================
      * Shows that V takes no space in the data and that the decimal
      * point only exists in edited fields.
      * MOVE aligns on the V and truncates silently: integer digits
      * are lost on the left, decimals on the right. No rounding.
      *================================================================
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-AMOUNT         PIC 9(11)V99.
       01 WS-AMOUNT-EDITED  PIC Z(10)9.99.
       01 WS-FEE            PIC 9(3)V9.

       PROCEDURE DIVISION.
       0000-MAIN.
           MOVE 50007.09 TO WS-AMOUNT
           DISPLAY '[' WS-AMOUNT ']'
           DISPLAY 'LENGTH: ' FUNCTION LENGTH(WS-AMOUNT)
           MOVE WS-AMOUNT TO WS-AMOUNT-EDITED
           DISPLAY '[' WS-AMOUNT-EDITED ']'
           DISPLAY 'LENGTH: ' FUNCTION LENGTH(WS-AMOUNT-EDITED)
           MOVE WS-AMOUNT TO WS-FEE
           DISPLAY '[' WS-FEE ']'
           STOP RUN.
