       IDENTIFICATION DIVISION.
       PROGRAM-ID. SIZESHOW.
      *================================================================
      * The exact result of a COMPUTE does not fit in the integer
      * part of the result field.
      *================================================================
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-BALANCE   PIC 9(7)V99 VALUE 250000.00.
       01 WS-RATE      PIC 9V9(4)  VALUE 0.0125.
       01 WS-INTEREST  PIC 9(3)V99 VALUE ZEROS.

       PROCEDURE DIVISION.
       0000-MAIN.
           COMPUTE WS-INTEREST ROUNDED = WS-BALANCE * WS-RATE
           ON SIZE ERROR
              DISPLAY 'SIZE ERROR: INTEREST DOES NOT FIT'
           NOT ON SIZE ERROR
               DISPLAY 'INTEREST: [' WS-INTEREST ']'
           END-COMPUTE
           DISPLAY 'FIELD AFTER: [' WS-INTEREST ']'
           DISPLAY 'END OF PROGRAM'
           GOBACK
           .
