#include <oracl.h>
#include <iostream.h>
#include <fstream.h>

// Example for OBlob::Write
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
		
	//prior to modifying a lob for the first time, 
	//we must first insert an Empty lob and then commit
	OValue val;
	val.SetEmpty();
	odyn.AddNewRecord();
	oresult ores = odyn.SetFieldValue((const char *)"PART_IMAGE", val);
	ores = odyn.Update();

	OBlob oblob;
	odyn.StartEdit();
	odyn.GetFieldValue("PART_IMAGE", &oblob);

	unsigned char *buffer = 0;
	try
	{				
		// calculate an optimum buffersize of approximately 32k bytes
		unsigned long optchunk = oblob.GetOptimumChunkSize();		
		unsigned int bufsize = ((int)(32768/optchunk)) *optchunk;
		buffer = (unsigned char *)malloc(bufsize);

		//open file and get file size
		fstream fs;
		fs.open("C:\\Oracle\\Ora81\\Oo4o\\Cpp\\Workbook\\Lob\\partimage.bmp", ios::in);
		fs.setmode(filebuf::binary);
		fs.seekg(0, ios::end);
		unsigned long filesize = fs.tellg();
		fs.seekg(0, ios::beg);
		
		unsigned long totalwritten = 0;
		unsigned long amtread = 0;
		int piecetype = OLOB_FIRST_PIECE;
	
		//By taking advantage of streaming we get the best performance
		//and we don't need to allocate a huge buffer.
		if (filesize <= bufsize)
			piecetype = OLOB_ONE_PIECE;
		else			
			oblob.EnableStreaming(filesize);

		while(totalwritten != filesize)
		{
			fs.read(buffer, bufsize);
			amtread = fs.gcount();

			oblob.Write(buffer, amtread, piecetype);		
			totalwritten = totalwritten + amtread;
						
			if ((filesize - totalwritten)<=bufsize)
				piecetype = OLOB_LAST_PIECE;
			else 
				piecetype = OLOB_NEXT_PIECE;
		}
		
		oblob.DisableStreaming();
		ores = odyn.Update();
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
