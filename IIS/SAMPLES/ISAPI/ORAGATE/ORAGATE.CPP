#include "stdafx.h"
#include "oragate.h"

///////////////////////////////////////////////////////////////////////
// The one and only CWinApp object
// NOTE: You may remove this object if you alter your project to no
// longer use MFC in a DLL.

CWinApp theApp;

///////////////////////////////////////////////////////////////////////
// command-parsing map

BEGIN_PARSE_MAP(COragateExtension, CHttpServer)
	// TODO: insert your ON_PARSE_COMMAND() and 
	// ON_PARSE_COMMAND_PARAMS() here to hook up your commands.
	// For example:

	ON_PARSE_COMMAND(Default, COragateExtension, ITS_EMPTY)
	DEFAULT_PARSE_COMMAND(Default, COragateExtension)
END_PARSE_MAP(COragateExtension)


///////////////////////////////////////////////////////////////////////
// The one and only COragateExtension object

COragateExtension theExtension;


///////////////////////////////////////////////////////////////////////
// COragateExtension  Extension

COragateExtension::COragateExtension()
{
	oresult ores;

	OStartup(OSTARTUP_MULTITHREADED);

	// open the default (unnamed) session
    ores = sess.Open();

	// Here, we are creating pool of connections. Since this  constructor 
	// is called only at loading of this extension .dll, this connection
	// pool is created only once and accessed for servicing each client request.	

	for (int i=0; i < SIZE_OF_POOL; i++) {
		// open connections to database
		ores = datab[i].Open(sess, "exampledb", "scott", "tiger");
	}								 

	// This semaphore will be used to serialize access to connection pool
	pLock = CreateSemaphore(NULL, 1, 1, "Pool");

	// This semaphore will be used to block the thread requesting a connection 
	// from the pool when all connections in the pool are in use 
	cLock = CreateSemaphore(NULL, SIZE_OF_POOL, SIZE_OF_POOL, "Connection");

	OShutdown();
}

COragateExtension::~COragateExtension()
{
	oresult ores;

	// Releases all the connection, Close() method destroys the connection 
	// object

	for(int i=0; i < SIZE_OF_POOL; i++) {
		// close connections
		ores = datab[i].Close();
	}
}

BOOL COragateExtension::GetExtensionVersion(HSE_VERSION_INFO* pVer)
{
	// Call default implementation for initialization
	CHttpServer::GetExtensionVersion(pVer);

	// Load description string
	TCHAR sz[HSE_MAX_EXT_DLL_NAME_LEN+1];
	ISAPIVERIFY(::LoadString(AfxGetResourceHandle(),
			IDS_SERVER, sz, HSE_MAX_EXT_DLL_NAME_LEN));
	_tcscpy(pVer->lpszExtensionDesc, sz);
	return TRUE;
}

///////////////////////////////////////////////////////////////////////
// COragateExtension command handlers

void COragateExtension::Default(CHttpServerContext* pCtxt)
{
	int		CID;
	OValue  val;
	oresult ores;
	ODynaset	dyn;

	OStartup(OSTARTUP_MULTITHREADED);
	StartContent(pCtxt);
	WriteTitle(pCtxt);

	// Here we are getting the index of the free connection from the connection
	// pool.
	CID = FindOpenConnection();
	if (CID == -1) {
		// timed out
		*pCtxt << _T("<BR><B> ERROR: Timeout -- Server Busy <B>");
		return;
	}

	// query the database
    ores = dyn.Open(datab[CID], "select ename from emp");
	checkerr(ores, dyn.GetErrorText(), pCtxt);

    // process all the records
    while (!dyn.IsEOF()) // until we?ve gone past all the records
    {
        dyn.GetFieldValue("ename", &val);
		dyn.MoveNext();    // move to the next record
		*pCtxt << _T("<BR>") << _T((const char *)val);		
    }
	
	// return the connection to the pool.
	int err = ReleaseConnection(CID);
	if (err) {
		*pCtxt << _T("<BR><B> ERROR: Error in cLock semaphore release </B>");
	}

	dyn.Close();
	OShutdown();
	EndContent(pCtxt);
}

// Do not edit the following lines, which are needed by ClassWizard.
#if 0
BEGIN_MESSAGE_MAP(COragateExtension, CHttpServer)
	//{{AFX_MSG_MAP(COragateExtension)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()
#endif	// 0

// This function returns free connection index from the connection
// pool
int COragateExtension::FindOpenConnection()
{
	int i = 0; // connection id
	
	// Here we have to wait if all the connections in the pool has been
	// used by different threads. Block for TIMEOUT period if no free 
	// connection is available in the pool
	DWORD wres = WaitForSingleObject(cLock, TIMEOUT);  
	if (wres != WAIT_OBJECT_0) {
		// timed out
		return -1;
	}


	//Allow only one thread to access the pool at a time
	wres = WaitForSingleObject(pLock, INFINITE);

	// loop until we find the open connection
	while( i < SIZE_OF_POOL )
	{
		// check if connection 'i' is open
		if ( pool[i] == 0 ) 
		{
			pool[i] = 1;
			break;
		}
		else
		{ 
			i++;
		}
	}


	wres = ReleaseSemaphore(pLock, 1, NULL);

	// return connection id
	ASSERT(i >= 0 && i < SIZE_OF_POOL);
	ASSERT(datab[i].IsOpen());
	return i;
}


int COragateExtension::ReleaseConnection(int CID)
{
	pool[CID] = 0;

	// increment semaphore counter to signal free connection
	if (ReleaseSemaphore(cLock, 1, NULL) == 0) {
		// failed
		return -1;		
	}

	return 0;
}

void COragateExtension::checkerr(oresult ores, const char *errmsg, CHttpServerContext *pCtxt)
{
	if (ores != OSUCCESS) {
		*pCtxt << "<BR><B>" << errmsg << "</B>";
	}

	return;
}
