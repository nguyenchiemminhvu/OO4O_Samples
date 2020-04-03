#include <oracl.h>
#include <iostream.h>

// Example for OParameter, OParamArray Raw example
int main()
{

	//Initialize oo4o, connect, execute sql
	OStartup();
	ODatabase odb("", "scott", "tiger");
	ODynaset odyn(odb, "SELECT * FROM CUSTOMERS");
	if (!odyn.IsOpen())
	{	
		cout <<"Connect Error: "<<odb.GetErrorText()<<endl;
		cout <<"SQL Error: "<<odyn.GetErrorText()<<endl;
		return 1;
	}

	OParameterCollection params = odb.GetParameters();

	//allocate two buffers and set with 'I' for input and 'B' for both
	char *buf1 = (char *)malloc(2000);
	memset(buf1, 'I', 2000);
	char *buf2 = (char *)malloc(2000);
	memset(buf2, 'B', 2000);

	//OParameter Raw example:
	OParameter in = params.Add("in", buf1, 2000, OPARAMETER_INVAR, OTYPE_RAW_BIN);
	OParameter out = params.Add("out", 0, 0, OPARAMETER_OUTVAR, OTYPE_RAW_BIN);
	out.MinimumSize(2000);
	OParameter both = params.Add("both", buf2, 2000, OPARAMETER_INOUTVAR, OTYPE_RAW_BIN);


	oresult r= odb.ExecuteSQL("begin rawtest.scalartest(:in, :out, :both); end;");
	if (r == OFAILURE)
		return 1;

	const char *newbuf = 0;
	int len =0;
	out.GetValue(&newbuf, &len);
	both.GetValue(&newbuf, &len);

	//OParamArray Raw example:
	OParamArray inarray = params.AddTable("inarray", OPARAMETER_INVAR, OTYPE_RAW_BIN, 3, 2000);
	OParamArray outarray = params.AddTable("outarray", OPARAMETER_OUTVAR, OTYPE_RAW_BIN, 3, 2000);
	OParamArray botharray = params.AddTable("botharray", OPARAMETER_INOUTVAR, OTYPE_RAW_BIN, 3, 2000);

	for (int index = 0;index <3; index++)
	{
		inarray.SetValue(buf1, 2000, index);
		botharray.SetValue(buf2, 2000, index);
	}

	r= odb.ExecuteSQL("begin rawtest.arraytest(:inarray, :outarray, :botharray); end;");
	if (r == OFAILURE)
		return 1;

	for (index = 0;index <3; index++)
	{
		outarray.GetValue(&newbuf, &len, index);
		botharray.GetValue(&newbuf, &len, index);
	}

	free(buf1);
	free(buf2);
	return 0;
}