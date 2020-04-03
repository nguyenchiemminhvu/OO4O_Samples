
//This is a simple program showing how to execute sql statements asynchronously.


#include "windows.h"
#include "stdio.h"
#include "iostream.h"
#include <process.h>		
#include "oracl.h"

OSession osess ;


int main(int argc, char **argv)
{
	ODatabase odb;
	int retVal = 0;
	// create session object. 
	try
	{
		OStartup(OSTARTUP_MULTITHREADED);
		osess.Open();
		odb.Open(osess, "ora815", "scott", "tiger");
		if ( ! odb.IsOpen() )
		{ 
			cout <<  "Database not opened: " << odb.GetErrorText() << endl;
			odb.Close();
			return(-1);
		}
		// Set up a sql statement to execute in Non-Blocking mode
		OSqlStmt osqlstmt(odb, "update junk set ichar='AGAIN' where iint > 100  ",OSQLSTMT_NONBLK);
		long ret = OSQL_STILL_EXECUTING;
		while ( ret  == OSQL_STILL_EXECUTING )
		{
			ret = osqlstmt.NonBlockingState();
		}
		cout << "Statement executed succesfully in non-block mode" << endl;
		
		// To cancel an asynchronous execution
		ret = osqlstmt.SetSQL("update junk set ichar='CANCEL' where iint > 100");
		if ( ret != OSQL_SUCCESS )
			cout << "Error "  << osqlstmt.GetErrorText() << endl;
		osqlstmt.Refresh();
		ret = osqlstmt.NonBlockingState();
		if ( ret == OSQL_STILL_EXECUTING )
		{
			ret = osqlstmt.Cancel();
			if ( ret != OSQL_SUCCESS   )
				cout << "Error "  << osqlstmt.GetErrorText() << endl;
			else
				cout << "Cancel of non-block execution succesful" << endl;
		}

		// Change statement and execute asynchronously by calling refresh
		ret = osqlstmt.SetSQL("insert into junk values(1,'2')");
		if ( ret != OSQL_SUCCESS )
			cout << "Error "  << osqlstmt.GetErrorText() << endl;
		osqlstmt.Refresh();
		while( (ret = osqlstmt.NonBlockingState()) == OSQL_STILL_EXECUTING );
		cout << "Statement refreshed succesfully in non-block mode" << endl;
		// To get options set on this OSQLStmt
		ret = osqlstmt.GetOptions(); 
		cout << "osqlstmt is created in " << ((ret == 4) ? "NONBLOCK" : "SYNCHRONOUS" ) << " mode" << endl;
		osqlstmt.Close();
	}
	catch(OException oerr)
	{
		cout << "Exception while enqueuing message : " << oerr.GetErrorText() << endl;
		retVal =  -1;
	}
	odb.Close();
	osess.Close();
	OShutdown();
	return retVal;
}

