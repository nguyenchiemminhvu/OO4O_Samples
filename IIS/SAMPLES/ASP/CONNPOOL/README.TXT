7/21/97

This directory contains a sample ASP application that uses oo4o.
You must first follow the following quick instructions to install
before the applications can be executed. This sample uses the connection 
pooling facility provided by oo4o.

1) Make sure you have IIS 3.0 or later, including all ASP extensions.

2) Log into the Oracle database and install the PL/SQL procedures
   stored in "asp.sql."  Type in "@drive:\path_to_sql_file\asp.sql"
   at the database prompt.

3) Make sure you have the standard emp table loaded in the local database.

4) Create a vitual directory from Microsoft Internet Service Manager
   whose access are both readable and executable, and place all .asp
   and .asa files in that directory. 