# Create SetTypes table to be used to fill UI option boxes

 create table SetTypes (Name varchar2(15), Value varchar2(30), Price number);

# Fill the table with resonable values
# Insert PCType info to SetTypes table

 insert into SetTypes (Name, Value, Price) values ('PCType', 'Pentium 66MHz', 230);
 insert into SetTypes (Name, Value, Price) values ('PCType', 'Pentium 90MHz', 280);
 insert into SetTypes (Name, Value, Price) values ('PCType', 'Pentium 100MHz', 300);
 insert into SetTypes (Name, Value, Price) values ('PCType', 'Pentium 120MHz', 340);
 insert into SetTypes (Name, Value, Price) values ('PCType', 'Pentium 133MHz', 380);
 insert into SetTypes (Name, Value, Price) values ('PCType', 'Pentium 166MHz', 450);
 insert into SetTypes (Name, Value, Price) values ('PCType', 'Pentium Pro 180MHz', 500);
 insert into SetTypes (Name, Value, Price) values ('PCType', 'Pentium Pro 200MHz', 600);
 insert into SetTypes (Name, Value, Price) values ('PCType', 'Pentium Pro 233MHz', 800);
 insert into SetTypes (Name, Value, Price) values ('PCType', 'Pentium Pro II 180MHz', 950);
 insert into SetTypes (Name, Value, Price) values ('PCType', 'Pentium Pro II 200MHz', 1140);
 insert into SetTypes (Name, Value, Price) values ('PCType', 'Pentium Pro II 233MHz', 1530);

# Insert Memory info to SetTypes table

 insert into SetTypes (Name, Value, Price) values ('Memory', '8', 45);
 insert into SetTypes (Name, Value, Price) values ('Memory', '16', 90);
 insert into SetTypes (Name, Value, Price) values ('Memory', '20', 135);
 insert into SetTypes (Name, Value, Price) values ('Memory', '24', 150);
 insert into SetTypes (Name, Value, Price) values ('Memory', '32', 170);
 insert into SetTypes (Name, Value, Price) values ('Memory', '48', 280);
 insert into SetTypes (Name, Value, Price) values ('Memory', '64', 320);
 insert into SetTypes (Name, Value, Price) values ('Memory', '96', 530);
 insert into SetTypes (Name, Value, Price) values ('Memory', '128', 610);

# insert HardDrive info to SetTypes table

 insert into SetTypes (Name, Value, Price) values ('HardDrive','2.1', 200);
 insert into SetTypes (Name, Value, Price) values ('HardDrive','2.5', 230);
 insert into SetTypes (Name, Value, Price) values ('HardDrive','3.6', 280);
 insert into SetTypes (Name, Value, Price) values ('HardDrive','4.2', 330);
 insert into SetTypes (Name, Value, Price) values ('HardDrive','6.1', 500);
 insert into SetTypes (Name, Value, Price) values ('HardDrive','9.0', 700);

# Insert OS info to SetTypes table

 insert into SetTypes (Name, Value, Price) values ('OS','Windows 3.11', 50);
 insert into SetTypes (Name, Value, Price) values ('OS','Windows 95', 80);
 insert into SetTypes (Name, Value, Price) values ('OS','Windows 98', 95);
 insert into SetTypes (Name, Value, Price) values ('OS','Windows NT 3.51', 120);
 insert into SetTypes (Name, Value, Price) values ('OS','Windows NT 4.0', 350);
 insert into SetTypes (Name, Value, Price) values ('OS','Windows NT 5.0', 500);
 insert into SetTypes (Name, Value, Price) values ('OS','IBM OS 3.0', 45);

# Insert PaymentType info to SetTypes table

 insert into SetTypes (Name, Value, Price) values ('PaymentType','VISA', null);
 insert into SetTypes (Name, Value, Price) values ('PaymentType','Master Card', null);
 insert into SetTypes (Name, Value, Price) values ('PaymentType','American Express', null);

# Create ComputerInfo table

 create table ComputerInfo (PCType varchar2(25), Memory varchar2(4),
 HardDrive varchar2(4), OS varchar2(20), Modem number, CDROM number,
 SoundCard number, NetworkCard number, Quantity number, Price number,
 CustomerID number);

# create CustomerInfo table

 create table CustomerInfo (CustomerID number primary key, Name varchar2(15), 
 LastName varchar2(20), Address varchar2(75), Company varchar2(40), 
 Email varchar2(40), PaymentType varchar2(20), CreditCardNo varchar2(20));


# create Sequence for unique customer id

 create sequence CustSeq increment by 1;