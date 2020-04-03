// empedvw.cpp : implementation of the CEmpedtView class
//

#include "stdafx.h"
#include "empedt.h"

#include "empeddoc.h"
#include "empedvw.h"

// symbols for Oracle class library
#ifndef ORACL_ORACLE
#include "oracl.h"
#endif

// symbols for connection dialog
#ifndef LOGDLG_ORACLE
#include "logdlg.h"
#endif

#ifdef _DEBUG
#undef THIS_FILE
static char BASED_CODE THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CEmpedtView

IMPLEMENT_DYNCREATE(CEmpedtView, CFormView)

BEGIN_MESSAGE_MAP(CEmpedtView, CFormView)
	//{{AFX_MSG_MAP(CEmpedtView)
	ON_BN_CLICKED(IDC_FIRST, OnFirst)
	ON_BN_CLICKED(IDC_LAST, OnLast)
	ON_BN_CLICKED(IDC_NEXT, OnNext)
	ON_BN_CLICKED(IDC_PREV, OnPrev)
	ON_BN_CLICKED(IDC_ADDNEW, OnAddnew)
	ON_BN_CLICKED(IDC_DUPLICATE, OnDuplicate)
	ON_BN_CLICKED(IDC_DELETE, OnDelete)
	ON_BN_CLICKED(IDC_CONNECT, OnConnect)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CEmpedtView construction/destruction

CEmpedtView::CEmpedtView()
	: CFormView(CEmpedtView::IDD)
{
	//{{AFX_DATA_INIT(CEmpedtView)
		// NOTE: the ClassWizard will add member initialization here
	//}}AFX_DATA_INIT
	// TODO: add construction code here
}

CEmpedtView::~CEmpedtView()
{
}

void CEmpedtView::DoDataExchange(CDataExchange* pDX)
{
	CFormView::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CEmpedtView)
		// NOTE: the ClassWizard will add DDX and DDV calls here
	//}}AFX_DATA_MAP
}

/////////////////////////////////////////////////////////////////////////////
// CEmpedtView diagnostics

#ifdef _DEBUG
void CEmpedtView::AssertValid() const
{
	CFormView::AssertValid();
}

void CEmpedtView::Dump(CDumpContext& dc) const
{
	CFormView::Dump(dc);
}

CEmpedtDoc* CEmpedtView::GetDocument() // non-debug version is inline
{
	ASSERT(m_pDocument->IsKindOf(RUNTIME_CLASS(CEmpedtDoc)));
	return (CEmpedtDoc*)m_pDocument;
}
#endif //_DEBUG

/////////////////////////////////////////////////////////////////////////////
// CEmpedtView message handlers

void CEmpedtView::OnFirst()
{
	if (m_empblock.MoveFirst() != OSUCCESS)
        HandleError();	
}

void CEmpedtView::OnLast()
{
	if (m_empblock.MoveLast() != OSUCCESS)
        HandleError();	
}

void CEmpedtView::OnNext()
{
	if (m_empblock.MoveNext() != OSUCCESS)
        HandleError();	
}

void CEmpedtView::OnPrev()
{
	if (m_empblock.MovePrev() != OSUCCESS)
        HandleError();	
}

void CEmpedtView::OnAddnew()
{
    if (m_empblock.AddNewRecord() != OSUCCESS)
        HandleError();
}

void CEmpedtView::OnDuplicate()
{
    if (m_empblock.DuplicateRecord() != OSUCCESS)
        HandleError();
}

void CEmpedtView::OnDelete()
{
    if (m_empblock.DeleteRecord() != OSUCCESS)
        HandleError();
}

