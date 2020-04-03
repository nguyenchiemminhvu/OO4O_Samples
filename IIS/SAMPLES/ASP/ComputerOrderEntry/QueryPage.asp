<%@ LANGUAGE="VBSCRIPT" %>

<! This page requires the user to enter the necessary information (e.g computer and personal)		>
<!  information) to order a computer. After filling out the form, the end-user can either submit	>
<!  the information by clicking the "submit" button or can clear the form by clicking the "reset"	>
<!  button.																							>

<! Before this page is served, each combo box (PC Type, Memory, Hard Drive, OS, Payment Type) is	>
<!  filled with dynamic information from SetTypes table in the Oracle database.						>

<! This page is also used after the order has been submitted or in the case when an end-user wants	>
<!  to re-enter the values after seeing them in the COnfirmationPage.asp page (Note: in that case,	>
<!  the previouly entered values will be displayed).												>



<html>
<head>
<meta NAME="GENERATOR" Content="Microsoft FrontPage 3.0">
<meta HTTP-EQUIV="Content-Type" content="text/html; charset=iso-8859-1">
<TITLE>The Online Computer Store</TITLE>
</head>
<body background="./WB00516_1.gif">

<form action="ConfirmationPage.asp" method=post>
<!-- Insert HTML here -->

<%
	' Check if the page is being visited after the order has submitted
	If (Request.Form("UserAction") = "Order") Then
%>		

<p><font face="Garamond" color="#000000"><big><big><big><strong>Placing your Order</strong></big></big></big></font></p>


<%
		' Writing to the CustomerInfo & ComputerInfo tables
		' Put the values into varibles so that SQL statement would not be so long

		Dim hasModem
		Dim hasCDROM
		Dim hasSoundCard
		Dim hasNetworkCard

		If (Request.Form("Modem") = "on") Then hasModem = 1 Else hasModem = 0 End If
		If (Request.Form("CDROM") = "on") Then hasCDROM = 1 Else hasCDROM = 0 End If
		If (Request.Form("SoundCard") = "on") Then hasSoundCard = 1 Else hasSoundCard = 0 End If
		If (Request.Form("NetworkCard") = "on") Then hasNetworkCard = 1     Else hasNetworkCard = 0 End If

		PCType=Request.Form("PCType")
		Memory=Request.Form("Memory")
		HardDrive=Request.Form("HardDrive")
		OS=Request.Form("OS")
		Quantity=Request.Form("Quantity")
		Name=Request.Form("Name")
		LastName=Request.Form("LastName")
		Address=Request.Form("Address")
		Company=Request.Form("Company")
		email=Request.Form("email")
		PaymentType=Request.Form("PaymentType")
		CreditCardNo=Request.Form("CreditCardNo")
		Price=Request.Form("Price") 

		' Get the reference to the OraDatabase object from the pool of connections
		set OraDatabase = OraSession.getDatabaseFromPool(10)
		' Create a dynaset to search if the customer already exists
		set OraDynaset = OraDatabase.CreateDynaset("select customerid from CustomerInfo where name='" & Request.Form("Name") & "' and lastname='" & Request.Form("LastName") & "' ", 0)
		If (OraDynaset.RecordCount = 0) Then
			' We did not find the customer. Add new customer record along with the computer info then 
			OraDatabase.DbExecuteSQL("insert into CustomerInfo (CustomerID, Name, LastName, Address, Company, Email, PaymentType, CreditCardNo) values (CustSeq.nextval, '" & Name & "', '" & LastName & "', '" & Address & "', '" & Company & "', '" & Email & "', '" & PaymentType & "', '" & CreditCardNo & "')")
 			OraDatabase.DbExecuteSQL("insert into ComputerInfo (PCType, Memory, HardDrive, OS, Modem, CDROM, SoundCard, NetworkCard, Quantity, Price, CustomerID) values ('" & PCType & "', '" & Memory & "', '" & HardDrive & "', '" & OS & "', '" & hasModem & "', '" & hasCDROM & "', '" & hasSoundCard & "', '" & hasNetworkCard & "','" & Quantity & "', '" & Price & "', CustSeq.currval)") 
		Else
			' We found the customer just add the computer info by using CustemerID
			OraDatabase.DbExecuteSQL("insert into ComputerInfo (PCType, Memory, HardDrive, OS, Modem, CDROM, SoundCard, NetworkCard, Quantity, Price, CustomerID) values ('" & PCType & "', '" & Memory & "', '" & HardDrive & "', '" & OS & "', '" & hasModem & "', '" & hasCDROM & "', '" & hasSoundCard & "', '" & hasNetworkCard & "','" & Quantity & "', '" & Price & "', '" & OraDynaset.Fields("CustomerID").Value & "')") 
		End If
