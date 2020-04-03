#if !defined(AFX_ORAGATE_H__8B84881A_FFB6_11D0_A3AB_00C04FB9D939__INCLUDED_)
#define AFX_ORAGATE_H__8B84881A_FFB6_11D0_A3AB_00C04FB9D939__INCLUDED_

// ORAGATE.H - Header file for your Internet Server
//    oragate Extension

#include "resource.h"
#include "oracl.h"

#define SIZE_OF_POOL	5
#define TIMEOUT			10000

class COragateExtension : public CHttpServer
{
public:
	COragateExtension();
	~COragateExtension();

	OSession	sess;
	ODatabase	datab[SIZE_OF_POOL];

	HANDLE		pLock;	// pool synchronization
	HANDLE		cLock;	// connection counter and synchronization

	int			pool[SIZE_OF_POOL];  // bitmap of pool connections

// Overrides
	// ClassWizard generated virtual function overrides
		// NOTE - the ClassWizard will add and remove member functions here.
		//    DO NOT EDIT what you see in these blocks of generated code !
	//{{AFX_VIRTUAL(COragateExtension)
	public:
	virtual BOOL GetExtensionVersion(HSE_VERSION_INFO* pVer);
	//}}AFX_VIRTUAL

	// TODO: Add handlers for your commands here.
	// For example:

	void Default(CHttpServerContext* pCtxt);

	DECLARE_PARSE_MAP()

	//{{AFX_MSG(COragateExtension)
	//}}AFX_MSG
protected:
	int ReleaseConnection(int CID);
	int FindOpenConnection();
private:
	void checkerr(oresult ores, const char *errmsg, CHttpServerContext *pCtxt);
};


//{{AFX_INSERT_LOCATION}}
// Microsoft Developer Studio will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_ORAGATE_H__8B84881A_FFB6_11D0_A3AB_00C04FB9D939__INCLUDED)
