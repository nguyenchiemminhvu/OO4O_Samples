// empeddoc.cpp : implementation of the CEmpedtDoc class
//

#include "stdafx.h"
#include "empedt.h"

#include "empeddoc.h"

#ifdef _DEBUG
#undef THIS_FILE
static char BASED_CODE THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CEmpedtDoc

IMPLEMENT_DYNCREATE(CEmpedtDoc, CDocument)

BEGIN_MESSAGE_MAP(CEmpedtDoc, CDocument)
	//{{AFX_MSG_MAP(CEmpedtDoc)
		// NOTE - the ClassWizard will add and remove mapping macros here.
		//    DO NOT EDIT what you see in these blocks of generated code!
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CEmpedtDoc construction/destruction

CEmpedtDoc::CEmpedtDoc()
{
	// TODO: add one-time construction code here
}

CEmpedtDoc::~CEmpedtDoc()
{
}

BOOL CEmpedtDoc::OnNewDocument()
{
	if (!CDocument::OnNewDocument())
		return FALSE;

	// TODO: add reinitialization code here
	// (SDI documents will reuse this document)

	return TRUE;
}

/////////////////////////////////////////////////////////////////////////////
// CEmpedtDoc serialization

void CEmpedtDoc::Serialize(CArchive& ar)
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
// CEmpedtDoc diagnostics

#ifdef _DEBUG
void CEmpedtDoc::AssertValid() const
{
	CDocument::AssertValid();
}

void CEmpedtDoc::Dump(CDumpContext& dc) const
{
	CDocument::Dump(dc);
}
#endif //_DEBUG

/////////////////////////////////////////////////////////////////////////////
// CEmpedtDoc commands