void CEmpedtView::OnConnect()
{
    // get the default session
    OSession defsess(0);
    
    if (!defsess.IsOpen())
    { // couldn't get default session?  Class library isn't working
        AfxMessageBox("Can't start Oracle class library");
        return;
    }
    
	// get an ODatabase object via the connection dialog
	logdlg connd;
	
	// get a database object
	ODatabase odb = connd.GetLogin(ODATABASE_PARTIAL_INSERT | ODATABASE_EDIT_NOWAIT);
	if (!odb.IsOpen())
	{ // didn't get a connection - user must have cancelled
	    return;
	}
	
	// we have a valid connection
	
	// enable all the dynaset buttons
    GetDlgItem(IDC_FIRST)->EnableWindow(TRUE);
    GetDlgItem(IDC_PREV)->EnableWindow(TRUE);
    GetDlgItem(IDC_NEXT)->EnableWindow(TRUE);
    GetDlgItem(IDC_LAST)->EnableWindow(TRUE);
    GetDlgItem(IDC_ADDNEW)->EnableWindow(TRUE);
    GetDlgItem(IDC_DUPLICATE)->EnableWindow(TRUE);
    GetDlgItem(IDC_DELETE)->EnableWindow(TRUE);
    
    // disable the connection button
    GetDlgItem(IDC_CONNECT)->EnableWindow(FALSE);
	
	
	// now set up the bound edit controls
	
	// bind each control to the binder object
	//   when we do this we specify which OBinder the control is bound to
	//   (which implies what dynaset - what records) and the field the
	//   control is bound to.
	m_ename.BindToBinder(&m_empblock, "ename");
	m_empno.BindToBinder(&m_empblock, "empno");
	m_sal.BindToBinder(&m_empblock, "sal");
	m_comm.BindToBinder(&m_empblock, "comm");
	m_job.BindToBinder(&m_empblock, "job");
	m_mgr.BindToBinder(&m_empblock, "mgr");
	m_hiredate.BindToBinder(&m_empblock, "hiredate");
	m_deptno.BindToBinder(&m_empblock, "deptno");
	
	// and we need to tell each bound control what widget it is attached to
	m_ename.BindToControl(this, IDC_ENAME);
	m_empno.BindToControl(this, IDC_EMPNO);
	m_sal.BindToControl(this, IDC_SAL);
	m_comm.BindToControl(this, IDC_COMM);
	m_job.BindToControl(this, IDC_JOB);
	m_mgr.BindToControl(this, IDC_MANAGER);
	m_hiredate.BindToControl(this, IDC_HIREDATE);
	m_deptno.BindToControl(this, IDC_DEPTNO);
	
	// hand a context to the empno edit control
	m_empno.GiveContext((void *) this);
	
	// and start up the managed dynaset
	oresult ores;
	ores = m_empblock.Open(odb, "select * from emp order by empno");
	
	// check for error
	if (ores != OSUCCESS)
	{ // we couldn't open the dynaset
	    const char *msg;
	    if (defsess.ServerErrorNumber() != 0)
	    { // we have a server error - tell the user that
	        msg = defsess.GetServerErrorText();
	    }
	    else
	    { // no server error - the class library isn't working correctly
	        msg = "Class library error when opening dynaset.";
	    }
	    
	    // give the user a message
	    AfxMessageBox(msg);
	} 
	
	return;
}

void CEmpedtView::HandleError(void)
{
    // there has been an error in an OBinder operation
    //     inform the user
    const char *msg; // message for user
    
    // most likely there is a server error
    
    // get the session
    OSession errsess = m_empblock.GetDatabase().GetSession(); 
    
    // get the server error
    long serr = errsess.ServerErrorNumber();
    if (serr != 0)
    {
        msg = errsess.GetServerErrorText();
    }
    else
    { // not a server error.  the class library detected a problem
        // get the class library error
        long cerr = m_empblock.GetDynaset().ErrorNumber();
        
        if (cerr == OERROR_TEMPFILE || cerr == OERROR_NOBUFMEM || cerr == OERROR_MEMORY)
            msg = "Out of system resources.";
        else if (cerr == OERROR_NOUPDATES)
            msg = "No updates allowed on this table.";
        else
        { // some other error
            msg = "Internal operation error.";
        }
    }
    
    // tell the user
    AfxMessageBox(msg);
    
    return;
}

//////////////////////////////////////// OBoundEmpnoEdit ///////////////////////////

// routine that is called when a new record is added

oresult OBoundEmpnoEdit::PostAdd(void)
{
    // get the current maximum employee id
    ODynaset iddyn(GetDatabase(), "select max(empno) from emp");
    int maxempno;
    iddyn.GetFieldValue(0, &maxempno);
    
    // set the value of the field to the maximum + 1
    // note that we can pass SetValue an integer expression because it expects
    //   an OValue and OValue has an integer constructor
    SetValue(maxempno+1);
    
    // finish up by calling parent's PostAdd method
    return(OBoundEdit::PostAdd());
}

// stash the context we're handed
//   note that we're not doing any memory management on the context
void OBoundEmpnoEdit::GiveContext(void *ctxp)
{
    m_ctxp = ctxp;
}

//////////////////////////////////////// OBinderEmp ///////////////////////////

void OBinderEmp::OnChangedError(void)
{
    // call the parent class routine
    OBinder::OnChangedError();
    
    // there is an error while processing a change message
    const char *msg;
    
    // get the error
    //  NOTE: this won't work if OBinder::OnChangedError wasn't called first!
    long serr; // server error
    long cerr; // class library error
    if (!GetChangedError(&serr, &cerr))
        return;  // there wasn't really an error
    
    // if there is a server error, that is the problem
    if (serr != 0)
        msg = GetDatabase().GetSession().GetServerErrorText();
    else
    { // no server error?  The class library detected a problem
        // the most likely is that the database data has been changed
        //     since we got our copy of the data
        if (cerr == OERROR_DATACHANGE)
            msg = "The data has changed in the database.";
        else
        { // some general error in the class library
          // may be out of memory, out of temp file space, some bug somewhere,...
            msg = "Internal error.";
        }
    }
    
    // tell the user
    AfxMessageBox(msg);

    return;         
}
                          