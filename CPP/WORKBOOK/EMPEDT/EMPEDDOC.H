// empeddoc.h : interface of the CEmpedtDoc class
//
/////////////////////////////////////////////////////////////////////////////

class CEmpedtDoc : public CDocument
{
protected: // create from serialization only
	CEmpedtDoc();
	DECLARE_DYNCREATE(CEmpedtDoc)

// Attributes
public:
// Operations
public:

// Implementation
public:
	virtual ~CEmpedtDoc();
	virtual void Serialize(CArchive& ar);   // overridden for document i/o
#ifdef _DEBUG
	virtual void AssertValid() const;
	virtual void Dump(CDumpContext& dc) const;
#endif

protected:
	virtual BOOL OnNewDocument();

// Generated message map functions
protected:
	//{{AFX_MSG(CEmpedtDoc)
		// NOTE - the ClassWizard will add and remove member functions here.
		//    DO NOT EDIT what you see in these blocks of generated code !
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

/////////////////////////////////////////////////////////////////////////////
