<%@ LANGUAGE="VBSCRIPT" %>
<html>

<! This page is responsible for showing the stock quotes of the selected companies that were selected   >
<!  from SelectCompany.asp page.																		> 

<! This page uses Oracle Objects for OLE, a set of COM data access objects, to retrieve the stock from	> 
<!  Oracle. TO improve the performance of this page, a connection pool is established in the Global.ASA	>
<!  file and a connection is retrieved from this pool each time data need to be retrieved from Oracle.	>

<! This page is redisplayed if the user changes the view status (e.g 1 day, 3 months, 1 year) of any	>
<!  company. In this case, a unique value for each stock that was selected is passed back to the server.>
<!  When the page is revisited, we check to see if company value is empty. If it is empty, then this	>
<!  means that the company view status did not change and we store the old value. If it is not empty,	>
<!  then this means that the view status did change and we display the new value and image file for the >
<!  different view.																						>


<head>
<meta NAME="GENERATOR" Content="Microsoft FrontPage 3.0">
<title>Stock Quotes</title>
</head>

<body><! background="WB00760_1.gif">
<!-- Insert HTML here -->
<form method=get action="ShowStocks.asp">

<%
	' If the page is visited for the first time then store the original state of the
	'  companies (wheter a company has been selected or not)
	' Since this page can be visited many times to view a company's 1 day, 3 months, or 1 year stock
	'  quote chart, we have to keep track of each company's view state every time the page revisited.

	If Request.Form("pass") = "1st" Then 
		Session("orcl") = Request("orcl")
		Session("sunw") = Request("sunw")
		Session("csco") = Request("csco")
		Session("ibm") = Request("ibm")  
		Session("hwp") = Request("hwp")  
		Session("coms") = Request("coms")
		Session("nscp") = Request("nscp")
		Session("intc") = Request("intc")
		Session("dell") = Request("dell")
	End If

	' Check if the user selected any company.
	If (Session("orcl") <> "on" And Session("sunw") <> "on" And Session("csco") <> "on" And Session("ibm") <> "on" And Session("hwp") <> "on" And Session("coms") <> "on" And Session("nscp") <> "on" And Session("intc") <> "on" And Session("dell") <> "on") Then
%>
<!  Nothing selected. Warn the user about selecting at least one company.
<p><font face="Garamond" color="#000000"><big><big><big><strong>Missing Information</strong></big></big></big></font></p>

<p><font color="#000000">You must select at least one company. Please go back to the first screen and select a company or companies.&nbsp;&nbsp; </font></p>
<%
	Else
	

	' If Oracle has been selected then store the view state of the company
	If Session("orcl") = "on" Then
		' If oracle's view status changed
		If Request.QueryString("orclCrt") <> "" Then
			' No. restore the old value
			Session("orclCrt") = Request.QueryString("orclCrt")
		End If
		orclCrt = Session("orclCrt")
		' Make sure the default view is 1 day
		If (orclCrt <> "MonthFile" And orclCrt <> "YearFile") Then
			orclCrt="DayFile"
		End If


		' Get the reference to the OraDatabase object from the pool of connections
		set OraDatabase = OraSession.getDatabaseFromPool(10)
		' Create the dynaset to point to correct chart
		set OraDynaset = OraDatabase.CreateDynaset("select * from QuoteCharts where Symbol='ORCL'", 0)
%>
<table border="1" width="63%" height="309" bordercolordark="#FFFFFF">
  <tr>
    <td width="100%" height="19"><b>ORACLE CORPORATION</b>  (Nasdaq: ORCL)</td>
  </tr>
  <tr>
    <td width="100%" height="278">
	<img src="<%=OraDynaset.Fields("" & orclCrt & "").Value%>"><p>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	View by: [<% If orclCrt<>"DayFile" Then%> <a href="ShowStocks.asp?orclCrt=DayFile">1 day</a><%Else %> <b> 1 day </b> <%End If%>
	| <% If orclCrt<>"MonthFile" Then%><a href="ShowStocks.asp?orclCrt=MonthFile">3 months</a> <%Else%><b> 3 months </b> <%End If%>
	| <% If orclCrt<>"YearFile" Then%><a href="ShowStocks.asp?orclCrt=YearFile">1 year</a><%Else%><b> 1 year </b> <%End If%>]
	<br>
  </tr>
