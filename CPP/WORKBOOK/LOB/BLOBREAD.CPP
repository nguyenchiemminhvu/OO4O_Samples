#include <oracl.h>
#include <iostream.h>
#include <fstream.h>

// Example for OBlob::Read
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
		
	OBlob oblob;
	odyn.GetFieldValue("PART_IMAGE", &oblob);

	unsigned char *buffer = 0;
	try
	{
		fstream fs;
		fs.open("partout.bmp", ios::out);
		fs.setmode(filebuf::binary);

		unsigned long size = oblob.GetSize();
		
		// calculate an optimum buffersize of approximately 32k bytes
		unsigned long optchunk = oblob.GetOptimumChunkSize();		
		unsigned int bufsize = ((int)(32768/optchunk)) *optchunk;
		if (bufsize > size)
			bufsize = size;

		buffer = (unsigned char *)malloc(bufsize);

		//By taking advantage of streaming we get the best performance
		//and do not need to allocate a large buffer
		oblob.EnableStreaming(size);

		short status= OLOB_NEED_DATA;
		unsigned long amtread=0;
		
		while(status == OLOB_NEED_DATA)
		{
			amtread = oblob.Read(&status, buffer, bufsize);		
			fs.write(buffer, amtread);
		}
		
		oblob.DisableStreaming();	
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
