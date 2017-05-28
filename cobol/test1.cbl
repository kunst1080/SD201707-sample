       IDENTIFICATION DIVISION.
       PROGRAM-ID. test1.
       ENVIRONMENT DIVISION.
      *
       DATA DIVISION.
      *
       WORKING-STORAGE SECTION.
       01  FILLER.
            03 TEST-X.
             10 VAR         PIC X(14).
             10 END-POINT   PIC X(01) VALUES '/'.
            03 TEST-9.
             10 VAR         PIC 9(08).
             10 END-POINT   PIC X(01) VALUES '/'.
            03 TEST-S.
             10 VAR         PIC S9(07).
             10 END-POINT   PIC X(01) VALUES '/'.
            03 TEST-COMP3.
             10 VAR         PIC S9(09)V9(2) COMP-3.
             10 END-POINT   PIC X(01) VALUES '/'.
            03 TEST-N.
             10 VAR         PIC N(09).
             10 END-POINT   PIC X(01) VALUES '/'.
            03 TEST-B.
             10 VAR         PIC S9(4) COMP.
             10 END-POINT   PIC X(01) VALUES '/'.
      *
       PROCEDURE DIVISION.
       MAIN-RTN.
           PERFORM EDIT-RTN.
           PERFORM OUTPUT-RTN.
           MOVE 9 TO RETURN-CODE.
       EXIT.
       STOP RUN.
      *
       EDIT-RTN SECTION.
           MOVE 'This is X Type'        TO VAR OF TEST-X.
           MOVE 12345678                TO VAR OF TEST-9.
           MOVE -12345                  TO VAR OF TEST-S.
           MOVE 123456789.12            TO VAR OF TEST-COMP3.
           MOVE '‚±‚ñ‚É‚¿‚ÍA¢ŠEI'    TO VAR OF TEST-N.
           MOVE 38533                   TO VAR OF TEST-B. *> 38533 = 0x9685 = '–…'
       EXIT.
      *
       OUTPUT-RTN SECTION.
           DISPLAY 'TEST-X    :'    TEST-X.
           DISPLAY 'TEST-9    :'    TEST-9.
           DISPLAY 'TEST-S9   :'    TEST-S.
           DISPLAY 'TEST-COMP3:'    TEST-COMP3.
           DISPLAY 'TEST-N    :'    TEST-N.
           DISPLAY 'TEST-BYTE :'    TEST-B.
       EXIT.
      *