</table>
<p>&nbsp;</p>
<%
	End If
%>

<%
	' If Sun has been selected then store the view state of the company
	If Session("sunw") = "on" Then
		' If Sun's view status changed
		If Request.QueryString("sunwCrt") <> "" Then
			' No. restore the old value
			Session("sunwCrt") = Request.QueryString("sunwCrt")
		End If
		sunwCrt = Session("sunwCrt")
		' Make sure defult view is 1 day
		If (sunwCrt <> "MonthFile" And sunwCrt <> "YearFile") Then
			sunwCrt="DayFile"
		End If

		' Get the reference to the OraDatabase object from the pool of connections
		set OraDatabase = OraSession.getDatabaseFromPool(10)
		' Create the dynaset to point to correct chart
		set OraDynaset = OraDatabase.CreateDynaset("select * from QuoteCharts where Symbol='SUNW'", 0)
%>
<table border="1" width="63%" height="309" bgcolor="#FFFFFF" bordercolordark="#FFFFFF">
  <tr>
    <td width="100%" height="19"><b>SUN MICROSYSTEMS</b> (Nasdaq: SUNW)</td>
  </tr>
  <tr>
    <td width="100%" height="278">
	<img src="<%=OraDynaset.Fields("" & sunwCrt & "").Value%>"><p>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	View by: [<% If sunwCrt<>"DayFile" Then%> <a href="ShowStocks.asp?sunwCrt=DayFile">1 day</a><%Else %> <b> 1 day </b> <%End If%>
	| <% If sunwCrt<>"MonthFile" Then%><a href="ShowStocks.asp?sunwCrt=MonthFile">3 months</a> <%Else%><b> 3 months </b> <%End If%>
	| <% If sunwCrt<>"YearFile" Then%><a href="ShowStocks.asp?sunwCrt=YearFile">1 year</a><%Else%><b> 1 year </b> <%End If%>]
	<br>
  </tr>
</table>
<p>&nbsp;</p>
<%
	End If
%>


<%
	' If Cisco has been selected then store the view state of the company
	If Session("csco") = "on" Then
		' If Cisco's view status changed
		If Request.QueryString("cscoCrt") <> "" Then
			' No. restore the old value
			Session("cscoCrt") = Request.QueryString("cscoCrt")
		End If
		cscoCrt = Session("cscoCrt")
		' Make sure defult view is 1 day
		If (cscoCrt <> "MonthFile" And cscoCrt <> "YearFile") Then
			cscoCrt="DayFile"
		End If

		' Get the reference to the OraDatabase object from the pool of connections
		set OraDatabase = OraSession.getDatabaseFromPool(10)
		' Create the dynaset to point to correct chart
		set OraDynaset = OraDatabase.CreateDynaset("select * from QuoteCharts where Symbol='CSCO'", 0)
%>
<table border="1" width="63%" height="309" bordercolordark="#FFFFFF">
  <tr>
    <td width="100%" height="19"><b>SYSCO SYSTEMS</b> (Nasdaq: CSCO)</td>
  </tr>
  <tr>
    <td width="100%" height="278">
	<img src="<%=OraDynaset.Fields("" & cscoCrt & "").Value%>"><p>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	View by: [<% If cscoCrt<>"DayFile" Then%> <a href="ShowStocks.asp?cscoCrt=DayFile">1 day</a><%Else %> <b> 1 day </b> <%End If%>
	| <% If cscoCrt<>"MonthFile" Then%><a href="ShowStocks.asp?cscoCrt=MonthFile">3 months</a> <%Else%><b> 3 months </b> <%End If%>
	| <% If cscoCrt<>"YearFile" Then%><a href="ShowStocks.asp?cscoCrt=YearFile">1 year</a><%Else%><b> 1 year </b> <%End If%>]
	<br>
  </tr>
