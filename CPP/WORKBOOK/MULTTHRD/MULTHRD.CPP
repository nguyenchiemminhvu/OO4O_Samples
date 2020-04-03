
//This is a simple program showing how to call oo4o api from a mulithreaded application.
//Note that every thread has its own OStartup() and OShutdown() routines.

// PROJECT SETTINGS : Under C/C++ option, make sure the project options is /MT for release
// or /MTd for debug(NOT /ML or /MLd).


#include "windows.h"
#include "stdio.h"
#include "iostream.h"
#include <process.h>		
#include "oracl.h"

// Currently uses connection pooling.
// TO DISABLE CONNECTION POOLING COMMENT OUT THE FOLLOWNG STATEMENT.

#define _CONNECTION__POOL


 
#ifdef _CONNECTION__POOL
unsigned int WINAPI browse_dyn2(LPVOID arg); 
#else
unsigned int WINAPI browse_dyn(LPVOID arg);
#endif // _CONNECTION__POOL

int nThreads = 10;

void main(int argc, char **argv)
{

	HANDLE	aThreads[10000];
	DWORD	aThreadIds[10000];

	if (argc == 2)
		nThreads = atoi(argv[1]);  //# of threads
	else 
	{
		cout << "Usage: multhrd <# of threads (<=100)> " << endl;
		exit(1);
	}
	
	OStartup(OSTARTUP_MULTITHREADED);

#ifdef _CONNECTION__POOL
	OSession osess ;
	osess.Open();

	if ( ! osess.IsOpen() )
	{
		cout <<  "Session not opened: Error: " << osess.GetErrorText() << endl;
		osess.Close();
		OShutdown();
		exit(1);
	} 
	// Use connection pooling.
	osess.CreateDatabasePool(nThreads,nThreads,0, "exampledb",
		"scott", "tiger", ODATABASE_DEFAULT);
#endif // _CONNECTION__POOL
	
	//Now spawn threads and call browse_dyn function
	int i;

	for (i = 0; i < nThreads; i++)
	{  
#ifdef _CONNECTION__POOL
			aThreads[i] =(HANDLE) _beginthreadex(NULL,0,browse_dyn2, 
				(LPVOID)&osess , 0,(unsigned int  *) &aThreadIds[i]); 
#else
			aThreads[i] =(HANDLE) _beginthreadex(NULL,0,browse_dyn, 
				NULL , 0,(unsigned int  *) &aThreadIds[i]); 

#endif // _CONNECTION__POOL
	}
	
	int j = 0;

	cout << "Main Thread - " << i <<  " nThreads: "  << nThreads << endl;

	// wait for all created threads to complete their execution
	for (j = 0; j < i; j++)
	{

		DWORD	r = WaitForSingleObject(aThreads[j], INFINITE);


		switch (r)
		{
			case WAIT_TIMEOUT:
				fprintf(stderr,"WAIT_TIMEDOUT_0 ...\n");
				break;
			case WAIT_OBJECT_0:
				fprintf(stderr,"WAIT_OBJECT_0 ...\n");
				break;
			case WAIT_ABANDONED_0:
				fprintf(stderr,"WAIT_ABANO_0 ...\n");
				break;
			case WAIT_FAILED:
				fprintf(stderr,"WAIT_FAILED_0 ...\n");
				break;
			default:
				LPVOID lpMsgBuf;
				FormatMessage( 
					FORMAT_MESSAGE_ALLOCATE_BUFFER | FORMAT_MESSAGE_FROM_SYSTEM,
					NULL,
					GetLastError(),
					MAKELANGID(LANG_NEUTRAL, SUBLANG_DEFAULT), // Default language
					(LPTSTR) &lpMsgBuf,
					0,
					NULL 
					);

				fprintf(stderr, "Default ......%s\n",lpMsgBuf);
		}
	} //end for

#ifdef _CONNECTION__POOL
	osess.Close();
#endif // _CONNECTION__POOL

	OShutdown();
}

#ifdef _CONNECTION__POOL


unsigned int WINAPI browse_dyn2(LPVOID arg)
{
	cout << "In Thread ID : " << GetCurrentThreadId() << endl;

	// OStartup() should be called with every thread invocation	
	// OSTARTUP_MULTITHREADED option should be passed 

	OStartup(OSTARTUP_MULTITHREADED);


	OSession *osess = (OSession *) arg;
	ODatabase odb = osess->GetDatabaseFromPool(10);

	if ( ! odb.IsOpen() )
	{ 
		cout <<  "Database not opened: " << osess->GetErrorText() << endl;
		odb.Close();
		exit(-1);
	}

	for( int i = 1; i < 300; i ++ )
	{
		ODynaset odyn;
		odyn.Open(odb, "select * from emp", ODYNASET_NOCACHE | ODYNASET_READONLY);
		int isopen = odyn.IsOpen();
		if (isopen)
		{
			while (!odyn.IsEOF()) {
				odyn.MoveNext();
			}
		}
		else
		{
			cout << "Dynaset not opened: Error: " << odb.GetServerErrorText() << endl;
		}
		odyn.Close();
	}
	odb.Close();
	OShutdown();
	cout << "Out of thread: Thread Id " << GetCurrentThreadId() << endl;
	return 0;
}


#else

unsigned int WINAPI browse_dyn(LPVOID arg)
{
	cout << "In Thread: Thread Id " << GetCurrentThreadId() << endl;

	// OStartup() should be called with every thread invocation	
	// OSTARTUP_MULTITHREADED option should be passed 
	OStartup(OSTARTUP_MULTITHREADED);


	// create session object for each thread. This gives maximum 
	// concurrency to the thread execution. This is also useful when OO4O
	// error reported on session object for one thread cannot be seen by
	// another thread.
	OSession osess ;
	osess.Open();
	
	if ( ! osess.IsOpen() )
	{
		cout <<  "Session not opened: Error: " << osess.GetErrorText() << endl;
		osess.Close();
		OShutdown();
		exit(-1);
	}

	ODatabase odb;
	odb.Open(osess, "exampledb", "scott", "tiger");
	if ( ! odb.IsOpen() )
	{ 
		cout <<  "Database not opened: " << osess.GetErrorText() << endl;
		odb.Close();
		osess.Close();
		OShutdown();
		exit(-1);
	}

	for( int i = 1; i < 300; i ++ )
	{
		ODynaset odyn;
		odyn.Open(odb, "select * from emp", ODYNASET_NOCACHE | ODYNASET_READONLY);
		int isopen = odyn.IsOpen();
		if (isopen)
		{
			while (!odyn.IsEOF()) {
				odyn.MoveNext();
			}
		}
		else
		{
			cout << "Dynaset not opened: Error: " << odb.GetServerErrorText() << endl;
		}
		odyn.Close();
	}
	
	odb.Close();
	osess.Close();
	OShutdown();
	cout << "Out of thread: Thread Id " << GetCurrentThreadId() << endl;
	return 0;
}
#endif // _CONNECTION__POOL

