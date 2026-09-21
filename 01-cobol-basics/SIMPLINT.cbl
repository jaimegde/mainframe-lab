       IDENTIFICATION DIVISION.
       PROGRAM-ID. SIMPLINT.
      *================================================================ 
      * Simple interest on a deposit, Act/360 day count:
      * interest = principal * annual rate (%) * days / 36000.
      *================================================================ 
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-PRINCIPAL        PIC 9(7)V99    VALUE 15000.00.
       01 WS-ANNUAL-RATE      PIC 9(2)V9(4)  VALUE 3.2500.
       01 WS-DAYS             PIC 9(3)       VALUE 91.
       01 WS-PRODUCT          PIC 9(12)V9(6) VALUE ZEROS.
       01 WS-INTEREST         PIC 9(7)V99    VALUE ZEROS.
       01 WS-INTEREST-EDITED  PIC Z(6)9.99.

       PROCEDURE DIVISION.
       0000-MAIN.
           COMPUTE WS-PRODUCT = WS-PRINCIPAL * WS-ANNUAL-RATE
           COMPUTE WS-PRODUCT = WS-PRODUCT * WS-DAYS
           COMPUTE WS-INTEREST ROUNDED = WS-PRODUCT / 36000
           ON SIZE ERROR
              DISPLAY 'SIZE ERROR: INTEREST DOES NOT FIT'
           NOT ON SIZE ERROR
               MOVE WS-INTEREST TO WS-INTEREST-EDITED
               DISPLAY 'INTEREST: [' WS-INTEREST-EDITED ']'
           END-COMPUTE
           DISPLAY 'END OF PROGRAM'
           GOBACK
           .
