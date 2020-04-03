
This ISAPI Extension creates a pool of  connections to the database using 
OO4O and distributes the connections to users as they come in. 
The connection pooling is created only once during loading of the extension dll
and is maintained for different client requests. So by sharing the same connection 
from the pool,users will experience a significant  boost in performance. 

This sample creates the pool of connection specified by SIZE_OF_POOL 
in the header file oragate.h. This sample shows ,if all connections are in use, the user waits 
until one is open, or timeout occurs.

Like all ISAPI Extensions the programming must be thread safe.  This sample
uses Semaphore  to lock critical section. OStartup() and OShutdown()  should be called
in each function for accessing OO4O objects. 

Testing OO4O connection pooling in ISAPI Extension
--------------------------------------------------

1) Make sure you have IIS 3.0 or later, including all ISAPI extensions.

2) Make sure you have the standard employee table loaded in the database.

3) Make sure you have database alias 'exampledb' 

4) Build the ISAPI extention .dll (ORAGATE.DLL) using ORAGATE.DSW in Visual C++ 5.0
   or later.

5) Create a virtual directory from Microsoft Internet Service Manager
   whose access are both readable and executable, and place all .dll
   and .htm files in that directory. 

6) Load the Oragate.htm in the browser.

7) Clicking Run button  first time loads the ISAPI extension Oragate.dll and creates the pool 
   of connection and issues query to the database.

8) Load the Oragate.htm once again in the browser and clicking Run button gets the free
   connection from the pool and  issues query to the database.

