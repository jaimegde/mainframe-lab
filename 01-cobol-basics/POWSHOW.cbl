       IDENTIFICATION DIVISION.
       PROGRAM-ID. POWSHOW.
      *================================================================
      * Compound growth factor with ** (exponentiation). The same
      * factor is kept with 4 and with 10 decimals to show what the
      * lost decimals cost on a large principal.
      *================================================================
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-PRINCIPAL  PIC 9(9)V99    VALUE 1000000.00.
       01 WS-FACTOR     PIC 9V9(4)     VALUE 1.0325.
       01 WS-YEARS      PIC 9(2)       VALUE 10.
       01 WS-GROWTH-A   PIC 9(3)V9(4)  VALUE ZEROS.
       01 WS-GROWTH-B   PIC 9(3)V9(10) VALUE ZEROS.
       01 WS-FINAL-A    PIC 9(9)V99    VALUE ZEROS.
       01 WS-FINAL-B    PIC 9(9)V99    VALUE ZEROS.

       PROCEDURE DIVISION.
       0000-MAIN.
           COMPUTE WS-GROWTH-A = WS-FACTOR ** WS-YEARS
           COMPUTE WS-GROWTH-B = WS-FACTOR ** WS-YEARS
           COMPUTE WS-FINAL-A ROUNDED = WS-PRINCIPAL * WS-GROWTH-A
           COMPUTE WS-FINAL-B ROUNDED = WS-PRINCIPAL * WS-GROWTH-B
           DISPLAY 'GROWTH A: [' WS-GROWTH-A ']'
           DISPLAY 'GROWTH B: [' WS-GROWTH-B ']'
           DISPLAY 'FINAL  A: [' WS-FINAL-A ']'
           DISPLAY 'FINAL  B: [' WS-FINAL-B ']'
           GOBACK
           .
