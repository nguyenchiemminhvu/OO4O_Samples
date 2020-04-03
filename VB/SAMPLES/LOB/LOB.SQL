---------------------------------------------------------------------------------

--	   This SQL file builds the tables for LOB data

---------------------------------------------------------------------------------


drop table part;
 
CREATE TABLE part( 
    part_id NUMBER,
    part_name VARCHAR2(20),
    part_image BLOB,  
    part_desc  CLOB,  
    part_collateral BFILE
);
 
 
insert into part values (1,'ORACLE NETWORK',EMPTY_BLOB(),EMPTY_CLOB(),NULL);
insert into part values (2,'ORACLE SERVER', EMPTY_BLOB(),EMPTY_CLOB(),NULL);
 
