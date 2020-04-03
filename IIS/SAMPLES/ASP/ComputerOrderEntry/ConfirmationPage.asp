<%@ LANGUAGE="VBSCRIPT" %>

<! This page has two functions:  >
<!		1) It verifies that all fields on the QueryPage.asp page have been entered. If they have >
<!         not, it displays page that tells the user which fields are required to continue.		 >
<!		2) Otherwise, it displays all the information that the user entered in the QueryPage.asp >
<!		   page.>
<!  The user has the option of either correcting the previously entered information or replacing >
<!  the order for the computer.																	 >
<HTML>
<HEAD>
<META NAME="GENERATOR" Content="Microsoft Visual InterDev 1.0">
<META HTTP-EQUIV="Content-Type" content="text/html; charset=iso-8859-1">
<TITLE>The Online Computer Store</TITLE>
</HEAD>
<body background="./WB00516_1.gif">

<form action="QueryPage.asp" method=post>
<!-- Insert HTML here -->
<%
	Dim totalPrice
	' Check if the user has entered all the required info
	If (Trim(Request.Form("Quantity")) = "" Or Trim(Request.Form("Name")) = "" Or Trim(Request.Form("LastName")) = "" Or Trim(Request.Form("Address")) = "" Or Trim(Request.Form("Company")) = "" Or Trim(Request.Form("email")) = "" Or Trim(Request.Form("CreditCardNo")) = "") Then
%>
<! At least one of the fields is empty
<p><font face="Garamond" color="#000000"><big><big><big><strong>Missing Information</strong></big></big></big></font></p>

<p><font color="#000000">The following field(s) are required. Please go back to the first screen 
and complete the rest of the form.&nbsp;&nbsp; </font></p>

<! List the name of the fields that are empty. Make sure to use Trim() to eliminate the blank entries
<%If (Trim(Request.Form("Quantity")) = "") Then %>
<p><font color="#000000">Quantity</font></p>
<%End If%>

<%If (Trim(Request.Form("Name")) = "") Then %>
<p><font color="#000000">First Name</font></p>
<%End If%>

<%If (Trim(Request.Form("LastName")) = "") Then %>
<p><font color="#000000">Last Name</font></p>
<%End If%>

<%If (Trim(Request.Form("Address")) = "") Then %>
<p><font color="#000000">Address</font></p>
<%End If%>

<%If (Trim(Request.Form("Company")) = "") Then %>
<p><font color="#000000">Company</font></p>
<%End If%>

<%If (Trim(Request.Form("email")) = "") Then %>
<p><font color="#000000">E-mail Address</font></p>
<%End If%>

<%If (Trim(Request.Form("CreditCardNo")) = "") Then %>
<p><font color="#000000">Credit Card Number</font></p>
<%End If%>


<p align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input name="UserAction" type="submit"  value="Re-enter"></p>

<%
	' Nothing left blank. Calculate the total price of the computer and
	' list what the user has entered for confirmation
	Else
		totalPrice = 0
		' Calculate the total price of the computer
		' Get the reference to the OraDatabase object from the pool
		set OraDatabase = OraSession.getDatabaseFromPool(10)
		' Create the dynaset
		set OraDynaset = OraDatabase.CreateDynaset("select Price from SetTypes where Value='" & Request.Form("PCType") & "'", 0)
		totalPrice = totalPrice + OraDynaset.Fields("Price").Value
		set OraDynaset = OraDatabase.CreateDynaset("select Price from SetTypes where Value='" & Request.Form("Memory") & "'", 0)
		totalPrice = totalPrice + OraDynaset.Fields("Price").Value
		set OraDynaset = OraDatabase.CreateDynaset("select Price from SetTypes where Value='" & Request.Form("HardDrive") & "'", 0)
		totalPrice = totalPrice + OraDynaset.Fields("Price").Value
		set OraDynaset = OraDatabase.CreateDynaset("select Price from SetTypes where Value='" & Request.Form("OS") & "'", 0)
		totalPrice = totalPrice + OraDynaset.Fields("Price").Value
		If (Request.Form("Modem") = "on") Then totalPrice = totalPrice + 150 End If
		If (Request.Form("CDROM") = "on") Then totalPrice = totalPrice + 200 End If
		If (Request.Form("SoundCard") = "on") Then totalPrice = totalPrice + 150 End If
		If (Request.Form("NetworkCard") = "on") Then totalPrice = totalPrice + 200 End If
		totalPrice = totalPrice * CInt(Request.Form("Quantity"))
%>

<p><font face="Garamond" color="#000000"><big><big><big><strong>Confirmation</strong></big></big></big></font></p>

<p><font color="#000000">The information shown below is what you have entered. You can either order your computer or
click the "re-enter" button to change incorrect information.&nbsp;&nbsp; </font></p>


