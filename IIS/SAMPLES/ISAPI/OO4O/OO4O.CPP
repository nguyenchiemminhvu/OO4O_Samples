// OO4O.CPP - Implementation file for your Internet Server
//    OO4O Extension
//
// The Default method of this ISAPI Extension represents the
// simplest type of example using OO4O.  The Query method
// demonstrates an implementation of a more dynamic means of
// querying using OO4O.


#include "stdafx.h"
#include "OO4O.h"

///////////////////////////////////////////////////////////////////////
// The one and only CWinApp object
// NOTE: You may remove this object if you alter your project to no
// longer use MFC in a DLL.

CWinApp theApp;

///////////////////////////////////////////////////////////////////////
// command-parsing map

BEGIN_PARSE_MAP(COO4OExtension, CHttpServer)
	// TODO: insert your ON_PARSE_COMMAND() and 
	// ON_PARSE_COMMAND_PARAMS() here to hook up your commands.
	// For example:

	ON_PARSE_COMMAND(Query, COO4OExtension, ITS_PSTR)
	ON_PARSE_COMMAND_PARAMS("query")

	ON_PARSE_COMMAND(Default, COO4OExtension, ITS_EMPTY)
	DEFAULT_PARSE_COMMAND(Default, COO4OExtension)
END_PARSE_MAP(COO4OExtension)


///////////////////////////////////////////////////////////////////////
// The one and only COO4OExtension object

COO4OExtension theExtension;


///////////////////////////////////////////////////////////////////////
// COO4OExtension implementation

COO4OExtension::COO4OExtension()
{
}

COO4OExtension::~COO4OExtension()
{
}

BOOL COO4OExtension::GetExtensionVersion(HSE_VERSION_INFO* pVer)
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
// COO4OExtension command handlers

///////////////////////////////////////////////////////////////////////
// COO4OExtension::Default
//
// Returns the salaries of all employees in the Database

void COO4OExtension::Default(CHttpServerContext* pCtxt)
{
 	StartContent(pCtxt);
	WriteTitle(pCtxt);

	OSession  sess;    // database session object
    ODatabase datab;   // the database object
	ODynaset  dyn;     // dynaset object
    
    double    cursal;  // salary of the current employee
	oresult   ores;    // indicates whether operation succeeded	

	// Start OO4O Environment
	OStartup();	

    // open the default (unnamed) session
    ores = sess.Open();
	checkerr(ores, sess.GetErrorText(), pCtxt);

	// HTML beautification
	*pCtxt << _T("<BODY BGCOLOR=#FFFFFF><FONT FACE=ARIAL,HELVETICA>");
	*pCtxt << _T("<CENTER><H2>OO4O Test</H2>");

	// output version number
	*pCtxt << _T("<BR>OO4O version ") << _T(sess.GetVersion());

    // connect to the database
    ores = datab.Open(sess, "exampledb", "scott", "tiger");
	checkerr(ores, sess.GetServerErrorText(), pCtxt);

    // query the database
    ores = dyn.Open(datab, "select sal from emp");
	checkerr(ores, dyn.GetErrorText(), pCtxt);

    // process all the records
    while (!dyn.IsEOF()) // until we?ve gone past all the records
    {
        dyn.GetFieldValue("sal", &cursal);  // get the current salary
		dyn.MoveNext();    // move to the next record

		*pCtxt << _T("<BR>") << _T(cursal); // write output to client
    }


	OShutdown();
	EndContent(pCtxt);
}


///////////////////////////////////////////////////////////////////////
// COO4OExtension checkerr

void COO4OExtension::checkerr(oresult ores, const char *errmsg, CHttpServerContext *pCtxt)
{
	if (ores != OSUCCESS) {
		*pCtxt << "<BR><B>" << errmsg << "</B>";
	}

	return;
}

///////////////////////////////////////////////////////////////////////
// COO4OExtension GetTitle overrides CHttpServer GetTitle
// 

LPCTSTR COO4OExtension::GetTitle() const
{
	return "OO4O Sample ISAPI Extension";
}

// Do not edit the following lines, which are needed by ClassWizard.
#if 0
BEGIN_MESSAGE_MAP(COO4OExtension, CHttpServer)
	//{{AFX_MSG_MAP(COO4OExtension)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()
#endif	// 0


///////////////////////////////////////////////////////////////////////
// COO4OExtension::Execute
//
// Executes and returns the results of a query entered by the user

void COO4OExtension::Query(CHttpServerContext * pCtxt, char query[])
{
	OSession  sess;    // database session object
    ODatabase datab;   // the database object
	ODynaset  dyn;     // dynaset object
    
    double    sum=0.0; // sum of all salaries
    oresult   ores;    // indicates whether operation succeeded	

	OValue    val;
	int		  fieldcount;				

	// Write out the neccessary HTML information
	StartContent(pCtxt);
	WriteTitle(pCtxt);

	// Start OO4O Environment
	OStartup();	

    // open the default (unnamed) session
    ores = sess.Open();
	checkerr(ores, sess.GetErrorText(), pCtxt);
	
	// HTML beautification
	*pCtxt << _T("<BODY BGCOLOR=#FFFFFF><FONT FACE=ARIAL,HELVETICA>");
	*pCtxt << _T("<CENTER><H2>OO4O Test</H2>");

    // connect to the local database
    ores = datab.Open(sess, "exampledb", "scott", "tiger");
	checkerr(ores, sess.GetServerErrorText(), pCtxt);

	// output OO4O version and query string
	*pCtxt << _T("OO4O version ") << _T(sess.GetVersion());
	*pCtxt << _T("<BR><BR> Query: ") << _T(query) << _T("<BR><BR></CENTER>");

    // query the database
    ores = dyn.Open(datab, query);
	checkerr(ores, dyn.GetErrorText(), pCtxt);

	OFieldCollection collection = dyn.GetFields();
	fieldcount = dyn.GetFieldCount();

	// HTML setup table for output
	*pCtxt << _T("<CENTER><TABLE BORDER=1><TR>");

	// output field names
	for (int i=0; i < fieldcount; i++) {
		*pCtxt << _T("<TD><B>") << _T(collection.GetField(i).GetName()) << _T("</TD></B>");
	}
	*pCtxt << _T("</TR>");

    // process all the records
    while (!dyn.IsEOF()) // until we?ve gone past all the records
    {
		// HTML Row
		*pCtxt << _T("<TR>");

		for (int i=0; i < fieldcount; i++) {	
			// output column values	
			dyn.GetFieldValue(i, &val);

			// watch out for nulls
			if ( !val.IsNull() ) {
				*pCtxt << _T("<TD>") << _T((const char *)val) << _T("</TD>");
			} else {
				*pCtxt << _T("<TD></TD>");
			}
		}			
			
		*pCtxt << _T("</TR>");
		dyn.MoveNext();    // move to the next record
    }

	*pCtxt << _T("</TABLE></CENTER>"); 

	OShutdown();
	EndContent(pCtxt);		
}
