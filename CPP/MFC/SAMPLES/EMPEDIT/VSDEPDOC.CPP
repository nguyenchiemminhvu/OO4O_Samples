// vsdepdoc.cpp : implementation of the CVsdept2Doc class
//

#include "stdafx.h"
#include "vsdept2.h"

#include "vsdepdoc.h"

#ifdef _DEBUG
#undef THIS_FILE
static char BASED_CODE THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CVsdept2Doc

IMPLEMENT_DYNCREATE(CVsdept2Doc, CDocument)

BEGIN_MESSAGE_MAP(CVsdept2Doc, CDocument)
	//{{AFX_MSG_MAP(CVsdept2Doc)
		// NOTE - the ClassWizard will add and remove mapping macros here.
		//    DO NOT EDIT what you see in these blocks of generated code!
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CVsdept2Doc construction/destruction

CVsdept2Doc::CVsdept2Doc()
{
	// TODO: add one-time construction code here
}

CVsdept2Doc::~CVsdept2Doc()
{
}

BOOL CVsdept2Doc::OnNewDocument()
{
	if (!CDocument::OnNewDocument())
		return FALSE;

	// TODO: add reinitialization code here
	// (SDI documents will reuse this document)

	return TRUE;
}

/////////////////////////////////////////////////////////////////////////////
// CVsdept2Doc serialization

void CVsdept2Doc::Serialize(CArchive& ar)
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
// CVsdept2Doc diagnostics

#ifdef _DEBUG
void CVsdept2Doc::AssertValid() const
{
	CDocument::AssertValid();
}

void CVsdept2Doc::Dump(CDumpContext& dc) const
{
	CDocument::Dump(dc);
}
#endif //_DEBUG

/////////////////////////////////////////////////////////////////////////////
// CVsdept2Doc commands
