/* Copyright (c) Oracle Corporation 2002.  All Rights Reserved */

/*
  DESCRIPTION
		A class to bind OValues.  This allows an OValue to automatically
      track the value of a dynaset field.
  MODIFIED
      kwhitley    10/24/94    Created
      RWOOLARD	MODIFIED	03/20/95
    			bug#	262749	Changed returns oresult and not oboolean
*/

#ifdef _MSC_VER
#include <afxwin.h>         // MFC core and standard components
#include <afxext.h>         // MFC extensions (including VB)
#endif

#include "windows.h"

#ifndef BOUNDVAL_ORACLE 
#include "boundval.h"
#endif

OBoundVal::OBoundVal()
{
   m_mode = OBOUND_READWRITE;
}

OBoundVal::~OBoundVal()
{
}

oresult OBoundVal::SetProperty(BOOL mode/* =OBOUND_READWRITE */)
{
    m_mode = mode;    
    return OSUCCESS;
}

oresult OBoundVal::Refresh(const OValue &val)
{
    OValue::operator=(val);  // use OValue assignment to get new value
    
    return(OSUCCESS);
}

oresult OBoundVal::SaveChange(void)
{
    return(OBound::SetValue(*this));
}

oresult OBoundVal::Clear(void)
{ 
// BUG# 262749
    if (m_mode == OBOUND_READONLY || Changed() != OSUCCESS)
        return(OFAILURE); // couldn't start change
    OValue::Clear();
    
    return(OSUCCESS);
}

oresult OBoundVal::SetValue(int val) 
{
// BUG# 262749
    if (m_mode == OBOUND_READONLY || Changed() != OSUCCESS)
        return(OFAILURE); // couldn't start change
    OValue::SetValue(val);
    return(OSUCCESS);
}

oresult OBoundVal::SetValue(long val)
{
// BUG# 262749
    if (m_mode == OBOUND_READONLY || Changed() != OSUCCESS)
        return(OFAILURE); // couldn't start change
    OValue::SetValue(val);
    return(OSUCCESS);
}

oresult OBoundVal::SetValue(double val)
{
// BUG# 262749
    if (m_mode == OBOUND_READONLY || Changed() != OSUCCESS)
        return(OFAILURE); // couldn't start change
    OValue::SetValue(val);
    return(OSUCCESS);
}

oresult OBoundVal::SetValue(const char *val)
{
// BUG# 262749
    if (m_mode == OBOUND_READONLY || Changed() != OSUCCESS)
        return(OFAILURE); // couldn't start change
    OValue::SetValue(val);
    return(OSUCCESS);
}

oresult OBoundVal::SetValue(const OValue &val)
{
// BUG# 262749
    if (m_mode == OBOUND_READONLY || Changed() != OSUCCESS)
        return(OFAILURE); // couldn't start change
    OValue::operator=(val);
    return(OSUCCESS);
}

OBoundVal &OBoundVal::operator=(const OBoundVal &other)
{
    if (&other == this)
        return(*this); // self assignment - do nothing

// BUG# 262749
    if (m_mode == OBOUND_READWRITE && Changed() == OSUCCESS)
    { // we are able to change the value
        OValue::operator=(other); // just copy the value
    }
    return(*this);    
}

OBoundVal &OBoundVal::operator=(const OValue &val)
{
// BUG# 262749
    if (m_mode == OBOUND_READWRITE && Changed() == OSUCCESS)
    { // we are able to change the value
        OValue::operator=(val);
    }
    return(*this);
}
    
OBoundVal &OBoundVal::operator=(const int val)    
{
    SetValue(val);  // if we can't StartEdit on dynaset, this does nothing
    return(*this);
}
    
OBoundVal &OBoundVal::operator=(const long val)    
{
    SetValue(val);  // if we can't StartEdit on dynaset, this does nothing
    return(*this);
}
    
OBoundVal &OBoundVal::operator=(const double val)    
{
    SetValue(val);  // if we can't StartEdit on dynaset, this does nothing
    return(*this);
}
    
OBoundVal &OBoundVal::operator=(const char *val)
{
    SetValue(val);  // if we can't StartEdit on dynaset, this does nothing
    return(*this);
}
   
oresult OBoundVal::Startup ()
{
	return OSUCCESS;
}
oresult OBoundVal::PreQuery ()
{
	return OSUCCESS;
}
oresult OBoundVal::PostQuery ()
{
	return RefreshBound();
}
oresult OBoundVal::PreMove ()
{
	return OSUCCESS;
}
oresult OBoundVal::PostMove ()
{
	return RefreshBound();
}
oresult OBoundVal::PreAdd ()
{
	return RefreshBound();
}
oresult OBoundVal::PostAdd ()
{
	return OSUCCESS;
}
oresult OBoundVal::PreUpdate ()
{
	return OSUCCESS;
}
oresult OBoundVal::PostUpdate ()
{
	return OSUCCESS;
}
oresult OBoundVal::PreDelete ()
{
	return OSUCCESS;
}
oresult OBoundVal::PostDelete ()
{
	return OSUCCESS;
}
oresult OBoundVal::PreRollback ()
{
	return OSUCCESS;
}
oresult OBoundVal::PostRollback ()
{
	return RefreshBound();
}
oresult OBoundVal::Shutdown ()
{
	return OSUCCESS;
}