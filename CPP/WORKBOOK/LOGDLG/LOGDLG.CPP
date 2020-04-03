/* Copyright (c) Oracle Corporation 2002.  All Rights Reserved */

/*
    Sample database login dialog
    
    implements the logdlg class
    
*/

#include "stdafx.h"  // standard header for MFC
#include "resource.h" // get resource ids
#include "logdlg.h"  // header for this module

#ifdef _DEBUG
#undef THIS_FILE
static char BASED_CODE THIS_FILE[] = __FILE__;
#endif

// utility function
static void ErrorMessage(const char *msg)
{
    AfxMessageBox(msg);
}

/////////////////////////////////////////////////////////////////////////////
// logdlg dialog


logdlg::logdlg(CWnd* pParent /*=NULL*/)
	: CDialog(logdlg::IDD, pParent)
{
	//{{AFX_DATA_INIT(logdlg)
		// NOTE: the ClassWizard will add member initialization here
	//}}AFX_DATA_INIT
}

void logdlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(logdlg)
		// NOTE: the ClassWizard will add DDX and DDV calls here
	//}}AFX_DATA_MAP
}

BEGIN_MESSAGE_MAP(logdlg, CDialog)
	//{{AFX_MSG_MAP(logdlg)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()


// Get the database connection
ODatabase logdlg::GetLogin(long dboptions)
{ 
    // open the session object as the default (unnamed) session
    if (!m_session.IsOpen())
    {
        if (m_session.Open() != OSUCCESS)
        {
            ErrorMessage("Couldn't get session");
            return(m_database);  // return of unopened ODatabase indicates error
        }
    }
    
    // remember the options we want to use to open the database
    m_options = dboptions;
    
    // run the dialog
    DoModal();
    
    // either OK worked (opened the database) or the user pressed cancel.  In either
    //  case we just have to hand back the database object, opened or not
    return(m_database);
}

/////////////////////////////////////////////////////////////////////////////
// logdlg message handlers

void logdlg::OnOK()
{
	CString dbname;   // database name string
	CString user;     // user name string
	CString password; // password string
	
	// get the strings the user has entered
	GetDlgItem(IDC_USERNAME)->GetWindowText(user);
	GetDlgItem(IDC_PASSWORD)->GetWindowText(password);
	GetDlgItem(IDC_DATABASE)->GetWindowText(dbname);
	
	// try to open the database
	if (m_database.Open(m_session, dbname, user, password, m_options) != OSUCCESS)
	{ // some error
           // get the oracle error number
	    long oraerr = m_session.ServerErrorNumber();

           // get the oracle error message, to display to the user
	    const char *dberrs = m_session.GetServerErrorText();
	    ErrorMessage(dberrs); // tell user what went wrong
	}
	else
	{
	    // we're done - get out of the dialog	
	    CDialog::OnOK();
	} 
	
	return;
}
