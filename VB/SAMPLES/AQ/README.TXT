This directory contains a sample VB application that uses oo4o 
and demonstrates advanced queueing features such as enqueueing and 
dequeueing of messages of user-defined types. 


Before running the application, please run aq_init.SQL and 
aq.SQL in that order. These scripts install necessary tables and plsql packages.

To drop aq tables and queues, run aqdrop.sql

If you are having problems accessing the package dbms_aqadm, please
run catqueue.sql and dbmsaqad.sql from the $ORACLE_HOME/rdbms/admin directory.