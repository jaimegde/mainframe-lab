       IDENTIFICATION DIVISION.
       PROGRAM-ID. COMPSHOW.
      *================================================================
      * COMPSHOW - Same amount stored as DISPLAY, COMP-3 and COMP.
      *================================================================
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-AMOUNT-DISPLAY  PIC S9(11)V99  VALUE 1250.40.
       01 WS-AMOUNT-PACKED   PIC S9(11)V99 COMP-3
                                            VALUE 1250.40.
       01 WS-AMOUNT-BINARY   PIC S9(11)V99 COMP
                                            VALUE 1250.40.
       01 WS-COUNTER         PIC S9(4) COMP VALUE 0.
       01 WS-TOTAL           PIC S9(13)V99 COMP-3
                                            VALUE 0.
       01 WS-AMOUNT-EDITED   PIC Z(12)9.99-.

       PROCEDURE DIVISION.
       0000-MAIN.
           MOVE WS-AMOUNT-DISPLAY TO WS-AMOUNT-EDITED
           DISPLAY 'DISPLAY S9(11)V99  bytes: '
                   FUNCTION LENGTH(WS-AMOUNT-DISPLAY)
                   '  value: '
                   WS-AMOUNT-EDITED
           MOVE WS-AMOUNT-PACKED TO WS-AMOUNT-EDITED
           DISPLAY 'COMP-3  S9(11)V99  bytes: '
                   FUNCTION LENGTH(WS-AMOUNT-PACKED)
                   '  value: '
                   WS-AMOUNT-EDITED
           MOVE WS-AMOUNT-BINARY TO WS-AMOUNT-EDITED
           DISPLAY 'COMP    S9(11)V99  bytes: '
                   FUNCTION LENGTH(WS-AMOUNT-BINARY)
                   '  value: '
                   WS-AMOUNT-EDITED
           DISPLAY 'COMP    S9(4)      bytes: '
                   FUNCTION LENGTH(WS-COUNTER)
           ADD WS-AMOUNT-DISPLAY TO WS-TOTAL
           ADD WS-AMOUNT-PACKED TO WS-TOTAL
           ADD WS-AMOUNT-BINARY TO WS-TOTAL
           MOVE WS-TOTAL TO WS-AMOUNT-EDITED
           DISPLAY 'TOTAL   S9(13)V99 COMP-3  : ' WS-AMOUNT-EDITED
           GOBACK
           .
