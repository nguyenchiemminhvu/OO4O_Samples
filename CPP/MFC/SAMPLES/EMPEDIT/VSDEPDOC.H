// vsdepdoc.h : interface of the CVsdept2Doc class
//
/////////////////////////////////////////////////////////////////////////////

class CVsdept2Doc : public CDocument
{
protected: // create from serialization only
	CVsdept2Doc();
	DECLARE_DYNCREATE(CVsdept2Doc)

// Attributes
public:
// Operations
public:

// Implementation
public:
	virtual ~CVsdept2Doc();
	virtual void Serialize(CArchive& ar);   // overridden for document i/o
#ifdef _DEBUG
	virtual void AssertValid() const;
	virtual void Dump(CDumpContext& dc) const;
#endif

protected:
	virtual BOOL OnNewDocument();

// Generated message map functions
protected:
	//{{AFX_MSG(CVsdept2Doc)
		// NOTE - the ClassWizard will add and remove member functions here.
		//    DO NOT EDIT what you see in these blocks of generated code !
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

/////////////////////////////////////////////////////////////////////////////
