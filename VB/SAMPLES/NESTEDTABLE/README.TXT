This directory contains a sample VB application that uses oo4o Nested table features.
This sample application creates dynaset object from Nested table instance in the database.
This sample is based on "DIVISION" table containing "COURSELIST" nested table column. 
Column values of both DIVISION table and COURSELIST nested tables are displayed in a 
seperate grid control. Navigating rows in the DIVISION grid displays corresponding COURSELIST
 nested table grid.

You must first follow the following quick instructions before the applications
can be executed. 

1) Make sure that you have created the database alias 'exampledb' in TNSNAMES.ORA.

2) Log into the Oracle database and install the DIVISION and COURSELIST nested tables 
   stored in "coll_dyn.sql". This coll_dyn.sql can be found in this directory

4) Start the application.