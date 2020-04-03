// activexView.h : interface of the CActivexView class
//
/////////////////////////////////////////////////////////////////////////////

#if !defined(AFX_ACTIVEXVIEW_H__BCDA9952_435F_11D2_A1FD_00C04FB6F6CE__INCLUDED_)
#define AFX_ACTIVEXVIEW_H__BCDA9952_435F_11D2_A1FD_00C04FB6F6CE__INCLUDED_

#if _MSC_VER >= 1000
#pragma once
#endif // _MSC_VER >= 1000

class CActivexView : public CFormView
{
protected: // create from serialization only
	CActivexView();
	DECLARE_DYNCREATE(CActivexView)

public:
	//{{AFX_DATA(CActivexView)
	enum{ IDD = IDD_ACTIVEX_FORM };
		// NOTE: the ClassWizard will add data members here
	//}}AFX_DATA

// Attributes
public:
	CActivexDoc* GetDocument();

// Operations
public:

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CActivexView)
	public:
	virtual BOOL PreCreateWindow(CREATESTRUCT& cs);
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	virtual BOOL OnPreparePrinting(CPrintInfo* pInfo);
	virtual void OnBeginPrinting(CDC* pDC, CPrintInfo* pInfo);
	virtual void OnEndPrinting(CDC* pDC, CPrintInfo* pInfo);
	virtual void OnPrint(CDC* pDC, CPrintInfo*);
	//}}AFX_VIRTUAL

// Implementation
public:
	virtual ~CActivexView();
#ifdef _DEBUG
	virtual void AssertValid() const;
	virtual void Dump(CDumpContext& dc) const;
#endif

protected:

// Generated message map functions
protected:
	//{{AFX_MSG(CActivexView)
		// NOTE - the ClassWizard will add and remove member functions here.
		//    DO NOT EDIT what you see in these blocks of generated code !
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

#ifndef _DEBUG  // debug version in activexView.cpp
inline CActivexDoc* CActivexView::GetDocument()
   { return (CActivexDoc*)m_pDocument; }
#endif

/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Developer Studio will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_ACTIVEXVIEW_H__BCDA9952_435F_11D2_A1FD_00C04FB6F6CE__INCLUDED_)
