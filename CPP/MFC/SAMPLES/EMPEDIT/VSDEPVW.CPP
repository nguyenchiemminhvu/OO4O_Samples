// vsdepvw.cpp : implementation of the CVsdept2View class
//

#include "stdafx.h"
#include "vsdept2.h"

#include "vsdepdoc.h"
#include "vsdepvw.h"

#ifndef ORACL_ORACLE
#include "oracl.h"
#endif

#ifndef OMFC_ORACLE
#include "omfc.h"
#endif

#ifdef _DEBUG
#undef THIS_FILE
static char BASED_CODE THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CVsdept2View

IMPLEMENT_DYNCREATE(CVsdept2View, CFormView)

BEGIN_MESSAGE_MAP(CVsdept2View, CFormView)
        //{{AFX_MSG_MAP(CVsdept2View)
        ON_BN_CLICKED(IDC_DBCONNECT, OnDbconnect)
        ON_BN_CLICKED(IDC_MFIRST, OnMfirst)
        ON_BN_CLICKED(IDC_MLAST, OnMlast)
        ON_BN_CLICKED(IDC_MNEXT, OnMnext)
        ON_BN_CLICKED(IDC_MPREV, OnMprev)
        ON_BN_CLICKED(IDC_BOOKMARK, OnBookmark)
        ON_BN_CLICKED(IDC_TOMARK, OnTomark)
        ON_BN_CLICKED(IDC_ADDNEW, OnAddnew)
        ON_BN_CLICKED(IDC_DELETE, OnDelete)
        ON_BN_CLICKED(IDC_COMMIT, OnCommit)
        ON_BN_CLICKED(IDC_ROLLBACK, OnRollback)
        //}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CVsdept2View construction/destruction

CVsdept2View::CVsdept2View()
        : CFormView(CVsdept2View::IDD)
{
        //{{AFX_DATA_INIT(CVsdept2View)
        //}}AFX_DATA_INIT
        // TODO: add construction code here

        m_havedata = FALSE; // no data yet
        return;
}

CVsdept2View::~CVsdept2View()
{
;
}

void CVsdept2View::DoDataExchange(CDataExchange* pDX)
{
        CFormView::DoDataExchange(pDX);
        //{{AFX_DATA_MAP(CVsdept2View)
        //}}AFX_DATA_MAP
}

/////////////////////////////////////////////////////////////////////////////
// CVsdept2View diagnostics

#ifdef _DEBUG
void CVsdept2View::AssertValid() const
{
        CFormView::AssertValid();
}

void CVsdept2View::Dump(CDumpContext& dc) const
{
        CFormView::Dump(dc);
}

CVsdept2Doc* CVsdept2View::GetDocument() // non-debug version is inline
{
        ASSERT(m_pDocument->IsKindOf(RUNTIME_CLASS(CVsdept2Doc)));
        return (CVsdept2Doc*)m_pDocument;
}
#endif //_DEBUG

/////////////////////////////////////////////////////////////////////////////
// CVsdept2View message handlers

void CVsdept2View::OnDbconnect()
{
        CString db;
        CString conn;

        GetDlgItem(IDC_DATABASE)->GetWindowText(db);
        GetDlgItem(IDC_CONNECT)->GetWindowText(conn);

        // open a database object
    m_database.Open((const char *) db, (const char *) conn, 0);

    // set up for employees

    // set up the block on the employee dynaset
    m_empbinder.Open(m_database, "select ename, empno, mgr, sal, hiredate, deptno, vacation, hobby, comm from emp2");
    m_dynaset_emp = m_empbinder.GetDynaset();
    m_empbinder.SetDept(&m_deptbinder, &m_database);

    // we also want a session object
    m_session = m_dynaset_emp.GetSession();
    m_session.BeginTransaction();   // sql*plus transactional model

    // if (!err.oleerr)
        m_havedata = TRUE;


    // attach bound textedits to block
    m_ename.BindToBinder(&m_empbinder, "ename");
    m_sal.BindToBinder(&m_empbinder, "sal");
    m_mgr.BindToBinder(&m_empbinder, "mgr");
    m_hiredate.BindToBinder(&m_empbinder, "hiredate");

    // static, checkbox
    m_static.BindToBinder(&m_empbinder, "ename");
    m_checkbox1.BindToBinder(&m_empbinder, "vacation");
    m_checkbox2.BindToBinder(&m_empbinder, "vacation");

    // sliders
    m_sliderw.BindToBinder(&m_empbinder, "comm");
    m_sliderr.BindToBinder(&m_empbinder, "comm");

    // group butons
    m_groupbuttonh.BindToBinder(&m_empbinder, "hobby");
    m_empbinder.Refresh();  // give all objects their values

    // set up for department
    m_deptbinder.Open(m_database, 0);  // we only set the database now

    m_dname.BindToBinder(&m_deptbinder, "dname");
    m_deptno.BindToBinder(&m_deptbinder, "deptno");
    m_dloc.BindToBinder(&m_deptbinder, "loc");

    // group buttons
    m_groupbuttonl.BindToBinder(&m_deptbinder, "loc");

    m_empbinder.PostMove();  // to get the department block refreshed

    return;
}

void CVsdept2View::OnMfirst()
{
        m_empbinder.MoveFirst();
    return;
}

void CVsdept2View::OnMlast()
{
        m_empbinder.MoveLast();
    return;
}

void CVsdept2View::OnMnext()
{
        m_empbinder.MoveNext();

    return;
}

void CVsdept2View::OnMprev()
{
        m_empbinder.MovePrev();
    return;
}

