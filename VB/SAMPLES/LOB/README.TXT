This directory contains a sample VB application that uses oo4o LOB features.
You must first follow the following quick instructions before the applications
can be executed. 

1) Make sure that you have created the database alias 'exampledb' in TNSNAMES.ORA.

2) Log into the Oracle database and install the LOB tables 
   stored in "lob.sql." This lob.sql can be found in this directory

3) In VB application for CLOB/BLOB write method, Open function should point to correct 
   file location in this directory.(partdesc.dat,partimage.dat)

4) Prior  to LOB reading ,Write button for CLOB/BLOB must be clicked first to insert some LOB data. 