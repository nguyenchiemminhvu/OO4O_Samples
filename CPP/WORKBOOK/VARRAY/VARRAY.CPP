#include <oracl.h>
#include <iostream.h>
#include <fstream.h>

// Example for OCollection (VARRAY)
int main()
{

	//Initialize oo4o, connect, execute sql
	OStartup();
	ODatabase odb("ExampleDB", "scott", "tiger");
	ODynaset odyn(odb, "SELECT * FROM DEPARTMENT");

	if (!odyn.IsOpen())
	{	
		cout <<"Connect Error: "<<odb.GetErrorText()<<endl;
		cout <<"SQL Error: "<<odyn.GetErrorText()<<endl;
		return 1;
	}
		

	try
	{	
		//The OCollection object points to the current row. 
		//We get it one time, then each time a MoveNext occurs,
		//it reflects the change in row automatically.

		OCollection ocoll;
		oresult ores = odyn.GetFieldValue("ENAMES", &ocoll);

		while (!odyn.IsEOF())
		{
			char deptname[16];
			char varrayelem[31];

			//get the department name field and print it
			ores = odyn.GetFieldValue("NAME", deptname, 16);
			cout<<""<<endl;
			cout<<deptname<<endl;
			cout<<"---------------"<<endl;

			// print out each of the elements in the VARRAY
			int collsize = ocoll.GetSize();
			for (int i = 1; i<=collsize; i++)
			{
				ocoll.GetValue(i, varrayelem, 31);
				cout<<varrayelem<<endl;
			}
			odyn.MoveNext();

		}

		//Now we will do the same thing, except using an
		//iterator which is faster than using an index
		odyn.MoveFirst();
		ocoll.CreateIterator();

		while (!odyn.IsEOF())
		{
			char deptname[16];
			char varrayelem[31];

			//get the department name field and print it
			ores = odyn.GetFieldValue("NAME", deptname, 16);
			cout<<""<<endl;
			cout<<deptname<<endl;
			cout<<"---------------"<<endl;

			ocoll.InitIterator();

			//The iterator starts at BOC (the position before the
			//first position), so we must move to the next position
			ocoll.IterNext();
			while (!ocoll.EOC())
			{
				ocoll.GetCurrIterValue(varrayelem, 31);
				cout<<varrayelem<<endl;
				ocoll.IterNext();
			}
			odyn.MoveNext();
		}
	}
	catch(OException E)
	{
		cout<<E.GetFailedMethodName()<< " Error: "<<E.GetErrorText()<<endl;
	}
	
	return 0;
}
