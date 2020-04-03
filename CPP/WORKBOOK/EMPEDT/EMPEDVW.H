// empedvw.h : interface of the CEmpedtView class
//
/////////////////////////////////////////////////////////////////////////////

#ifndef ORACL_ORACLE
#include "oracl.h"
#endif

#ifndef OBOUND_ORACLE
#include "obound.h"
#endif

#ifndef OMFC_ORACLE
#include "omfc.h"
#endif

// a class to provide special behavior for the empno edit control
class OBoundEmpnoEdit : public OBoundEdit
{
public:
    void GiveContext(void *contextp);
private:
    oresult PostAdd(void);  //override the OBound::PostAdd method
    
    void *m_ctxp;  // our context pointer
};

// override OBinder's OnChangedError so we can get error message to user
class OBinderEmp : public OBinder
{
protected:
    void OnChangedError(void);
};

class CEmpedtView : public CFormView
{
protected: // create from serialization only
	CEmpedtView();
	DECLARE_DYNCREATE(CEmpedtView)

public:
	//{{AFX_DATA(CEmpedtView)
	enum{ IDD = IDD_EMPEDT_FORM };
		// NOTE: the ClassWizard will add data members here
	//}}AFX_DATA

// Attributes
public:
	CEmpedtDoc* GetDocument();

// Operations
public:

// Implementation
public:
	virtual ~CEmpedtView();
#ifdef _DEBUG
	virtual void AssertValid() const;
	virtual void Dump(CDumpContext& dc) const;
#endif

protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support

// Generated message map functions
protected:
	//{{AFX_MSG(CEmpedtView)
	afx_msg void OnFirst();
	afx_msg void OnLast();
	afx_msg void OnNext();
	afx_msg void OnPrev();
	afx_msg void OnAddnew();
	afx_msg void OnDuplicate();
	afx_msg void OnDelete();
	afx_msg void OnConnect();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()

private:
    OBinderEmp     m_empblock;  // managed emp dynaset
    
    // bound edit controls
    OBoundEdit  m_ename;
    OBoundEmpnoEdit  m_empno;
    OBoundEdit  m_sal;
    OBoundEdit  m_comm;
    OBoundEdit  m_job;
    OBoundEdit  m_mgr;
    OBoundEdit  m_hiredate;
    OBoundEdit  m_deptno;
    
    // error handling routine
    void HandleError(void);
};

#ifndef _DEBUG  // debug version in empedvw.cpp
inline CEmpedtDoc* CEmpedtView::GetDocument()
   { return (CEmpedtDoc*)m_pDocument; }
#endif

/////////////////////////////////////////////////////////////////////////////
