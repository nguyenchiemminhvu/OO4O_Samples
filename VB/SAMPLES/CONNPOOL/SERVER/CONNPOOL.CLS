VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
END
Attribute VB_Name = "OraConnPool"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


Public Function GetDatabase(sessNum As Integer) As Object

'Returns an unused OraDatabase object from the global pool

Dim i As Integer
Dim flag As Boolean

flag = False

For i = 1 To PoolSize
  If DatabaseStatus(i) = 0 Then
  
    Set GetDatabase = OraDatabase(i)
    ' Return an unused OraDatabse interface and flag it as used in the global pool
    DatabaseStatus(i) = sessNum
    
    flag = True
    Exit For
  End If
Next



If flag = False Then
  Error 1111     'no more free databases left
End If

End Function

Public Sub ReleaseDatabase(sessNum As Integer)
Dim i As Integer
Dim flag As Boolean

flag = False

For i = 1 To PoolSize
  If DatabaseStatus(i) = sessNum Then
    DatabaseStatus(i) = 0
    flag = True
    Exit For
  End If
Next

If flag = False Then
  Error 1112      'sessNum does not match any databases
End If


End Sub



