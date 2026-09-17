       IDENTIFICATION DIVISION.
       PROGRAM-ID. PICSHOW.
      *================================================================
      * PICSHOW - Show how each PICTURE stores and displays data.
      *================================================================
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-BALANCE           PIC 9(5)V99    VALUE 1250.40.
       01 WS-BALANCE-SMALL     PIC 9(3)V99.    
       01 WS-BALANCE-SIGNED    PIC S9(5)V99   VALUE -1250.40.
       01 WS-BALANCE-UNSIGNED  PIC 9(5)V99.
       01 WS-IBAN              PIC X(24)
                                              VALUE
             'ES9121000418450200051332'.
       01 WS-IBAN-SHORT        PIC X(10).
       01 WS-TXN-TYPE          PIC X(4)       VALUE 'TRF'.
       01 WS-BALANCE-EDITED    PIC ZZ,ZZ9.99-.

       PROCEDURE DIVISION.
       0000-MAIN.
           DISPLAY 'BALANCE  9(5)V99   : ' WS-BALANCE
           MOVE WS-BALANCE TO WS-BALANCE-SMALL
           DISPLAY 'SMALL    9(3)V99   : ' WS-BALANCE-SMALL
           DISPLAY 'SIGNED   S9(5)V99  : ' WS-BALANCE-SIGNED
           MOVE WS-BALANCE-SIGNED TO WS-BALANCE-UNSIGNED
           DISPLAY 'UNSIGNED 9(5)V99   : ' WS-BALANCE-UNSIGNED
           MOVE WS-IBAN TO WS-IBAN-SHORT
           DISPLAY 'IBAN     X(10)     : ' WS-IBAN-SHORT '<'
           DISPLAY 'TXN-TYPE X(4)      : ' WS-TXN-TYPE '<'
           MOVE WS-BALANCE-SIGNED TO WS-BALANCE-EDITED
           DISPLAY 'EDITED   ZZ,ZZ9.99-: ' WS-BALANCE-EDITED '<'
           MOVE WS-BALANCE TO WS-BALANCE-EDITED
           DISPLAY 'EDITED   ZZ,ZZ9.99-: ' WS-BALANCE-EDITED '<'
           GOBACK
           .
