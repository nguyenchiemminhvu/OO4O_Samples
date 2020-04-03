// vsdept2.h : main header file for the VSDEPT2 application
//

#ifndef __AFXWIN_H__
	#error include 'stdafx.h' before including this file for PCH
#endif

#include "resource.h"       // main symbols

/////////////////////////////////////////////////////////////////////////////
// CVsdept2App:
// See vsdept2.cpp for the implementation of this class
//

class CVsdept2App : public CWinApp
{
public:
	CVsdept2App();
	~CVsdept2App();

// Overrides
	virtual BOOL InitInstance();

// Implementation

	//{{AFX_MSG(CVsdept2App)
	afx_msg void OnAppAbout();
		// NOTE - the ClassWizard will add and remove member functions here.
		//    DO NOT EDIT what you see in these blocks of generated code !
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};


/////////////////////////////////////////////////////////////////////////////
