// activexDoc.h : interface of the CActivexDoc class
//
/////////////////////////////////////////////////////////////////////////////

#if !defined(AFX_ACTIVEXDOC_H__BCDA9950_435F_11D2_A1FD_00C04FB6F6CE__INCLUDED_)
#define AFX_ACTIVEXDOC_H__BCDA9950_435F_11D2_A1FD_00C04FB6F6CE__INCLUDED_

#if _MSC_VER >= 1000
#pragma once
#endif // _MSC_VER >= 1000


class CActivexDoc : public CDocument
{
protected: // create from serialization only
	CActivexDoc();
	DECLARE_DYNCREATE(CActivexDoc)

// Attributes
public:

// Operations
public:

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CActivexDoc)
	public:
	virtual BOOL OnNewDocument();
	virtual void Serialize(CArchive& ar);
	//}}AFX_VIRTUAL

// Implementation
public:
	virtual ~CActivexDoc();
#ifdef _DEBUG
	virtual void AssertValid() const;
	virtual void Dump(CDumpContext& dc) const;
#endif

protected:

// Generated message map functions
protected:
	//{{AFX_MSG(CActivexDoc)
		// NOTE - the ClassWizard will add and remove member functions here.
		//    DO NOT EDIT what you see in these blocks of generated code !
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Developer Studio will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_ACTIVEXDOC_H__BCDA9950_435F_11D2_A1FD_00C04FB6F6CE__INCLUDED_)
