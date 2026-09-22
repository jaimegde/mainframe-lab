       IDENTIFICATION DIVISION.
       PROGRAM-ID. MODSHOW.
      *================================================================
      * Integer division with remainder: DIVIDE ... REMAINDER and
      * FUNCTION MOD give the same result. Base of every check digit.
      *================================================================
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-NUMBER       PIC 9(9) VALUE 210004184.
       01 WS-QUOTIENT     PIC 9(9) VALUE ZEROS.
       01 WS-REMAINDER-A  PIC 9(2) VALUE ZEROS.
       01 WS-REMAINDER-B  PIC 9(2) VALUE ZEROS.

       PROCEDURE DIVISION.
       0000-MAIN.
           DIVIDE WS-NUMBER BY 97 GIVING WS-QUOTIENT
              REMAINDER WS-REMAINDER-A
           COMPUTE WS-REMAINDER-B = FUNCTION MOD(WS-NUMBER, 97)
           DISPLAY 'QUOTIENT   : [' WS-QUOTIENT ']'
           DISPLAY 'REMAINDER A: [' WS-REMAINDER-A ']'
           DISPLAY 'REMAINDER B: [' WS-REMAINDER-B ']'
           GOBACK
           .
