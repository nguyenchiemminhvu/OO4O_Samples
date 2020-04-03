#include <iostream.h>
#include "oracl.h"

// recursively disply all attributes belong to a OMetaData
void RecursiveDescribe(const char *name, OMetaData *pOMD)
{
	OMDAttribute pOMDAttr;
	OMetaData pOMD1;

	int count = pOMD->GetCount();

	for (int i = 0; i<count; i++) {
		pOMDAttr = pOMD->GetAttribute(i);
		// If an attribute can be described furthure, describe it, otherwise dump its attribute name & value
		if (pOMDAttr.IsMDObject()) {
			pOMD1 = pOMDAttr.GetValue();
			RecursiveDescribe(pOMDAttr.GetName(), &pOMD1);
		} else {
			cout << name << "->" << pOMDAttr.GetName() << " = " << (const char *)pOMDAttr.GetValue() << endl;
		}
	}
}

int main()
{
	// Initialize the C++ Class Library before use. 
	// Usually initialization is done at the beginning of the program.
	OStartup();

	// Construct a database, obtaining a database connection:
	ODatabase  odb("ExampleDB", "scott", "tiger");
	// The Odatabase object (odb) allows you to connect to a database
	// ("ExampleDB") along with other connection information, and so sets 
	// you up to execute SQL statements.

	// Using Describe() method of ODatabase, we can get metadata info 
	// for a schema object
	OMetaData omd = odb.Describe("emp");

	/* OMetaData can be also constructed as the following. 
	OMetaData omd;
	omd.Open(odb, "emp");
	*/
	// Call a simple method to get the metadata type, see help file 
	// for all possible types.
	cout << "EMP is of the type " << omd.GetType() << endl;

	// Call simple methods to retrieve an attribute name and value 
	cout << "EMP's first attribute: " << omd.GetAttrName(0) << " = " << (const char *)omd.GetAttrValue(0) << endl;

	cout << endl;

	// The following dumps out all metadata information
	RecursiveDescribe("emp", &omd);

	// Uninitialize the C++ Class Library when you are finished with it.
	// Usually uninitialization is done at the end of the program.

	//OShutdown();

	return 0;
}