void CVsdept2View::OnBookmark()
{
    m_mark = m_dynaset_emp.GetMark();
        return;
}

void CVsdept2View::OnTomark()
{
    m_dynaset_emp.MoveToMark(m_mark);
    return;
}

//------------------
oresult OBinderEmp::PostMove(void)
{
    // refresh the dept block
    CString sqls = "select * from dept where deptno = ";
    OValue deptno;

    GetDynaset().GetFieldValue("deptno", &deptno);
    const char *cp = (const char *) deptno;
    //sqls += (const char *) deptno;
    sqls += cp;

    m_deptbinder->SetSQL((const char *) sqls );
    m_deptbinder->RefreshQuery();

    return(OSUCCESS);
}

static long myempno = 6001;

oresult OBinderEmp::PostAdd(void)
{
    // set values for empno and deptno
    OValue var = 50L;
    ODynaset dyn = GetDynaset();
    dyn.SetFieldValue("deptno", var);
    var = myempno++;
    dyn.SetFieldValue("empno", var);

    return(OSUCCESS);
}

void CVsdept2View::OnAddnew()
{
        m_empbinder.AddNewRecord();

}

void CVsdept2View::OnDelete()
{
        m_empbinder.DeleteRecord();

    return;
}

void CVsdept2View::OnCommit()
{
        m_session.Commit(TRUE);
    return;
}

void CVsdept2View::OnRollback()
{
        m_session.Rollback(TRUE);
    return;
}

// jdday
void CVsdept2View::OnInitialUpdate()
{

    // TODO: Add your specialized creation code here
    // set up ename and sal bound textedits
    m_ename.BindToControl(this, IDC_ENAME);
    m_ename.SetProperty(OBOUND_READONLY);
    
    m_sal.BindToControl(this, IDC_ESAL);
    
    m_mgr.BindToControl(this, IDC_EMGR);
    
    m_hiredate.BindToControl(this, IDC_EHIREDATE);

    // set up for department
    m_dname.BindToControl(this, IDC_DNAME);
    m_dname.SetProperty(OBOUND_READONLY);
    
    m_deptno.BindToControl(this, IDC_DEPTNO);
    m_deptno.SetProperty(OBOUND_READONLY);
    
    m_dloc.BindToControl(this, IDC_DLOC);
    m_dloc.SetProperty(OBOUND_READONLY);

    // set up staic bound control
    m_static.BindToControl(this, IDC_STATICBOUND);

    // set up checkbox bound control
    OValue onvalue((int)1);
    OValue offvalue((int)0);

    m_checkbox1.BindToControl(this, IDC_CHECKBOX1);
    m_checkbox1.SetProperty(onvalue, offvalue);
    
    m_checkbox2.BindToControl(this, IDC_CHECKBOX2);
    m_checkbox2.SetProperty(onvalue, offvalue, OBOUND_READONLY);

    // set up groupbutton (readwrite)
    OValue hvalue1((const char*)"Fishing");
    OValue hvalue2((const char*)"Swimming");
    OValue hvalue3((const char*)"Windsurfing");
    OValue hvalue4((const char*)"Shopping");
    OValue hvalue5((const char*)"Bowling");

    m_groupbuttonh.BindToControl(this, IDC_HRADIO1);
    m_groupbuttonh.SetProperty(IDC_HRADIO1, hvalue1);
    
    m_groupbuttonh.BindToControl(this, IDC_HRADIO2);
    m_groupbuttonh.SetProperty(IDC_HRADIO2, hvalue2);
    
    m_groupbuttonh.BindToControl(this, IDC_HRADIO3);
    m_groupbuttonh.SetProperty(IDC_HRADIO3, hvalue3);
    
    m_groupbuttonh.BindToControl(this, IDC_HRADIO4);
    m_groupbuttonh.SetProperty(IDC_HRADIO4, hvalue4);
    
    m_groupbuttonh.BindToControl(this, IDC_HRADIO5);
    m_groupbuttonh.SetProperty(IDC_HRADIO5, hvalue5);

    // set up groupbutton (readonly)
    OValue value1((const char*)"NEW YORK");
    OValue value2((const char*)"DALLAS");
    OValue value3((const char*)"CHICAGO");
    OValue value4((const char*)"BOSTON");

    m_groupbuttonl.BindToControl(this, IDC_RADIO1);
    m_groupbuttonl.SetProperty(IDC_RADIO1, value1, OBOUND_READONLY);  // the first radio button always
                                                                      // decides readwrite/readonly
    m_groupbuttonl.BindToControl(this, IDC_RADIO2);
    m_groupbuttonl.SetProperty(IDC_RADIO2, value2);
    
    m_groupbuttonl.BindToControl(this, IDC_RADIO3);
    m_groupbuttonl.SetProperty(IDC_RADIO3, value3);
    
    m_groupbuttonl.BindToControl(this, IDC_RADIO4);
    m_groupbuttonl.SetProperty(IDC_RADIO4, value4);   
                                                                      
    // set up slider (readwrite)
    OValue minvalue1((int)0);
    OValue maxvalue1((int)2000);
    m_sliderw.BindToControl(this, IDC_SCROLLBARW, IDC_SSTATICW);
    m_sliderw.SetProperty(minvalue1, maxvalue1);
    
    // set up slider (readonly)
    OValue minvalue2((int)0);
    OValue maxvalue2((int)2000);
    m_sliderr.BindToControl(this, IDC_SCROLLBARR, IDC_SSTATICR);
    m_sliderr.SetProperty(minvalue2, maxvalue2, OBOUND_READONLY);
    
}

