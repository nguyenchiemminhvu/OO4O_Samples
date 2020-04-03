#include <oracl.h>
#include <iostream.h>
#include <fstream.h>

// Example for ORef and OObject
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
		

	try
	{	
			
		//Outputing the contents of the CUSTOMERS table.
		ORef person;	
		OObject addr;

		odyn.MoveFirst();
		
		//The ORef and OObject objects obtained from the dynaset
		//always point to the current row. 
		//We get them this one time, then each time we MoveNext,
		//they reflect the change in row automatically.
		oresult ores = odyn.GetFieldValue("APERSON", &person);
		if (ores != OSUCCESS)
			return 1;

		person.GetAttrValue("ADDR", &addr);
		
		while (!odyn.IsEOF())
		{
			char account[30];
			char name[21];
			char age[30];
			char city[21];
			char zip[11];

			//get the department name field and print it
			ores = odyn.GetFieldValue("ACCOUNT", account, 30);
			if (ores != OSUCCESS)
				return 1;
			person.GetAttrValue("Name", name, 21);
			person.GetAttrValue("AGE", age, 30);
			addr.GetAttrValue("CITY", city, 21);
			addr.GetAttrValue("ZIP", zip, 11);

			cout<<"--------------------"<<endl;
			cout<<"Account: "<<account<<endl;
			cout<<"Name: "<<name<<endl;
			cout<<"Age: "<<age<<endl;
			cout<<city<<" "<<zip<<endl;

			cout<<"--------------------"<<endl;
			odyn.MoveNext();
		} 
		
	}
 	catch(OException E)
	{
		cout<<E.GetFailedMethodName()<< " Error: "<<E.GetErrorText()<<endl;
	}
	
	return 0;
}
