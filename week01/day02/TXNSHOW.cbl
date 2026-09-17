       IDENTIFICATION DIVISION.
       PROGRAM-ID. TXNSHOW.
      *================================================================
      * TXNSHOW - Display a hard-coded account and balance.
      * Author: Jaime G.        Date: 2026-09-17
      *================================================================
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-ACCOUNT-IBAN     PIC X(24)
                                          VALUE
             'ES9121000418450200051332'.
       01 WS-ACCOUNT-BALANCE  PIC 9(5)V99 VALUE 1250.40.

       PROCEDURE DIVISION.
       0000-MAIN.
           PERFORM 1000-INITIALIZE
           PERFORM 2000-PROCESS
           PERFORM 3000-FINALIZE
           GOBACK
           .
       1000-INITIALIZE.
           DISPLAY 'TXNSHOW - START'
           .
       2000-PROCESS.
           DISPLAY 'ACCOUNT: ' WS-ACCOUNT-IBAN
           DISPLAY 'BALANCE: ' WS-ACCOUNT-BALANCE
           .
       3000-FINALIZE.
           DISPLAY 'TXNSHOW - END'
           .
