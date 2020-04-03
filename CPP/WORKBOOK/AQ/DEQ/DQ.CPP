//This is a simple program showing how to call oo4o api from a mulithreaded application.
//Note that every thread has its own OStartup() and OShutdown() routines.

// PROJECT SETTINGS : Under C/C++ option, make sure the project options is /MT for release
// or /MTd for debug(NOT /ML or /MLd).


#include "windows.h"
#include "stdio.h"
#include "iostream.h"
#include <process.h>		
#include <oracl.h>

OSession osess ;
int DequeueRaw();
int DequeueObject();

int main(int argc, char **argv)
{
	int retVal = 0;

	OStartup(OSTARTUP_MULTITHREADED);
	// create session object for each thread. This gives maximum 
	// concurrency to the thread execution. This is also useful when OO4O
	// error reported on session object for one thread cannot be seen by
	// another thread.
	try
	{
		osess.Open();
		
		if ( ! osess.IsOpen() )
		{
			cout <<  "Session not opened: Error: " << osess.GetErrorText() << endl;
			
			osess.Close();
			OShutdown();
			return -1;
		}
		retVal =  DequeueRaw();
		retVal = DequeueObject();
	}
	catch(OException oerr)
	{
		cout << "Exception while dequeuing message : " << oerr.GetErrorText() << endl;
		retVal =  -1;
	}
	return retVal;
}

// This function dequeues a message of default type(string of characters)
//  from the raw_msg_queue.
//  Gets the message priority after dequeuing
// Checks if any message with correlation like 'AQ' is available on the queue.
int DequeueRaw()
{
	ODatabase odb;
	OAQ  oaq;
	OAQMsg oaqmsg;
	OValue msg;
	const char *msgid = 0;

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

	// Dequeue a message 
	msgid = oaq.Dequeue();
	if (msgid )
	{
		// Retrieve the message attributes
		oaqmsg.GetValue(&msg);
		const char *msgval = msg;
		cout << "Message '" << msgval <<
			"' dequeued at priority : " << oaqmsg.GetPriority() << endl;
	}
	
	// Dequeue message with correlation like "AQ"
	oaq.SetCorrelate("%AQ%");
	oaq.SetDequeueMode(3);
	msgid = oaq.Dequeue();
	if (msgid )
	{
		// Retrieve the message attributes
		char msgval[101];
		long len = oaqmsg.GetValue(msgval,100);
		msgval[len] = '\0';
		cout << "Message '" << msgval <<
			"' dequeued at priority : " << oaqmsg.GetPriority() << endl;
	}

	// Close all of the objects
	oaqmsg.Close();
	oaq.Close();
	odb.Close();
	return 0;
}

// This function dequeues a message of user-defined type MESSAGE_TYPE
// from the msg_queue.
// Gets the message priority after dequeuing
// Checks if any message with correlation like 'SCOTT' is available on the queue.
int DequeueObject()
{
	ODatabase odb;
	OAQ  oaq;
	OAQMsg oaqmsg;
	const char *msgid = 0;
	OValue msg;
	char subject[255];
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

	// Dequeue message with correlation like "SCOTT"
	oaq.SetCorrelate("%SCOTT%");
	oaq.SetDequeueMode(3);
	msgid = oaq.Dequeue();
	if (msgid )
	{
		// Retrieve the message attributes
		// Get the subject,text attributes of the message
		OObject msgval;
		oaqmsg.GetValue(&msgval);
		msgval.GetAttrValue("subject", subject,255);	
		msgval.GetAttrValue("text", text,255);

		cout << "Message '" << (subject ? subject :"") << "' & Body : '" << text <<
			"' dequeued at priority : " << oaqmsg.GetPriority() << endl;
		msgval.Close();
	}

	msgid = 0;
	oaq.SetNavigation(1);
	oaq.SetCorrelate("");

	// Dequeue a message 
	msgid = oaq.Dequeue();
	if (msgid )
	{
		// Retrieve the message attributes
		OObject msgval;
		oaqmsg.GetValue(&msg);
		msgval = msg;		
		// Get the subject,text attributes of the message
		msgval.GetAttrValue("subject", subject,255);	
		msgval.GetAttrValue("text", text,255);

		cout << "Message '" << (subject ? subject :"") << "' & Body : '" << text <<
			"' dequeued at priority : " << oaqmsg.GetPriority() << endl;
		msgval.Close();
	}
	

	// Close all of the objects
	msgid = NULL;
	msg.Clear();
	oaqmsg.Close();
	oaq.Close();
	odb.Close();
	return 0;

}
