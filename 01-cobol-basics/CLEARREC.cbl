       IDENTIFICATION DIVISION.
       PROGRAM-ID. CLEARREC.
      *================================================================
      * Clears a 45-byte record before use and adds its amount to a
      * running total. INITIALIZE sets each field by its PICTURE
      * (X to spaces, 9 to zeros). MOVE SPACES to the group would
      * leave spaces in the numeric fields and abend on the ADD.
      *================================================================
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-RECORD.
          05 WS-IBAN          PIC X(24).
          05 WS-BOOKING-DATE  PIC 9(8).
          05 WS-AMOUNT        PIC 9(11)V99.
       01 WS-TOTAL            PIC 9(11)V99 VALUE ZEROS.

       PROCEDURE DIVISION.
       0000-MAIN.
           INITIALIZE WS-RECORD
           DISPLAY 'RECORD: [' WS-RECORD ']'
           ADD WS-AMOUNT TO WS-TOTAL
           DISPLAY 'TOTAL : [' WS-TOTAL ']'
           DISPLAY 'END OF PROGRAM'
           GOBACK
           .
