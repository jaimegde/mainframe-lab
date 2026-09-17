       IDENTIFICATION DIVISION.
       PROGRAM-ID. BADNUM.
      *================================================================
      * BADNUM - What happens when a numeric field holds a letter.
      *================================================================
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-AMOUNT      PIC 9(11)V99.
       01 WS-AMOUNT-RAW REDEFINES WS-AMOUNT
                         PIC X(13).
       01 WS-TOTAL       PIC S9(13)V99 COMP-3
                                       VALUE 0.

       PROCEDURE DIVISION.
       0000-MAIN.
           MOVE 'D000000008743' TO WS-AMOUNT-RAW
           DISPLAY 'AMOUNT BYTES: ' WS-AMOUNT-RAW
           ADD WS-AMOUNT TO WS-TOTAL
           DISPLAY 'TOTAL       : ' WS-TOTAL
           GOBACK
           .
