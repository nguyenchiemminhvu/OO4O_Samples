/* Copyright (c) Oracle Corporation 2002.  All Rights Reserved */

/*
  DESCRIPTION
      A class to bind OValues.  This allows an OValue to automatically
      track the value of a dynaset field.
  MODIFIED
      kwhitley    10/24/94    Created
*/

#ifndef BOUNDVAL_ORACLE
#define BOUNDVAL_ORACLE

#define OBOUND_READONLY   TRUE
#define OBOUND_READWRITE  FALSE


#ifndef ORACL_ORACLE
#include "oracl.h"
#endif

#ifndef OBOUND_ORACLE
#include "obound.h"
#endif

class OBoundVal : public OBound, public OValue
{ 
public:
	OBoundVal();
   
    // declarations of methods so that compiler won't implement these (which would be wrong)
    // at present we don't implement these either...
    OBoundVal(const OBoundVal &other);  // copy constructor

    oresult SetProperty(BOOL mode=OBOUND_READWRITE);
// Implementation
	virtual ~OBoundVal();
	
private:    
    // routines to implement OBound functionality
    oresult Refresh(const OValue &val);  // database -> bound
    oresult SaveChange(void);  // bound -> database
    BOOL    m_mode;    // readonly/readwrite mode    

public:
    /*
        We must override all the ways that the OValue can have it's
        value changed.  Otherwise the OValue could be changed and the
        OBoundVal would't know about it.
    */
    oresult Clear(void);
    oresult SetValue(int val);     // sets to int value
    oresult SetValue(long val);
    oresult SetValue(double dval); // sets to double value
    oresult SetValue(const char *val); // sets string value (copies text)
    oresult SetValue(const OValue &val);

    // and some overridden operator= for convenience
    OBoundVal &operator=(const OBoundVal &other); // only copies value
    OBoundVal &operator=(const OValue &val);
    OBoundVal &operator=(const int val);    
    OBoundVal &operator=(const long val);    
    OBoundVal &operator=(const double val);    
    OBoundVal &operator=(const char *val);
    
    oresult PreAdd (void);
    oresult PreDelete(void);
	oresult PreMove(void);
	oresult PreQuery(void);
	oresult PreRollback(void);
	oresult PreUpdate(void);

	oresult PostAdd(void);
    oresult PostDelete(void);
	 oresult PostMove(void);
    oresult PostQuery(void);
    oresult PostRollback(void);
    oresult PostUpdate(void);

   	oresult Startup(void);
   	oresult Shutdown(void);
  	
};

#endif // BOUNDVAL_ORACLE
