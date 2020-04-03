Attribute VB_Name = "MainModule"
Global Const PoolSize As Integer = 20

Global OraSession(PoolSize) As Object
Global OraDatabase(PoolSize) As Object
Global DatabaseStatus(PoolSize) As Integer
Sub Main()
 
' This sample demonstrated creation of an out of process activex server,
' that implements a connection pooling scheme. This scheme could be used
' in application server environement such Microsoft Internet information server(IIS)
' to reduce the overhead of connecting to Oracle databases every time an HTTP request
' is serviced

Form1.Show
  
Dim i As Integer

Form1.Label1.Caption = "Creating OO4O Connection Pool ... "
Form1.Label1.Refresh


For i = 1 To PoolSize
' Create 20 OraDatabase object and store them in global array
  Set OraSession(i) = CreateObject("OracleInProcServer.XOraSession")
  Set OraDatabase(i) = OraSession(i).DbOpenDatabase("exampledb", "scott/tiger", 0&)
  DatabaseStatus(i) = 0
Next i
 
Form1.Label1.Caption = "OO4O Connection Pool Created ... "
Form1.Label1.Refresh

 
End Sub

