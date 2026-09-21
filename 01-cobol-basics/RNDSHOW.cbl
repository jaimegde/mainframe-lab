       IDENTIFICATION DIVISION.
       PROGRAM-ID. RNDSHOW.
      *================================================================
      * Same COMPUTE with and without ROUNDED: what happens to the
      * decimals that do not fit in the result field.
      *================================================================
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-BALANCE     PIC 9(7)V99 VALUE 1000.60.
       01 WS-RATE        PIC 9V9(4)  VALUE 0.0125.
       01 WS-INTEREST-A  PIC 9(7)V99.
       01 WS-INTEREST-B  PIC 9(7)V99.

       PROCEDURE DIVISION.
       0000-MAIN.
           COMPUTE WS-INTEREST-A = WS-BALANCE * WS-RATE
           COMPUTE WS-INTEREST-B ROUNDED = WS-BALANCE * WS-RATE
           DISPLAY 'A: [' WS-INTEREST-A ']'
           DISPLAY 'B: [' WS-INTEREST-B ']'
           GOBACK
           .