</table>
<p>&nbsp;</p>
<%
	End If
%>

<%
	' If IBM has been selected then store the view state of the company
	If Session("ibm") = "on" Then
		' If IBM's view status changed
		If Request.QueryString("ibmCrt") <> "" Then
			' No. restore the old value
			Session("ibmCrt") = Request.QueryString("ibmCrt")
		End If
		ibmCrt = Session("ibmCrt")
		' Make sure defult view is 1 day
		If (ibmCrt <> "MonthFile" And ibmCrt <> "YearFile") Then
			ibmCrt="DayFile"
		End If

		' Get the reference to the OraDatabase object from the pool of connections
		set OraDatabase = OraSession.getDatabaseFromPool(10)
		' Create the dynaset to point to correct chart
		set OraDynaset = OraDatabase.CreateDynaset("select * from QuoteCharts where Symbol='IBM'", 0)
%>
<table border="1" width="63%" height="309" bordercolordark="#FFFFFF">
  <tr>
    <td width="100%" height="19"><b>INTERNATIONAL BUSINESS MACHINES</b> (Nasdaq: IBM)</td>
  </tr>
  <tr>
    <td width="100%" height="278">
	<img src="<%=OraDynaset.Fields("" & ibmCrt & "").Value%>"><p>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	View by: [<% If ibmCrt<>"DayFile" Then%> <a href="ShowStocks.asp?ibmCrt=DayFile">1 day</a><%Else %> <b> 1 day </b> <%End If%>
	| <% If ibmCrt<>"MonthFile" Then%><a href="ShowStocks.asp?ibmCrt=MonthFile">3 months</a> <%Else%><b> 3 months </b> <%End If%>
	| <% If ibmCrt<>"YearFile" Then%><a href="ShowStocks.asp?ibmCrt=YearFile">1 year</a><%Else%><b> 1 year </b> <%End If%>]
	<br>
  </tr>
</table>
<p>&nbsp;</p>
<%
	End If
%>

<%
	' If HP has been selected then store the view state of the company
	If Session("hwp") = "on" Then
		' If HP's view status changed
		If Request.QueryString("hwpCrt") <> "" Then
			' No. restore the old value
			Session("hwpCrt") = Request.QueryString("hwpCrt")
		End If
		hwpCrt = Session("hwpCrt")
		' Make sure defult view is 1 day
		If (hwpCrt <> "MonthFile" And hwpCrt <> "YearFile") Then
			hwpCrt="DayFile"
		End If

		' Get the reference to the OraDatabase object from the pool of connections
		set OraDatabase = OraSession.getDatabaseFromPool(10)
		' Create the dynaset to point to correct chart
		set OraDynaset = OraDatabase.CreateDynaset("select * from QuoteCharts where Symbol='HWP'", 0)
%>
<table border="1" width="63%" height="309" bordercolordark="#FFFFFF">
  <tr>
    <td width="100%" height="19"><b>HEWLETT-PACKARD</b> (Nasdaq: HWP)</td>
  </tr>
  <tr>
    <td width="100%" height="278">
	<img src="<%=OraDynaset.Fields("" & hwpCrt & "").Value%>"><p>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	View by: [<% If hwpCrt<>"DayFile" Then%> <a href="ShowStocks.asp?hwpCrt=DayFile">1 day</a><%Else %> <b> 1 day </b> <%End If%>
	| <% If hwpCrt<>"MonthFile" Then%><a href="ShowStocks.asp?hwpCrt=MonthFile">3 months</a> <%Else%><b> 3 months </b> <%End If%>
	| <% If hwpCrt<>"YearFile" Then%><a href="ShowStocks.asp?hwpCrt=YearFile">1 year</a><%Else%><b> 1 year </b> <%End If%>]
	<br>
  </tr>
