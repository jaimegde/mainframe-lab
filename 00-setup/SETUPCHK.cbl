       IDENTIFICATION DIVISION.
       PROGRAM-ID. SETUPCHK.
      *================================================================
      * TOOLCHAIN VERIFICATION - SIMPLE INTEREST ACCRUAL
      *================================================================
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-ACCOUNT.
          05 WS-ACCT-ID          PIC X(10)            VALUE 'ES76207701'
                                                                      .
          05 WS-BALANCE          PIC S9(11)V99 COMP-3 VALUE 12500.75.
          05 WS-ANNUAL-RATE      PIC S9(03)V9(05) COMP-3
                                                      VALUE 0.03250.
          05 WS-ACCRUAL-DAYS     PIC S9(05) COMP-3    VALUE 90.
       01 WS-INTEREST-AMT        PIC S9(11)V99 COMP-3 VALUE ZERO.
       01 WS-EDIT-BALANCE        PIC Z,ZZZ,ZZZ,ZZ9.99.
       01 WS-EDIT-INTEREST       PIC Z,ZZZ,ZZZ,ZZ9.99.
       01 WS-CONTROL-FLAGS.
          05 WS-CALC-STATUS      PIC X(01)            VALUE 'N'.
             88 CALC-SUCCESSFUL                       VALUE 'Y'.
             88 CALC-OVERFLOW                         VALUE 'N'.
       PROCEDURE DIVISION.
       0000-MAIN.
           PERFORM 1000-INITIALIZE
           PERFORM 2000-ACCRUE-INTEREST
           PERFORM 3000-FINALIZE
           STOP RUN.
       1000-INITIALIZE.
           MOVE WS-BALANCE TO WS-EDIT-BALANCE
           DISPLAY '=== TOOLCHAIN CHECK ==='
           DISPLAY 'ACCOUNT  : ' WS-ACCT-ID
           DISPLAY 'BALANCE  : ' WS-EDIT-BALANCE.
       2000-ACCRUE-INTEREST.
           COMPUTE WS-INTEREST-AMT ROUNDED =
              (WS-BALANCE * WS-ANNUAL-RATE * WS-ACCRUAL-DAYS) / 360
           ON SIZE ERROR
              SET CALC-OVERFLOW TO TRUE
           NOT ON SIZE ERROR
               SET CALC-SUCCESSFUL TO TRUE
           END-COMPUTE.
       3000-FINALIZE.
           IF CALC-SUCCESSFUL
              MOVE WS-INTEREST-AMT TO WS-EDIT-INTEREST
              DISPLAY 'INTEREST : ' WS-EDIT-INTEREST
              DISPLAY 'RESULT   : TOOLCHAIN OK'
           ELSE
              DISPLAY 'RESULT   : CALCULATION FAILED'
           END-IF.
           