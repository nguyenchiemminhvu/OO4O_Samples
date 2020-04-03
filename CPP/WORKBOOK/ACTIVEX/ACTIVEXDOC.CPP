// activexDoc.cpp : implementation of the CActivexDoc class
//

#include "stdafx.h"
#include "activex.h"

#include "activexDoc.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CActivexDoc

IMPLEMENT_DYNCREATE(CActivexDoc, CDocument)

BEGIN_MESSAGE_MAP(CActivexDoc, CDocument)
	//{{AFX_MSG_MAP(CActivexDoc)
		// NOTE - the ClassWizard will add and remove mapping macros here.
		//    DO NOT EDIT what you see in these blocks of generated code!
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CActivexDoc construction/destruction

CActivexDoc::CActivexDoc()
{
	// TODO: add one-time construction code here

}

CActivexDoc::~CActivexDoc()
{
}

BOOL CActivexDoc::OnNewDocument()
{
	if (!CDocument::OnNewDocument())
		return FALSE;

	// TODO: add reinitialization code here
	// (SDI documents will reuse this document)

	return TRUE;
}



/////////////////////////////////////////////////////////////////////////////
// CActivexDoc serialization

void CActivexDoc::Serialize(CArchive& ar)
{
	if (ar.IsStoring())
	{
		// TODO: add storing code here
	}
	else
	{
		// TODO: add loading code here
	}
}

/////////////////////////////////////////////////////////////////////////////
// CActivexDoc diagnostics

#ifdef _DEBUG
void CActivexDoc::AssertValid() const
{
	CDocument::AssertValid();
}

void CActivexDoc::Dump(CDumpContext& dc) const
{
	CDocument::Dump(dc);
}
#endif //_DEBUG

/////////////////////////////////////////////////////////////////////////////
// CActivexDoc commands