</table>
<p>&nbsp;</p>
<%
	End If
%>

<%
	' If 3Com has been selected then store the view state of the company
	If Session("coms") = "on" Then
		' If 3Com's view status changed
		If Request.QueryString("comsCrt") <> "" Then
			' No. restore the old value
			Session("comsCrt") = Request.QueryString("comsCrt")
		End If
		comsCrt = Session("comsCrt")
		' Make sure defult view is 1 day
		If (comsCrt <> "MonthFile" And comsCrt <> "YearFile") Then
			comsCrt="DayFile"
		End If

		' Get the reference to the OraDatabase object from the pool of connections
		set OraDatabase = OraSession.getDatabaseFromPool(10)
		' Create the dynaset to point to correct chart
		set OraDynaset = OraDatabase.CreateDynaset("select * from QuoteCharts where Symbol='COMS'", 0)
%>
<table border="1" width="63%" height="309" bordercolordark="#FFFFFF">
  <tr>
    <td width="100%" height="19"><b>THREE COM CORPORATION</b> (Nasdaq: COMS)</td>
  </tr>
  <tr>
    <td width="100%" height="278">
	<img src="<%=OraDynaset.Fields("" & comsCrt & "").Value%>"><p>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	View by: [<% If comsCrt<>"DayFile" Then%> <a href="ShowStocks.asp?comsCrt=DayFile">1 day</a><%Else %> <b> 1 day </b> <%End If%>
	| <% If comsCrt<>"MonthFile" Then%><a href="ShowStocks.asp?comsCrt=MonthFile">3 months</a> <%Else%><b> 3 months </b> <%End If%>
	| <% If comsCrt<>"YearFile" Then%><a href="ShowStocks.asp?comsCrt=YearFile">1 year</a><%Else%><b> 1 year </b> <%End If%>]
	<br>
  </tr>
</table>
<p>&nbsp;</p>
<%
	End If
%>

<%
	' If Netscape has been selected then store the view state of the company
	If Session("nscp") = "on" Then
		' If Netscape's view status changed
		If Request.QueryString("nscpCrt") <> "" Then
			' No. restore the old value
			Session("nscpCrt") = Request.QueryString("nscpCrt")
		End If
		nscpCrt = Session("nscpCrt")
		' Make sure defult view is 1 day
		If (nscpCrt <> "MonthFile" And nscpCrt <> "YearFile") Then
			nscpCrt="DayFile"
		End If

		' Get the reference to the OraDatabase object from the pool of connections
		set OraDatabase = OraSession.getDatabaseFromPool(10)
		' Create the dynaset to point to correct chart
		set OraDynaset = OraDatabase.CreateDynaset("select * from QuoteCharts where Symbol='NSCP'", 0)
%>
<table border="1" width="63%" height="309" bordercolordark="#FFFFFF">
  <tr>
    <td width="100%" height="19"><b>NETSCAPE COMMUNICATIONS CORPORATION</b> (Nasdaq: NSCP)</td>
  </tr>
  <tr>
    <td width="100%" height="278">
	<img src="<%=OraDynaset.Fields("" & nscpCrt & "").Value%>"><p>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	View by: [<% If nscpCrt<>"DayFile" Then%> <a href="ShowStocks.asp?nscpCrt=DayFile">1 day</a><%Else %> <b> 1 day </b> <%End If%>
	| <% If nscpCrt<>"MonthFile" Then%><a href="ShowStocks.asp?nscpCrt=MonthFile">3 months</a> <%Else%><b> 3 months </b> <%End If%>
	| <% If nscpCrt<>"YearFile" Then%><a href="ShowStocks.asp?nscpCrt=YearFile">1 year</a><%Else%><b> 1 year </b> <%End If%>]
	<br>
  </tr>