<table border="1" width="77%" height="508" bordercolor="#008080"
bordercolorlight="#008080">
    <tr>
      <td width="31%" height="43"><strong><font color="#000000">Computer Information</font></strong></td>
      <td width="69%" height="43"></td>
    </tr>
    <tr>
      <td width="31%" height="19"><font color="#000000">PC Type</font></td>
      <td width="69%" height="19"><%=Request.Form("PCType")%></td>
    </tr>
    <tr>
      <td width="31%" height="19"><font color="#000000">Memory (MB)</font></td>
      <td width="69%" height="19"><%=Request.Form("Memory")%></td>
    </tr>
    <tr>
      <td width="31%" height="19"><font color="#000000">Hard Drive (GB)</font></td>
      <td width="69%" height="19"><%=Request.Form("HardDrive")%></td>
    </tr>
    <tr>
      <td width="31%" height="19"><font color="#000000">Operating System</font></td>
      <td width="69%" height="19"><%=Request.Form("OS")%></td>
    </tr>
    <tr>
      <td width="31%" height="13"><font color="#000000">Modem</font></td>
      <td width="69%" height="13">
	  <%If (Request.Form("Modem") = "on") Then%>Yes<%Else%>No<%End If%></td>
    </tr>
    <tr>
      <td width="31%" height="19"><font color="#000000">CD ROM Drive</font></td>
      <td width="69%" height="19">
	  <%If (Request.Form("CDROM") = "on") Then%>Yes<%Else%>No<%End If%></td>
    </tr>
    <tr>
      <td width="31%" height="19"><font color="#000000">Sound Card</font></td>
      <td width="69%" height="19">
	  <%If (Request.Form("SoundCard") = "on") Then%>Yes<%Else%>No<%End If%></td>
     </tr>
    <tr>
      <td width="31%" height="19"><font color="#000000">Network Card</font></td>
      <td width="69%" height="19">
	  <%If (Request.Form("NetworkCard") = "on") Then%>Yes<%Else%>No<%End If%></td>
     </tr>
    <tr>
      <td width="31%" height="22"><font color="#000000">Quantity</font></td>
      <td width="69%" height="22"><%=Request.Form("Quantity")%></td>
    </tr>
    <tr>
      <td width="31%" height="53"><strong><font color="#000000">Personal Information</font></strong></td>
      <td width="69%" height="53"></td>
    </tr>
    <tr>
      <td width="31%" height="19"><font color="#000000">First Name</font></td>
      <td width="69%" height="19"><%=Request.Form("Name")%></td>
    </tr>
    <tr>
      <td width="31%" height="19"><font color="#000000">Last Name</font></td>
      <td width="69%" height="19"><%=Request.Form("LastName")%></td>
    </tr>
    <tr>
      <td width="31%" height="19"><font color="#000000">Address</font></td>
      <td width="69%" height="19"><%=Request.Form("Address")%></td>
    </tr>
    <tr>
      <td width="31%" height="19"><font color="#000000">Company</font></td>
      <td width="69%" height="19"><%=Request.Form("Company")%></td>
    </tr>
    <tr>
      <td width="31%" height="19"><font color="#000000">E-mail Address</font></td>
      <td width="69%" height="19"><%=Request.Form("email")%></td>
    </tr>
    <tr>
      <td width="31%" height="19"><font color="#000000">Payment Type</font></td>
      <td width="69%" height="19"><%=Request.Form("PaymentType")%></td>
    </tr>
    <tr>
      <td width="31%" height="19"><font color="#000000">Credit Card Number</font></td>
      <td width="69%" height="19"><%=Request.Form("CreditCardNo")%></td>
    </tr>
  </table>


<p><font color="#000000">Estimated total price: $<%=totalPrice%> </font></p>

<p align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input name="UserAction" type="submit"  value="Re-enter" >
&nbsp;&nbsp;&nbsp;&nbsp; <input name="UserAction" type="submit" value="Order">
<%End If%>

<! Keep the values from the QueryPage.asp in hidden form so that when we go back to the >
<!  first screen we can again use the values to write to the database and redisplay the >
<!  previous selections>

<input type=hidden name="PCType" value="<%=Request.Form("PCType")%>">
<input type=hidden name="Memory" value="<%=Request.Form("Memory")%>">
<input type=hidden name="HardDrive" value="<%=Request.Form("HardDrive")%>">
<input type=hidden name="OS" value="<%=Request.Form("OS")%>">
<input type=hidden name="Modem" value="<%=Request.Form("Modem")%>">
<input type=hidden name="CDROM" value="<%=Request.Form("CDROM")%>">
<input type=hidden name="SoundCard" value="<%=Request.Form("SoundCard")%>">
<input type=hidden name="NetworkCard" value="<%=Request.Form("NetworkCard")%>">
<input type=hidden name="Quantity" value="<%=Request.Form("Quantity")%>">
<input type=hidden name="Name" value="<%=Request.Form("Name")%>">
<input type=hidden name="LastName" value="<%=Request.Form("LastName")%>">
<input type=hidden name="Address" value="<%=Request.Form("Address")%>">
<input type=hidden name="Company" value="<%=Request.Form("Company")%>">
<input type=hidden name="email" value="<%=Request.Form("email")%>">
<input type=hidden name="PaymentType" value="<%=Request.Form("PaymentType")%>">
<input type=hidden name="CreditCardNo" value="<%=Request.Form("CreditCardNo")%>">
<input type=hidden name="Price" value="<%=totalPrice%>">

</p>
</form>

</BODY>
</HTML>
