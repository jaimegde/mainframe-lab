       IDENTIFICATION DIVISION.
       PROGRAM-ID. ACCSHOW.
      *================================================================
      * ACCSHOW - Read a raw line from the keyboard into a record.
      *================================================================
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-INPUT-RECORD.
          05 WS-ACCOUNT-IBAN  PIC X(24).
          05 WS-AMOUNT        PIC 9(11)V99.
       01 WS-AMOUNT-EDITED    PIC Z(10)9.99.
       01 WS-TODAY            PIC 9(8).

       PROCEDURE DIVISION.
       0000-MAIN.
           DISPLAY 'Enter IBAN(24) + AMOUNT(13), no spaces:'
           ACCEPT WS-INPUT-RECORD
           ACCEPT WS-TODAY FROM DATE YYYYMMDD
           MOVE WS-AMOUNT TO WS-AMOUNT-EDITED
           DISPLAY 'ACCOUNT : ' WS-ACCOUNT-IBAN
           DISPLAY 'AMOUNT  : ' WS-AMOUNT-EDITED
           DISPLAY 'DATE    : ' WS-TODAY
           GOBACK
           .
