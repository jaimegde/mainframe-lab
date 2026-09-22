       IDENTIFICATION DIVISION.
       PROGRAM-ID. IBANCHK.
      *================================================================
      * Validates a Spanish IBAN with the ISO 7064 mod 97 check.
      * The rearranged number has 26 digits, too big for one numeric
      * field, so the remainder is carried from one chunk to the next.
      *================================================================
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-IBAN.
          05 WS-IBAN-COUNTRY    PIC X(2)  VALUE 'ES'.
          05 WS-IBAN-CHECK      PIC X(2)  VALUE '91'.
          05 WS-IBAN-BBAN       PIC X(20)
                                          VALUE '21000418450200051332'.

      * Rearranged: BBAN + country as digits (E=14, S=28) + check
       01 WS-REARRANGED.
          05 WS-RA-BBAN         PIC X(20).
          05 WS-RA-COUNTRY      PIC X(4)  VALUE '1428'.
          05 WS-RA-CHECK        PIC X(2).
       01 WS-CHUNKS REDEFINES WS-REARRANGED.
          05 WS-CHUNK-1         PIC 9(9).
          05 WS-CHUNK-2         PIC 9(7).
          05 WS-CHUNK-3         PIC 9(7).
          05 WS-CHUNK-4         PIC 9(3).

      * Previous remainder glued in front of the next chunk
       01 WS-STEP.
          05 WS-STEP-REMAINDER  PIC 9(2).
          05 WS-STEP-DIGITS     PIC 9(7).
       01 WS-STEP-NUMBER REDEFINES WS-STEP
                                PIC 9(9).
       01 WS-LAST-STEP.
          05 WS-LAST-REMAINDER  PIC 9(2).
          05 WS-LAST-DIGITS     PIC 9(3).
       01 WS-LAST-NUMBER REDEFINES WS-LAST-STEP
                                PIC 9(5).

       01 WS-REMAINDER          PIC 9(2)  VALUE ZEROS.

       PROCEDURE DIVISION.
       0000-MAIN.
           MOVE WS-IBAN-BBAN TO WS-RA-BBAN
           MOVE WS-IBAN-CHECK TO WS-RA-CHECK
           DISPLAY 'REARRANGED: [' WS-REARRANGED ']'
           COMPUTE WS-REMAINDER = FUNCTION MOD(WS-CHUNK-1, 97)
           DISPLAY 'STEP 1: [' WS-REMAINDER ']'
           MOVE WS-REMAINDER TO WS-STEP-REMAINDER
           MOVE WS-CHUNK-2 TO WS-STEP-DIGITS
           COMPUTE WS-REMAINDER = FUNCTION MOD(WS-STEP-NUMBER, 97)
           DISPLAY 'STEP 2: [' WS-REMAINDER ']'
           MOVE WS-REMAINDER TO WS-STEP-REMAINDER
           MOVE WS-CHUNK-3 TO WS-STEP-DIGITS
           COMPUTE WS-REMAINDER = FUNCTION MOD(WS-STEP-NUMBER, 97)
           DISPLAY 'STEP 3: [' WS-REMAINDER ']'
           MOVE WS-REMAINDER TO WS-LAST-REMAINDER
           MOVE WS-CHUNK-4 TO WS-LAST-DIGITS
           COMPUTE WS-REMAINDER = FUNCTION MOD(WS-LAST-NUMBER, 97)
           DISPLAY 'STEP 4: [' WS-REMAINDER ']'
           IF WS-REMAINDER = 1
              DISPLAY 'IBAN ' WS-IBAN ' IS VALID'
           ELSE
              DISPLAY 'IBAN ' WS-IBAN ' IS NOT VALID'
           END-IF
           GOBACK
           .
