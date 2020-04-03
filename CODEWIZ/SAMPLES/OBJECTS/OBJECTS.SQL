---------------------------------------------------------------------------------

--	   This SQL file builds the tables for objects data

---------------------------------------------------------------------------------
set echo on;

drop type address force;

--create type address as object (city varchar2(20), zip varchar2(10));
create type address AS object (street VARCHAR2(200), city VARCHAR2(200), state CHAR(2), zip VARCHAR2(20));
/
drop type person force;
drop table person_table;

create type person as object ( name varchar2(20), age number, addr address);
/
create table  person_table of person;

insert into person_table values('Nasser',40, address('940 Washington Ave', 'Pleasanton', 'CA', '94065'));
insert into person_table values('Maha', 25, address('565 Webster pl', 'Belmont', 'CA', '94002'));
insert into person_table values('Chris',30, address('1884 Springfield st', 'San Francisco', 'CA', '94123'));
insert into person_table values('Gopal',28, address('868 Rainbow ct', 'Fremont', 'CO', '11111'));
insert into person_table values('Ashish',27, address('3737 California st', 'San Jose', 'AZ', '22222'));

create or replace package personpkg as
 PROCEDURE getaddress(person_name in varchar2, person_address out address);
end personpkg;
/

create or replace package body personpkg as

PROCEDURE getaddress(person_name in varchar2, person_address out address) is
BEGIN 
      SELECT addr into person_address from person_table where name = person_name for update;
END;

end personpkg;
/ 

