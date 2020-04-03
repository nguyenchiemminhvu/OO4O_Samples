<%@ LANGUAGE="VBSCRIPT" %>
<html>
<! This page is responsible for showing all the possible companies for which a stock >
<!  can be retrieved. The user can select one or more companies.					 >

<head>
<meta NAME="GENERATOR" Content="Microsoft FrontPage 3.0">
<title>Stock Qutoes</title>
</head>

<body background="WB00760_1.gif">


<form action="ShowStocks.asp" method=post>


<p><big><big><big>Stock Quotes</big></big></big></p>

<p><big>To request a stock quote, please select one or more of the companies.</big></p>

<table border="1" width="61%" height="62" bordercolordark="#FFFFFF">
  <tr>
    <td width="34%" height="6"><input type="checkbox" name="ORCL">Oracle</td>
    <td width="31%" height="6"><input type="checkbox" name="SUNW">Sun</td>
    <td width="4%" height="6"><input type="checkbox" name="CSCO">Cisco</td>
  </tr>
  <tr>
    <td width="34%" height="19"><input type="checkbox" name="IBM">IBM </td>
    <td width="31%" height="19"><input type="checkbox" name="HWP">HP</td>
    <td width="35%" height="19"><input type="checkbox" name="COMS">3Com</td>
  </tr>
  <tr>
    <td width="34%" height="19"><input type="checkbox" name="NSCP">Netscape</td>
    <td width="31%" height="19"><input type="checkbox" name="INTC">Intel</td>
    <td width="35%" height="19"><input type="checkbox" name="DELL">Dell</td>
  </tr>
</table>

<p><input type="submit" value="Look Up" name="lookup">&nbsp;&nbsp; <input type="reset"
value="Reset" name="Reset"></p>


<input type="hidden" value="1st" name="pass">
</form>
</body>
</html>
