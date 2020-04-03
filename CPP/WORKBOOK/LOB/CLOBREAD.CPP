#include <oracl.h>
#include <iostream.h>
#include <fstream.h>

// Example for OClob::Read
int main()
{

	//Initialize oo4o, connect, execute sql
	OStartup();
	ODatabase odb("ExampleDB", "scott", "tiger");
	ODynaset odyn(odb, "SELECT * FROM PART");

	if (!odyn.IsOpen())
	{	
		cout <<"Connect Error: "<<odb.GetErrorText()<<endl;
		cout <<"SQL Error: "<<odyn.GetErrorText()<<endl;
		return 1;
	}
		
	OClob oclob;
	odyn.GetFieldValue("PART_DESC", &oclob);

	unsigned char *buffer = 0;
	try
	{
		fstream fs;
		fs.open("descout.txt", ios::out);
		fs.setmode(filebuf::binary);

		unsigned long size = oclob.GetSize();
		
		// calculate an optimum buffersize of approximately 32k bytes
		unsigned long optchunk = oclob.GetOptimumChunkSize();		
		unsigned int bufsize = ((int)(32768/optchunk)) *optchunk;
		if (bufsize > size)
			bufsize = size;

		buffer = (unsigned char *)malloc(bufsize);

		//By taking advantage of streaming we get the best performance
		//and do not need to allocate a large buffer
		oclob.EnableStreaming(size);

		short status= OLOB_NEED_DATA;
		unsigned long amtread=0;
		
		while(status == OLOB_NEED_DATA)
		{
			amtread = oclob.Read(&status, buffer, bufsize);		
			fs.write(buffer, amtread);
		}
		
		oclob.DisableStreaming();	
		fs.close();
	}
	catch(OException E)
	{
		cout<<E.GetFailedMethodName()<< " Error: "<<E.GetErrorText()<<endl;
	}

	if (buffer)
		free(buffer);
	
	return 0;
}