%>
	

<p><font color="#000000">Your order has been succefully placed.&nbsp;&nbsp; </font></p>

<%
	' No the page is being visited to reenter the values or to enter for the first time
	' Just fill the option boxes w/ PCType, Memory, Hard Drive, OS, and Payment Type info.
	' If the page is being reentered then make sure to default the selected options as before
	ElseIf (Request.Form("UserAction") = "" Or Request.Form("UserAction") = "Re-enter") Then		
		Dim recNum
		' Get the reference to the OraDatabase object from the pool
		set OraDatabase = OraSession.getDatabaseFromPool(10)
		' Create the dynaset to point to PCType info
		set OraDynaset = OraDatabase.CreateDynaset("select Value from SetTypes where Name='PCType'", 0)
		recNum = OraDynaset.RecordCount

%>

<p><font face="Garamond" color="#000000"><big><big><big><strong>The Online Computer Store</strong></big></big></big></font></p>

<p><font color="#000000">&nbsp;&nbsp;&nbsp; <img src="./PE01799A.gif" width="63" height="64"
alt="PE01799A.gif (1627 bytes)"> </font></p>

<p><font color="#000000">To order a computer, please fill out the following information:&nbsp;&nbsp; </font></p>


<table border="1" width="77%" height="508" bordercolor="#008080"
bordercolorlight="#008080">
  <tr>
    <td width="31%" height="43"><strong><font color="#000000">Computer Information</font></strong></td>
    <td width="69%" height="43"></td>
  </tr>
  <tr>
    <td width="31%" height="19"><font color="#000000">PC Type</font></td>
    <td width="69%" height="19"><font color="#000000"><select name="PCType" size="1">
<%  
		' Go thru the rows 	to fill PCType info
		For row = 0 to recNum - 1 
			name = OraDynaset.Fields("Value").Value
		
%>      
	<option <%If name = Request.Form("PCType") Then%> selected<%End If%>><%=name%> 
<%
		OraDynaSet.MoveNext 
		Next 
%> 
    </select></font></td>
  </tr>
<%
		' Retrieve Memory info from Oracle
		set OraDynaset = OraDatabase.CreateDynaset("select Value from SetTypes where Name='Memory'", 0)
		recNum = OraDynaset.RecordCount
%>
  <tr>
    <td width="31%" height="19"><font color="#000000">Memory (MB)</font></td>
    <td width="69%" height="19"><font color="#000000"><select name="Memory" size="1">
<%  
		' Go thru the rows to fill Memory info
		For row1 = 0 to recNum - 1 
			name = OraDynaset.Fields("Value").Value
		
%>      
	<option <%If name = Request.Form("Memory") Then%>selected<%End If%>><%=name%> 
<%
		OraDynaSet.MoveNext 
		Next 
%> 
    </select></font></td>
  </tr>
  
<%
		' Retrieve Hard Drive info  from Oracle
		set OraDynaset = OraDatabase.CreateDynaset("select Value from SetTypes where Name='HardDrive'", 0)
		recNum = OraDynaset.RecordCount
%>
<tr>
    <td width="31%" height="19"><font color="#000000">Hard Drive (GB)</font></td>
    <td width="69%" height="19"><font color="#000000"><select name="HardDrive" size="1">
<%  
		' Go thru the rows to fill Hard Drive info
		For row1 = 0 to recNum - 1 
			name = OraDynaset.Fields("Value").Value
		
%>      
	<option <%If name = Request.Form("HardDrive") Then%>selected<%End If%>><%=name%> 
<%
		OraDynaSet.MoveNext 
		Next 
%> 
 
    </select></font></td>
  </tr>
  
<%
		' Retrieve OS info from Oracle
		set OraDynaset = OraDatabase.CreateDynaset("select Value from SetTypes where Name='OS'", 0)
		recNum = OraDynaset.RecordCount
%>   
  <tr>
    <td width="31%" height="19"><font color="#000000">Operating System</font></td>
    <td width="69%" height="19"><font color="#000000"><select name="OS" size="1">
<%  
		' Go thru the rows to fill OS info
		For row1 = 0 to recNum - 1 
			name = OraDynaset.Fields("Value").Value
