-- creates PL/SQL package to be used in ASP demos

create or replace package ASP_demo as
    --cursor c1 is select * from emp;
    type empCur is ref cursor; 

    PROCEDURE GetCursor(p_cursor1 in out empCur, indeptno IN NUMBER, p_errorcode OUT NUMBER);

END ASP_demo;
/

--------------------------------------------------------------------------------------

create or replace package body ASP_demo as

PROCEDURE GetCursor(p_cursor1 in out empCur, indeptno IN NUMBER, p_errorcode OUT NUMBER) is
BEGIN 
    p_errorcode:= 0;
    open p_cursor1 for select * from emp where deptno = indeptno;
EXCEPTION
    When others then
    p_errorcode:= SQLCODE;       
END GetCursor; 

----------------------------------------------------------------------------------------

END ASP_demo;
/


