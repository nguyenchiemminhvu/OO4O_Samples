This directory contains a sample VB application that uses oo4o VARRAY features.
This sample application creates collection object from VARRAY instance in the database.
This sample is based on "DEPARTMENT" table containing "ENAMELIST" VARRAY column. 
Each rows rows of department table stores array of its employee names in VARRAY column.VARRAY values are 
displayed in listbox.Navigating rows in the DEPARTMENT table displays corresponding ENAMELIST
in the list box.

You must first follow the following quick instructions before the applications
can be executed. 

1) Make sure that you have created the database alias 'exampledb' in TNSNAMES.ORA.

2) Log into the Oracle database and install the DEPARTMENT table and ENAMELIST VARRAY type
   stored in "varray.sql". This varray.sql can be found in this directory

4) Start the application.