</table>
<p>&nbsp;</p>
<%
	End If
%>

<%
	' If Intel has been selected then store the view state of the company
	If Session("intc") = "on" Then
		' If Intel's view status changed
		If Request.QueryString("intcCrt") <> "" Then
			' No. restore the old value
			Session("intcCrt") = Request.QueryString("intcCrt")
		End If
		intcCrt = Session("intcCrt")
		' Make sure defult view is 1 day
		If (intcCrt <> "MonthFile" And intcCrt <> "YearFile") Then
			intcCrt="DayFile"
		End If

		' Get the reference to the OraDatabase object from the pool of connections
		set OraDatabase = OraSession.getDatabaseFromPool(10)
		' Create the dynaset to point to correct chart
		set OraDynaset = OraDatabase.CreateDynaset("select * from QuoteCharts where Symbol='INTC'", 0)
%>
<table border="1" width="63%" height="309" bordercolordark="#FFFFFF">
  <tr>
    <td width="100%" height="19"><b>INTEL CORPORATION</b> (Nasdaq: INTC)</td>
  </tr>
  <tr>
    <td width="100%" height="278">
	<img src="<%=OraDynaset.Fields("" & intcCrt & "").Value%>"><p>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	View by: [<% If intcCrt<>"DayFile" Then%> <a href="ShowStocks.asp?intcCrt=DayFile">1 day</a><%Else %> <b> 1 day </b> <%End If%>
	| <% If intcCrt<>"MonthFile" Then%><a href="ShowStocks.asp?intcCrt=MonthFile">3 months</a> <%Else%><b> 3 months </b> <%End If%>
	| <% If intcCrt<>"YearFile" Then%><a href="ShowStocks.asp?intcCrt=YearFile">1 year</a><%Else%><b> 1 year </b> <%End If%>]
	<br>
  </tr>
</table>
<p>&nbsp;</p>
<%
	End If
%>

<%
	' If Dell has been selected then store the view state of the company
	If Session("dell") = "on" Then
		' If Dell's view status changed
		If Request.QueryString("dellCrt") <> "" Then
			' No. restore the old value
			Session("dellCrt") = Request.QueryString("dellCrt")
		End If
		dellCrt = Session("dellCrt")
		' Make sure defult view is 1 day
		If (dellCrt <> "MonthFile" And dellCrt <> "YearFile") Then
			dellCrt="DayFile"
		End If

		' Get the reference to the OraDatabase object from the pool of connections
		set OraDatabase = OraSession.getDatabaseFromPool(10)
		' Create the dynaset to point to correct chart
		set OraDynaset = OraDatabase.CreateDynaset("select * from QuoteCharts where Symbol='DELL'", 0)
%>
<table border="1" width="63%" height="309" bordercolordark="#FFFFFF">
  <tr>
    <td width="100%" height="19"><b>DELL COMPUTER CORPORATION</b> (Nasdaq: DELL)</td>
  </tr>
  <tr>
    <td width="100%" height="278">
	<img src="<%=OraDynaset.Fields("" & dellCrt & "").Value%>"><p>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	View by: [<% If dellCrt<>"DayFile" Then%> <a href="ShowStocks.asp?dellCrt=DayFile">1 day</a><%Else %> <b> 1 day </b> <%End If%>
	| <% If dellCrt<>"MonthFile" Then%><a href="ShowStocks.asp?dellCrt=MonthFile">3 months</a> <%Else%><b> 3 months </b> <%End If%>
	| <% If dellCrt<>"YearFile" Then%><a href="ShowStocks.asp?dellCrt=YearFile">1 year</a><%Else%><b> 1 year </b> <%End If%>]
	<br>
  </tr>
</table>
<%
	End If
	End If
%>


</form>
</body>
</html>
