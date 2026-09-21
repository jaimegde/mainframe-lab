       IDENTIFICATION DIVISION.
       PROGRAM-ID. BADREC.
      *================================================================
      * A corrupt 45-byte record arrives as raw bytes. Shows which
      * operations fail on bad data and which ones let it through.
      *================================================================
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-RECORD.
          05 WS-IBAN          PIC X(24).
          05 WS-BOOKING-DATE  PIC 9(8).
          05 WS-AMOUNT        PIC 9(11)V99.
       01 WS-OUT-IBAN         PIC X(24).
       01 WS-TOTAL            PIC 9(11)V99 VALUE ZEROS.

       PROCEDURE DIVISION.
       0000-MAIN.
           MOVE 'ES12#### ???? 0000 ABCDE2026134500000012A4500'
              TO WS-RECORD
           MOVE WS-IBAN TO WS-OUT-IBAN
           DISPLAY 'IBAN : [' WS-OUT-IBAN ']'
           DISPLAY 'DATE : [' WS-BOOKING-DATE ']'
           ADD WS-AMOUNT TO WS-TOTAL
           DISPLAY 'TOTAL: [' WS-TOTAL ']'
           DISPLAY 'END OF PROGRAM'
           GOBACK
           .
