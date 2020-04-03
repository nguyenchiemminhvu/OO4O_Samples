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
		
		//Create a referenceable Person object in the
		//server (it is cached on the client)
		ORef newperson(odb, "Person", "PERSON_TAB");
		
		//To update the object we need to aquire a lock
        newperson.Edit();

		//Update the attributes of Person object
        newperson.SetAttrValue("NAME", "John Doe");
		newperson.SetAttrValue("AGE", 55);			
		
		//One of the attributes of Person is an Address object
		//Address is an "embedded object" (non-referenciable).
		OObject newaddr;
		newperson.GetAttrValue("ADDR", &newaddr);
		newaddr.SetAttrValue("CITY", "Las Vegas");
		newaddr.SetAttrValue("ZIP", 89102);

		//Now commit the Person object changes
		newperson.Update();

		//Insert the Person REF into CUSTOMERS
		oresult ores = odyn.AddNewRecord();
		ores = odyn.SetFieldValue("APERSON", newperson);
		ores = odyn.SetFieldValue("ACCOUNT", 60);
		ores = odyn.Update();
	}
 	catch(OException E)
	{
		cout<<E.GetFailedMethodName()<< " Error: "<<E.GetErrorText()<<endl;
	}
	
	return 0;
}
