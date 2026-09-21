       IDENTIFICATION DIVISION.
       PROGRAM-ID. COMPINT.
      *================================================================
      * Compound interest on a deposit, annual compounding:
      * final = principal * (1 + annual rate / 100) ** years.
      *================================================================
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-PRINCIPAL      PIC 9(9)V99    VALUE 15000.00.
       01 WS-ANNUAL-RATE    PIC 9(2)V9(4)  VALUE 3.2500.
       01 WS-YEARS          PIC 9(2)       VALUE 5.
       01 WS-FACTOR         PIC 9V9(6)     VALUE ZEROS.
       01 WS-GROWTH         PIC 9(3)V9(10) VALUE ZEROS.
       01 WS-FINAL          PIC 9(9)V99    VALUE ZEROS.
       01 WS-INTEREST       PIC 9(9)V99    VALUE ZEROS.
       01 WS-AMOUNT-EDITED  PIC Z(8)9.99.
       
       PROCEDURE DIVISION.
       0000-MAIN.
           COMPUTE WS-FACTOR = WS-ANNUAL-RATE / 100
           COMPUTE WS-FACTOR = WS-FACTOR + 1
           COMPUTE WS-GROWTH = WS-FACTOR ** WS-YEARS
           COMPUTE WS-FINAL ROUNDED = WS-PRINCIPAL * WS-GROWTH
           ON SIZE ERROR
              DISPLAY 'SIZE ERROR: FINAL BALANCE DOES NOT FIT'
           NOT ON SIZE ERROR
               COMPUTE WS-INTEREST = WS-FINAL - WS-PRINCIPAL
               MOVE WS-FINAL TO WS-AMOUNT-EDITED
               DISPLAY 'FINAL   : [' WS-AMOUNT-EDITED ']'
               MOVE WS-INTEREST TO WS-AMOUNT-EDITED
               DISPLAY 'INTEREST: [' WS-AMOUNT-EDITED ']'
           END-COMPUTE
           DISPLAY 'END OF PROGRAM'
           GOBACK
           .
