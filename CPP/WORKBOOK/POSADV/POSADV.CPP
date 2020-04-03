/* Copyright (c) Oracle Corporation 2002.  All Rights Reserved */

/*
  DESCRIPTION
      position advisory class.  this subclass of OAdvisory will
      keep track of the absolute position within a dynaset
  MODIFIED
      kwhitley    10/18/94    Created
*/

#ifndef POSADV_ORACLE
#include "posadv.h"
#endif

/*
    Please see the Workbook document for a discussion of this class
*/

PosAdvise::PosAdvise(void)
{
    m_position = -1;  // position is not yet defined
}

PosAdvise::~PosAdvise(void)
{
}

long PosAdvise::GetPosition(void) const
{
    return(m_position);
}

oboolean PosAdvise::ActionRequest(int movekind)
{
    // we allow only simple navigation.  otherwise our
    //   bookkeeping might get confused
    
    switch (movekind)
    {
    case OADVISE_MOVE_NEXT:
    case OADVISE_MOVE_PREV:
    case OADVISE_MOVE_FIRST:
    case OADVISE_MOVE_LAST:
        return(TRUE);
    default:
        return(FALSE);
    }
}

void PosAdvise::ActionNotify(int movekind)
{
    // depending on what the action was, calculate
    //   a new position
    switch (movekind)
    {
    case OADVISE_MOVE_NEXT:
        if (m_position != -1)
            m_position++;
        break;
    case OADVISE_MOVE_PREV:
        if (m_position != -1)
            m_position--;
        break;
    case OADVISE_MOVE_FIRST:
        m_position = 0;
        break;
    case OADVISE_MOVE_LAST:
        m_position = GetDynaset.GetRecordCount() - 1;
        break;
    default:
        // no telling where we are now
        m_position = -1;
        break;
    }
    
    return;
}
