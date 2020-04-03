---------------------------------------------------------------------------------

--	   This SQL file builds the tables for department table having VARRAY column

---------------------------------------------------------------------------------

DROP TABLE department;
DROP TYPE ENAMELIST;

CREATE TYPE ENAMELIST  AS VARRAY(20) OF VARCHAR2(30);
/

CREATE TABLE department (
dept_id NUMBER(2),
name VARCHAR2(15),
ENAMES ENAMELIST);

INSERT INTO department
      VALUES(10, 'ACCOUNTING',
      ENAMELIST('KING','CLARK','MILLER') );

INSERT INTO department
      VALUES(20, 'RESEARCH',
      ENAMELIST('JONES','SCOTT','ADAMS','SMITH','FORD') );

INSERT INTO department
      VALUES(30, 'SALES',
      ENAMELIST('BLAKE','MARTIN','ALLEN','TURNER','JAMES') );


create or replace package Deptpkg as
 PROCEDURE getnames(deptid in NUMBER, name out ENAMELIST);
end Deptpkg;
/

create or replace package body Deptpkg as

PROCEDURE getnames(deptid in NUMBER, name out ENAMELIST) is
BEGIN 
      SELECT ENAMES into name from department where dept_id = deptid for update;
END;

end Deptpkg;
/
commit;


