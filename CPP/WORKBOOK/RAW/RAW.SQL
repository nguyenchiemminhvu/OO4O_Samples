CREATE OR REPLACE PACKAGE rawtest AS
  TYPE RawTabTyp is table of raw(2000) index by binary_integer;
  PROCEDURE scalartest(inval in raw, outval out raw, inoutval in out raw);
  PROCEDURE arraytest(inarray in RawTabTyp, outarray out RawTabTyp, inoutarray in out RawTabTyp);
END rawtest;
/

CREATE OR REPLACE PACKAGE BODY rawtest AS

PROCEDURE scalartest(inval in raw, outval out raw, inoutval in out raw) is
 
BEGIN

outval := inoutval;
inoutval := '01020304050000060708090A0B0C0D0E';
		   
END scalartest;


PROCEDURE arraytest(inarray in RawTabTyp, outarray out RawTabTyp, inoutarray in out RawTabTyp) is

BEGIN
    	
outarray(1) := inoutarray(1);
outarray(2) := inarray(2);
outarray(3) := inoutarray(3);
inoutarray(1) := '01020304050607000008090A0B0C0D0E';
inoutarray(2) := '11121314151617000018191A1B1C1D1E1F20212223';
inoutarray(3) := '21222324000025262728292A';		
     	   
END arraytest;
END rawtest;
/

