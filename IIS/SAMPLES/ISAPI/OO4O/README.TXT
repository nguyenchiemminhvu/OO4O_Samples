This directory contains a sample ISAPI application that uses oo4o.
You must first follow the following quick instructions to install
before the applications can be executed.

1) Make sure you have IIS 3.0 or later, including all ISAPI extensions.

2) Make sure you have the standard emp table loaded in the database.

3) Make sure you have database alias 'exampledb' 

4) Build the ISAPI extention .dll (OO4O.DLL) using OO4O.DSW in Visual C++ 5.0
   or later.


5) Create a virtual directory from Microsoft Internet Service Manager
   whose access are both readable and executable, and place all .dll
   and .htm files in that directory. 
