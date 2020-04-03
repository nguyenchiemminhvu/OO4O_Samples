<html>

<head>
<title>Oracle Objects For OLE (OO4O) 2.3 </title>
</head>

<body BGCOLOR="#FFFFFF">
<font FACE="ARIAL,HELVETICA">

<h2 align="center">Oracle Objects For OLE (OO4O) 2.3 </h2>

<form ACTION="OO4ODEMO.asp" METHOD="POST">
<%
  SqlQuery = Request.Form("sqlquery") 
%>
  <p>This sample executes a SQL &quot;SELECT&quot; query and returns the result as an HTML
  table. The database connection used in this script is obtained from a pool that is created
  when the <strong>global.asa</strong> is executed. </p>
  <p>SQL Select Query: <input SIZE="48" NAME="sqlquery"> </p>
  <p><input TYPE="SUBMIT"> <input TYPE="RESET"> <input LANGUAGE="VBScript" TYPE="button"
  VALUE="Show ASP Souce" ONCLICK="Window.location.href = &quot;oo4oasp.htm&quot;"
  NAME="ShowSrc"></p>
</form>
<%
If SqlQuery = "" Then 
%>
<% Else  %>

<table BORDER="1">
<%
Set OraDatabase = OraSession.GetDatabaseFromPool(10)
Set OraDynaset = OraDatabase.CreateDynaset(SqlQuery,0)
Set Columns= OraDynaset .Fields
%>
  <tr>
    <td><table BORDER="1">
      <tr>
<% For i = 0 to Columns.Count - 1 %>
        <td><b><% = Columns(i).Name %></b></td>
<% Next %>
      </tr>
<% while NOT OraDynaset.EOF %>
      <tr>
<% For col = 0 to Columns.Count - 1  %>
        <td><%  = Columns(col) %>
</td>
<% Next %>
      </tr>
<% OraDynaSet.MoveNext %>
<% WEnd %>
    </table>
    <p></font><%End If%> </p>
    <hr>
    </td>
  </tr>
</table>
</body>
</html>
