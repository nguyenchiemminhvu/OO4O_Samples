---------------------------------------------------------------------------------

--	   This SQL file builds the tables for objects data

---------------------------------------------------------------------------------

set echo on;

drop type address force;

create type address as object (city varchar2(20), zip varchar2(10));
/

drop type person force;

drop table person_tab;

create type person as object ( name varchar2(20), age number, addr address);
/

create table  person_tab of person;

insert into person_tab values('Nasser',40, address('Pleasanton', '94065'));

insert into person_tab values('Maha', 25, address('Belmont', '94002'));

insert into person_tab values('Chris',30, address('San Francisco', '94123'));

insert into person_tab values('Gopal',28, address('Fremont', '11111'));

insert into person_tab values('Ashish',27, address('San Jose', '22222'));

drop type customerobj force;

drop table customers;

create type customerobj as object (account number, aperson REF person);
/

create table customers of customerobj;

insert into customers values(10, null);                              
						                              
update customers set aperson = (select ref(p) from person_tab p where p.name = 'Nasser') where account = 10;

insert into customers values(20, null);                              
						                              
update customers set aperson = (select ref(p) from person_tab p where p.name = 'Maha') where account = 20;

insert into customers values(30, null);                              
						                              
update customers set aperson = (select ref(p) from person_tab p where p.name = 'Chris') where account = 30;

insert into customers values(40, null);                              
						                              
update customers set aperson = (select ref(p) from person_tab p where p.name = 'Gopal') where account = 40;
                              
insert into customers values(50, null);                              
						                              
update customers set aperson = (select ref(p) from person_tab p where p.name = 'Ashish') where account = 50;


drop table customers1;

create table customers1 (account number, aperson person);

insert into customers1 values(10, person('Nasser',40, address('Pleasanton', '94065')));

insert into customers1 values(20, person('Maha', 25, address('Belmont', '94002')));

insert into customers1 values(30, person('Chris',30, address('San Francisco', '94123')));

insert into customers1 values(40, person('Gopal',28, address('Fremont', '11111')));

insert into customers1 values(50, person('Ashish',27, address('San Jose', '22225')));

commit;



