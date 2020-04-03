REM This script is for testing metadata. It is modified after tkp8dsy.sql. Huihong

Rem
Rem $Header: tkp8dsy.sql 29-jan-98.12:03:49 skaluska Exp $
Rem
Rem tkp8dsy.sql
Rem
Rem  Copyright (c) Oracle Corporation 1996, 1997, 1998, 2002. All Rights Reserved.
Rem
Rem    NAME
Rem      tkp8dsy.sql - a setup script for tkp8dsy.c
Rem
Rem    DESCRIPTION
Rem      This script creates TABLE, VIEW, SYNONUM, PACKAGE, FUNCTION,
Rem      and PROCEDURE that will be described by ocidsac() in tkp8dsy.c
Rem
Rem    NOTES
Rem      <other useful comments, qualifications, etc.>
Rem
Rem    MODIFIED   (MM/DD/YY)
Rem    skaluska       01/29/98 - Add maxvalue for DSA_SEQUENCE
Rem    azhao          08/20/97 - add column RID to table for more coverage
Rem    cxcheng        05/14/97 - add more things to the test
Rem    azhao          05/08/97 - remove size constraint on lob
Rem    skaluska       05/05/97 - Add procedure with zero arguments
Rem    sgollapu       05/05/97 - Add integer type columns
Rem    skaluska       04/30/97 - Add overloaded function
Rem    sgollapu       04/29/97 - Create procedure with records as args
Rem    skaluska       04/29/97 - multiple level arguments
Rem    cxcheng        04/04/97 - make oramd_cmplxtype more complex
Rem    cxcheng        02/05/97 - add map and order methods
Rem    cxcheng        02/04/97 - add methods to DSA_TYPE
Rem    skaluska       04/01/97 - Add typed arguments
Rem    azhao          01/21/97 - do CONNECT in .tsc for remote testing
Rem    sgollapu       12/23/96 - Add sequences
Rem    skaluska       11/15/96 - Created
Rem

Rem connect tkp8dsy/tkp8dsy;

drop view oramd_view;
drop synonym oramd_synonym;
drop table oramd_table;
drop table oramd_tbl1;
drop procedure oramd_proc;
drop function oramd_func;
drop package oramd_package;
drop sequence oramd_sequence;
drop type oramd_cmplxtype;
drop type oramd_tbltype;
drop type oramd_vartype;
drop type oramd_collection;
drop type oramd_recursive; 
drop type oramd_basetype;

create type oramd_basetype as object
  (a number(11,2), b float, c smallint, d decimal(10));
/

create type oramd_tbltype as table of oramd_basetype;
/

create type oramd_vartype as varray(10) of ref oramd_basetype;
/

create type oramd_collection as varray(10) of float;
/

create type oramd_recursive as object 
(
	lb2 clob,
	myself  ref oramd_recursive
);
/

create type oramd_cmplxtype as object
(
  d   decimal(20),
  d2  decimal,
  n   number(9, 2),
  n2  number,
  c   char,
  v   varchar(100),
  v2  varchar2(2000),
  f   float(70),
  f2  float,
  i   integer,
  s   smallint,
  rl  real,
  db  double precision,
  adt oramd_basetype,
  tbl oramd_tbltype,
  var oramd_vartype,
  lb1 blob,
  lb2 clob,
  rf  ref oramd_cmplxtype,
  map member function mapfunc return number,
  PRAGMA RESTRICT_REFERENCES(mapfunc, RNDS, WNDS, RNPS, WNPS),
  member function func1 (a in out integer, b in ref oramd_cmplxtype, c out char)
    return number,
  member procedure func2 (a in oramd_basetype, b in char default 'c'),
  member procedure func2 (a in oramd_basetype, b in number default 0),
  member procedure func2 (a in oramd_basetype, b in oramd_basetype),
  member procedure func3 (a in ref oramd_basetype),
  member procedure func3 (a in oramd_basetype, b in char default 'c'),
  member procedure func3 (a in oramd_basetype, b in number default 0),
  member procedure func3 (a in oramd_basetype, b in oramd_basetype),
  member procedure func4 (a in ref oramd_basetype),
  member function  oramd_func (n number, i in out integer, r real, s out smallint,
                             v varchar, t1 REF oramd_cmplxtype, t2 oramd_vartype)
    return boolean
);
/

create table oramd_table (id1 number, name1 varchar2(20), salary1 number,
			id2 number, name2 varchar2(21), salary2 number,
			id3 number, name3 varchar2(22), salary3 number,
			id4 number, name4 varchar2(23), salary4 number,
			id5 number, name5 varchar2(24), salary5 number,
			id6 number, name6 varchar2(25), salary6 number,
			id7 number, name7 varchar2(26), salary7 number,
			id8 number, name8 varchar2(27), salary8 number,
			id9 number, name9 varchar2(28), salary9 number,
			id10 number, name10 varchar2(20), salary10 number(9,2),
			id11 number, name11 varchar2(20), salary11 number(30),
			id12 number, name12 varchar2(20), salary12 number,
                        sm1 smallint, fl1 float, fl2 float(60),
                        rl real, db double precision, int1 integer,
                        de1 decimal(10), de2 decimal,
			adt1 oramd_vartype, adt2 REF oramd_basetype, rid rowid);

create table oramd_tbl1 (name varchar2(10), id integer, rec oramd_basetype);

create view oramd_view as select * from oramd_table;

create synonym oramd_synonym for oramd_table;

create procedure oramd_proc (n number, t1 oramd_basetype, t2 oramd_vartype,
                           rec2 oramd_tbl1%rowtype) is
begin
 null;
end;
/

create function  oramd_func (n number, i in out integer, r real, s out smallint,
                           v varchar, t1 REF oramd_basetype, t2 oramd_vartype)
  return boolean is
begin
  return true;
end;
/

create package oramd_package is
  type rectype is record (a oramd_tbl1%rowtype, b number);
  function oramd_pkgf(n number, r rectype, r1 oramd_tbl1%rowtype) return number;
  function oramd_pkgf(c char) return number;
  procedure oramd_pkgp(n number);
  procedure oramd_pkgp2;
end oramd_package;
/

create sequence oramd_sequence
  increment by 1
  start with 1
  minvalue 0
  maxvalue 999999
  cache 10
  order
  nocycle;

 
