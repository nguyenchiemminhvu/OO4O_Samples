/* Copyright (c) Oracle Corporation 2002.  All Rights Reserved */

/*
  DESCRIPTION
      position advisory class.  this subclass of OAdvisory will
      keep track of the absolute position within a dynaset
  MODIFIED
      kwhitley    10/18/94    Created
*/

#ifndef POSADV_ORACLE
#define POSADV_ORACLE

#ifndef ORACL_ORACLE
#include "oracl.h"
#endif

//--------------------------------------------------------------------
// our advise subclass (needed for AdviseTest)
class PosAdvise : public OAdvise
{
public:
    PosAdvise(void);
    ~PosAdvise(void);
    
    // to find out the dynaset position
    long GetPosition(void) const;
    
    // to be called by the class library machinery
    oboolean ActionRequest(int movekind);  // returns TRUE if action is allowed, FALSE to cancel
    void ActionNotify(int movekind); 
    
private:
    long m_position;
};




#endif // POSADV
