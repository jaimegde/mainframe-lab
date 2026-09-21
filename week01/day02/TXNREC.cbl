       IDENTIFICATION DIVISION.
       PROGRAM-ID. TXNREC.
      *================================================================
      * TXNREC - Build a transaction record and display it.
      *================================================================
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  WS-TXN-RECORD.
           05  WS-TXN-ID                  PIC X(12).
           05  WS-TXN-ACCOUNT-IBAN        PIC X(24).
           05  WS-TXN-BOOKING-DATE        PIC 9(8).
           05  WS-TXN-VALUE-DATE          PIC 9(8).
           05  WS-TXN-BOOKING-TIME        PIC 9(6).
           05  WS-TXN-TYPE                PIC X(4).
           05  WS-TXN-DC-INDICATOR        PIC X.
           05  WS-TXN-AMOUNT              PIC 9(11)V99.
           05  WS-TXN-CURRENCY            PIC X(3).
           05  WS-TXN-COUNTERPARTY-IBAN   PIC X(24).
           05  WS-TXN-DESCRIPTION         PIC X(40).
           05  FILLER                     PIC X(7).
       01  WS-AMOUNT-EDITED               PIC Z(10)9.99.

       PROCEDURE DIVISION.
       0000-MAIN.
           PERFORM 1000-INITIALIZE
           PERFORM 2000-PROCESS
           PERFORM 3000-FINALIZE
           GOBACK
           .
       1000-INITIALIZE.
           INITIALIZE WS-TXN-RECORD
           .
       2000-PROCESS.
           MOVE 'TXN000000001'          TO WS-TXN-ID
           MOVE 'ES9121000418450200051332'
                                        TO WS-TXN-ACCOUNT-IBAN
           MOVE 20260917                TO WS-TXN-BOOKING-DATE
           MOVE WS-TXN-BOOKING-DATE     TO WS-TXN-VALUE-DATE
           MOVE 114532                  TO WS-TXN-BOOKING-TIME
           MOVE 'CARD'                  TO WS-TXN-TYPE
           MOVE 'D'                     TO WS-TXN-DC-INDICATOR
           MOVE 87.43                   TO WS-TXN-AMOUNT
           MOVE 'EUR'                   TO WS-TXN-CURRENCY
           MOVE SPACES                  TO WS-TXN-COUNTERPARTY-IBAN
           MOVE 'CARD PURCHASE SUPERMARKET'
                                        TO WS-TXN-DESCRIPTION
           .
       3000-FINALIZE.
           DISPLAY '[' WS-TXN-RECORD ']'
           DISPLAY 'LENGTH           : ' FUNCTION LENGTH(WS-TXN-RECORD)
           DISPLAY 'TXN-ID           : ' WS-TXN-ID
           DISPLAY 'ACCOUNT-IBAN     : ' WS-TXN-ACCOUNT-IBAN
           DISPLAY 'BOOKING-DATE     : ' WS-TXN-BOOKING-DATE
           DISPLAY 'VALUE-DATE       : ' WS-TXN-VALUE-DATE
           DISPLAY 'BOOKING-TIME     : ' WS-TXN-BOOKING-TIME
           DISPLAY 'TXN-TYPE         : ' WS-TXN-TYPE
           DISPLAY 'DC-INDICATOR     : ' WS-TXN-DC-INDICATOR
           MOVE WS-TXN-AMOUNT           TO WS-AMOUNT-EDITED
           DISPLAY 'AMOUNT           : ' WS-AMOUNT-EDITED
           DISPLAY 'CURRENCY         : ' WS-TXN-CURRENCY
           DISPLAY 'COUNTERPARTY-IBAN: ' WS-TXN-COUNTERPARTY-IBAN
           DISPLAY 'DESCRIPTION      : ' WS-TXN-DESCRIPTION
           .
