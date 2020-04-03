/* Copyright (c) Oracle Corporation 1994.  All Rights Reserved */

/*
  DESCRIPTION
      database login class.  This class allows a caller to obtain
      an ODatabase object which represents a connection to a database
  MODIFIED
      kwhitley    10/04/94    Created
*/

#ifndef LOGDLG_ORACLE
#define LOGDLG_ORACLE

#ifndef ORACL_ORACLE
#include "oracl.h"
#endif

/////////////////////////////////////////////////////////////////////////////
// logdlg dialog 

class logdlg : public CDialog // subclass of a dialog
{
public:
    // Construction
    logdlg(CWnd* pParent = NULL);	// standard constructor

    // get a database login
    ODatabase GetLogin(long options = ODATABASE_DEFAULT);

private:
    OSession  m_session;      // our handle to the default session
    ODatabase m_database;     // our handle to the database object
                              //   that we're trying to create
    long      m_options;      // the database options we want to use to open the database
    
    
//// dialog implementation


// Dialog Data
	//{{AFX_DATA(logdlg)
	enum { IDD = IDD_LOGIND };
		// NOTE: the ClassWizard will add data members here
	//}}AFX_DATA

// Implementation
protected:
	virtual void DoDataExchange(CDataExchange* pDX);	// DDX/DDV support

	// Generated message map functions
	//{{AFX_MSG(logdlg)
	virtual void OnOK();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

#endif // LOGDLG_ORACLE
