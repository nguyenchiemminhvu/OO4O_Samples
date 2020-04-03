
CONNECT /@exampledb as sysdba;
CREATE user scott identified by tiger;
GRANT AQ_ADMINISTRATOR_ROLE TO scott;
GRANT CONNECT TO scott;
GRANT RESOURCE TO scott;
EXECUTE dbms_aqadm.grant_type_access('scott');
CONNECT scott/tiger@exampledb;
SET ECHO ON;
SET SERVEROUTPUT ON;
