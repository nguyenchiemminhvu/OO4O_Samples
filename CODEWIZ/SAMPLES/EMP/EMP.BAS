Attribute VB_Name = "Module1"
Public OraSession As OraSessionClass
Public OraDynaset As OraDynaset
Public Employees As OraDynaset
Public emp_pkg As New EMPLOYEE, edate As Date, ename As String

Public Const WarnFirstEmp$ = "You are already on the first employee."
Public Const WarnLastEmp$ = "You are already on the last employee."

