// activex.h : main header file for the ACTIVEX application
//

#if !defined(AFX_ACTIVEX_H__BCDA9948_435F_11D2_A1FD_00C04FB6F6CE__INCLUDED_)
#define AFX_ACTIVEX_H__BCDA9948_435F_11D2_A1FD_00C04FB6F6CE__INCLUDED_

#if _MSC_VER >= 1000
#pragma once
#endif // _MSC_VER >= 1000

#ifndef __AFXWIN_H__
	#error include 'stdafx.h' before including this file for PCH
#endif

#include "resource.h"       // main symbols

/////////////////////////////////////////////////////////////////////////////
// CActivexApp:
// See activex.cpp for the implementation of this class
//

class CActivexApp : public CWinApp
{
public:
	CActivexApp();

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CActivexApp)
	public:
	virtual BOOL InitInstance();
	//}}AFX_VIRTUAL

// Implementation

	//{{AFX_MSG(CActivexApp)
	afx_msg void OnAppAbout();
		// NOTE - the ClassWizard will add and remove member functions here.
		//    DO NOT EDIT what you see in these blocks of generated code !
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};


/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Developer Studio will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_ACTIVEX_H__BCDA9948_435F_11D2_A1FD_00C04FB6F6CE__INCLUDED_)
