
//This is a simple program showing how to call oo4o api from a mulithreaded application.
//Note that every thread has its own OStartup() and OShutdown() routines.

// PROJECT SETTINGS : Under C/C++ option, make sure the project options is /MT for release
// or /MTd for debug(NOT /ML or /MLd).


#include "windows.h"
#include "stdio.h"
#include "iostream.h"
#include <process.h>		
#include "oracl.h"

OSession osess ;
int EnqueueRaw();
int EnqueueObject();


int main(int argc, char **argv)
{
	int retVal = 0;
	// create session object for each thread. This gives maximum 
	// concurrency to the thread execution. This is also useful when OO4O
	// error reported on session object for one thread cannot be seen by
	// another thread.
	try
	{
		OStartup(OSTARTUP_MULTITHREADED);
		osess.Open();
		// Enqueue a payload of raw type
		retVal =  EnqueueRaw();
		// Enqueue a payload of a user-defined type
		retVal = EnqueueObject();

		osess.Close();
		OShutdown();
	}
	catch(OException oerr)
	{
		cout << "Exception while enqueuing message : " << oerr.GetErrorText() << endl;
		retVal =  -1;
	}
	return retVal;
}

// This function enqueues a message of default type(string of characters)
//  to the queue.
//  Sets the message attributes and queue attributes before enqueuing
int EnqueueRaw()
{
	ODatabase odb;
	const char *msgid = 0;
	OAQ  oaq;
	OAQMsg oaqmsg;
		
	odb.Open(osess, "ora815", "aq", "AQ");
	if ( ! odb.IsOpen() )
	{ 
		cout <<  "Database not opened: " << odb.GetErrorText() << endl;
		odb.Close();
		return(-1);
	}

	// Open the 'raw_msg_queue'
	oaq.Open(odb,"raw_msg_queue");
	if( !oaq.IsOpen())
	{
		cout <<  "AQ not opened: " << oaq.GetErrorText() << endl;
		return(-1);
	}

	// Get an instance of the default message(of RAW type)
	oaqmsg.Open(oaq);
	if( !oaqmsg.IsOpen() )
	{
		cout <<  "AQMsg not opened: " << oaqmsg.GetErrorText() << endl;
		return(-1);

	}

	// Enqueue the message
	// Set the actual message value
	OValue oval = "My first message through OO4O ClassLibrary";
	oaqmsg.SetValue(oval);
	// Set visibility
	oaq.SetVisibility(OAQ_ENQ_IMMEDIATE);
	msgid = oaq.Enqueue();
	const char *msgval = oval;
	if ( msgid )
		cout <<  "Message : '" << msgval << "' Enqueued Successfully" << endl;
	else
		cout << "Error when enqueuing message : " << oaq.GetErrorText() << endl;

	// Set Message attributes - priority,Correlation identifier etc
	oaqmsg.SetPriority(-6);
	oaqmsg.SetCorrelation("FOR AQ");
	
	// Set the actual message value
	oval = "Another message";
	oaqmsg.SetValue(oval);

	// Set visibility
	oaq.SetVisibility(OAQ_ENQ_IMMEDIATE);
	// Enqueue the message
	msgid = oaq.Enqueue();
	msgval = oval;
	if ( msgid )
		cout <<  "Message : '" << msgval << "' Enqueued Successfully" << endl;
	else
		cout << "Error when enqueuing message : " << oaq.GetErrorText() << endl;

	// Close all of the objects
	oaqmsg.Close();
	oaq.Close();
	odb.Close();
	return 0;

}

// This function enqueues a message of user-defined type MESSAGE_TYPE
// from the msg_queue.
//  Sets the message attributes and queue attributes before enqueuing
int EnqueueObject()
{
	OAQMsg oaqmsg;
	OAQ  oaq;
	ODatabase odb;
	const char *msgid = 0;
	OValue oval;
	char text[255];
		
	odb.Open(osess, "ora815", "scott", "tiger");
	
	if ( ! odb.IsOpen() )
	{ 
		cout <<  "Database not opened: " << odb.GetErrorText() << endl;
		odb.Close();
		return(-1);
	}

	// Open the 'msg_queue'
	oaq.Open(odb,"msg_queue");
	if( !oaq.IsOpen())
	{
		cout <<  "AQ not opened: " << oaq.GetErrorText() << endl;
		return(-1);
	}

	// Get an instance of the udt MESSAGE_TYPE (check out schema for details)
	oaqmsg.Open(oaq,1,"MESSAGE_TYPE");
	if( !oaqmsg.IsOpen() )
	{
		cout <<  "AQMsg not opened: " << oaqmsg.GetErrorText() << endl;
		return(-1);

	}
	// Enqueue a message
	// Set the actual message value
	OObject msgval(odb,"MESSAGE_TYPE");
	msgval.SetAttrValue("SUBJECT", "BUY");	
	msgval.SetAttrValue("text", "ORCL >= 87");
	oval = msgval;
	oaqmsg.SetValue(oval);
	msgval.GetAttrValue("text",text,255);
	// Set visibility
	oaq.SetVisibility(OAQ_ENQ_IMMEDIATE);
	msgid = oaq.Enqueue();
	if ( msgid )
		cout <<  "Message : '" << text << "' Enqueued Successfully" << endl;
	else
		cout << "Error when enqueuing message : " << oaq.GetErrorText() << endl;

	msgid = NULL;
	oval = NULL;
	// Set Message attributes - priority,Correlation identifier etc
	oaqmsg.SetPriority(-6);
	oaqmsg.SetCorrelation("FOR SCOTT");
	
	// Set the actual message value
	msgval.SetAttrValue("subject", "SELL");	
	msgval.SetAttrValue("text", "MSFT < 120");

	oval = msgval;
	oaqmsg.SetValue(oval);

	// Set visibility
	oaq.SetVisibility(OAQ_ENQ_IMMEDIATE);
	// Enqueue a message
	msgid = oaq.Enqueue();
	msgval.GetAttrValue("text",text,255);
	if ( msgid )
		cout <<  "Message : '" << text << "' Enqueued Successfully" << endl;
	else
		cout << "Error when enqueuing message : " << oaq.GetErrorText() << endl;

	// Close all of the objects
	msgid = NULL;
	oval.Clear();
	msgval.Close();
	oaqmsg.Close();
	oaq.Close();
	odb.Close();
	return 0;

}