%>      
	<option <%If name = Request.Form("OS") Then%>selected<%End If%>><%=name%> 
<%
		OraDynaSet.MoveNext 
		Next 
%> 
    </select></font></td>
  </tr>
  <tr>
    <td width="31%" height="13"><font color="#000000">Modem</font></td>
    <td width="69%" height="13"><font color="#000000">
	
	<input type="checkbox" name="Modem"<% If (Request.Form("Modem") = "on") Then %>
    checked <%End If%>></font></td>
  </tr>
  <tr>
    <td width="31%" height="19"><font color="#000000">CD ROM Drive</font></td>
    <td width="69%" height="19"><font color="#000000">
	<input type="checkbox" name="CDROM"<% If (Request.Form("CDROM") = "on") Then %>
    checked <%End If%>></font></td>
  </tr>
  <tr>
    <td width="31%" height="19"><font color="#000000">Sound Card</font></td>
    <td width="69%" height="19"><font color="#000000">
	<input type="checkbox" name="SoundCard"<% If (Request.Form("SoundCard") = "on") Then %>
    checked <%End If%>></font></td>
  </tr>
  <tr>
    <td width="31%" height="19"><font color="#000000">Network Card</font></td>
    <td width="69%" height="19"><font color="#000000">
	<input type="checkbox" name="NetworkCard"<% If (Request.Form("NetworkCard") = "on") Then %>
    checked <%End If%>></font></td>
  </tr>
  <tr>
    <td width="31%" height="22"><font color="#000000">Quantity</font></td>
    <td width="69%" height="22"><font color="#000000"><input type="text" name="quantity"
    size="6" value="<%=Request.Form("Quantity")%>"></font></td>
  </tr>
  <tr>
    <td width="31%" height="53"><strong><font color="#000000">Personal Information</font></strong></td>
    <td width="69%" height="53"></td>
  </tr>
  <tr>
    <td width="31%" height="19"><font color="#000000">First Name</font></td>
    <td width="69%" height="19"><font color="#000000"><input type="text" name="Name" 
	size="27" value="<%=Request.Form("Name")%>"></font></td>
  </tr>
  <tr>
    <td width="31%" height="19"><font color="#000000">Last Name</font></td>
    <td width="69%" height="19"><font color="#000000"><input type="text" name="LastName"
    size="27" value="<%=Request.Form("LastName")%>"></font></td>
  </tr>
  <tr>
    <td width="31%" height="19"><font color="#000000">Address</font></td>
    <td width="69%" height="19"><font color="#000000"><input type="text" name="Address"
    size="43" value="<%=Request.Form("Address")%>"></font></td>
  </tr>
  <tr>
    <td width="31%" height="19"><font color="#000000">Company</font></td>
    <td width="69%" height="19"><font color="#000000"><input type="text" name="Company"
    size="27" value="<%=Request.Form("Company")%>"></font></td>
  </tr>
  <tr>
    <td width="31%" height="19"><font color="#000000">E-mail Address</font></td>
    <td width="69%" height="19"><font color="#000000"><input type="text" name="email"
    size="27" value="<%=Request.Form("email")%>"></font></td>
  </tr>
<%
		' Retrieve Payment Type info from Oracle
		set OraDynaset = OraDatabase.CreateDynaset("select Value from SetTypes where Name='PaymentType'", 0)
		recNum = OraDynaset.RecordCount
%>
  <tr>
    <td width="31%" height="19"><font color="#000000">Payment Type</font></td>
    <td width="69%" height="19"><font color="#000000"><select name="PaymentType" size="1">
<%  
		' Go thru the rows to fill PaymentType info
		For row1 = 0 to recNum - 1 
			name = OraDynaset.Fields("Value").Value
%>      
	<option <%If name = Request.Form("PaymentType") Then%>selected<%End If%>><%=name%> 
<%
		OraDynaSet.MoveNext 
		Next 
%> 
    </select></font></td>
  </tr>
  <tr>
    <td width="31%" height="19"><font color="#000000">Credit Card Number</font></td>
    <td width="69%" height="19"><font color="#000000"><input type="text" name="CreditCardNo"
    size="27" value="<%=Request.Form("CreditCardNo")%>"></font></td>
  </tr>
</table>

<p align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="reset"  value="Reset" name="Reset">&nbsp;&nbsp;&nbsp;&nbsp; <input
type="submit" value="Submit" name="Submit"></p>

<%
		End If
%>

</form>
		
<p>&nbsp;</p>
</body>
</html>
