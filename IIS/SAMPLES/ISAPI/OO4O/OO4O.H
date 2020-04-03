#if !defined(AFX_OO4O_H__1F801E81_F7CB_11D0_A39E_00C04FB9D939__INCLUDED_)
#define AFX_OO4O_H__1F801E81_F7CB_11D0_A39E_00C04FB9D939__INCLUDED_

// OO4O.H - Header file for your Internet Server
//    OO4O Extension

#include "resource.h"
#include "oracl.h"

class COO4OExtension : public CHttpServer
{
public:
	void Query(CHttpServerContext *pCtxt, char query[]);
	
	COO4OExtension();
	~COO4OExtension();

// Overrides
	// ClassWizard generated virtual function overrides
		// NOTE - the ClassWizard will add and remove member functions here.
		//    DO NOT EDIT what you see in these blocks of generated code !
	//{{AFX_VIRTUAL(COO4OExtension)
	public:
	virtual BOOL GetExtensionVersion(HSE_VERSION_INFO* pVer);
	//}}AFX_VIRTUAL

	// TODO: Add handlers for your commands here.
	// For example:

	void Default(CHttpServerContext* pCtxt);
	void checkerr(oresult, const char*, CHttpServerContext*);
	
	DECLARE_PARSE_MAP()

	//{{AFX_MSG(COO4OExtension)
	//}}AFX_MSG
private:
	LPCTSTR GetTitle( ) const;
};


//{{AFX_INSERT_LOCATION}}
// Microsoft Developer Studio will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_OO4O_H__1F801E81_F7CB_11D0_A39E_00C04FB9D939__INCLUDED)
