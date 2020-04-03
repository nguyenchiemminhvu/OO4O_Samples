// vsdepvw.h : interface of the CVsdept2View class
//
/////////////////////////////////////////////////////////////////////////////

#ifndef ORACL_ORACLE
#include "oracl.h"
#endif

#ifndef OMFC_ORACLE
#include "omfc.h"
#endif 

#ifndef OBOUND_ORACLE
#include "OBound.h"
#endif

// subclass OBinder for employee block so that we are notified on navigation
class OBinderEmp : public OBinder
{
public:
    oresult PostMove(void);  // trigger fired after record motion
    oresult PostAdd(void);

    void SetDept(OBinder *deptbinder, ODatabase *db) {m_deptbinder = deptbinder; m_database = db;}
private:
    OBinder *m_deptbinder;
    ODatabase *m_database;
};

class CVsdept2View : public CFormView
{
protected: // create from serialization only
        CVsdept2View();
        DECLARE_DYNCREATE(CVsdept2View)

public:
        //{{AFX_DATA(CVsdept2View)
        enum { IDD = IDD_VSDEPT2_FORM };
        //}}AFX_DATA

// Attributes
public:
        CVsdept2Doc* GetDocument();

// Operations
public:

// Implementation
public:
        virtual ~CVsdept2View();
#ifdef _DEBUG
        virtual void AssertValid() const;
        virtual void Dump(CDumpContext& dc) const;
#endif

protected:
        virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
    virtual void OnInitialUpdate(void);

// Generated message map functions
protected:
        //{{AFX_MSG(CVsdept2View)
        afx_msg void OnDbconnect();
        afx_msg void OnMfirst();
        afx_msg void OnMlast();
        afx_msg void OnMnext();
        afx_msg void OnMprev();
        afx_msg void OnBookmark();
        afx_msg void OnTomark();
        afx_msg void OnAddnew();
        afx_msg void OnDelete();
        afx_msg void OnCommit();
        afx_msg void OnRollback();
	//}}AFX_MSG
        DECLARE_MESSAGE_MAP()

private:
    OSession m_session;
    ODatabase m_database;
    ODynaset m_dynaset_emp;
    ODynasetMark m_mark;
    OBinderEmp  m_empbinder;
    OBinder     m_deptbinder;
    OBoundEdit m_ename;
    OBoundEdit m_sal;
    OBoundEdit m_mgr;
    OBoundEdit m_hiredate;
    OBoundEdit m_dname;
    OBoundEdit m_deptno;
    OBoundEdit m_dloc;
    OBoundStatic m_static;
    OBoundCheckBox m_checkbox1;
    OBoundCheckBox m_checkbox2;
    OBoundGroupButton m_groupbuttonh;
    OBoundGroupButton m_groupbuttonl;
    OBoundSlider m_sliderw;
    OBoundSlider m_sliderr;
    OBoundEdit m_editreadonly;
    unsigned char m_havedata;

    // void RefreshScreen(void);
};

#ifndef _DEBUG  // debug version in vsdepvw.cpp
inline CVsdept2Doc* CVsdept2View::GetDocument()
   { return (CVsdept2Doc*)m_pDocument; }
#endif

/////////////////////////////////////////////////////////////////////////////
