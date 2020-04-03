This sample demonstrates the database event publication feature. 

Required Setup:
Run dbevents.sql to setup the appropriate LOGON event trigger and AQ queue that are required to run this demo. The setup script requires an exampledb alias.


Running the sample:
The application subscribes for notification of database LOGON event. When running the sample, you will see a messagebox that confirms successful registration. Click on OK and logon to the database using SQLPlus or some other application.


Note:
You can also refer to the Oracle Database Concepts, section on Triggers on System Events and User Events and also the AQ documention for further information on setting up triggers, etc.