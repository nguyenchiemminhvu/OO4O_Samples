VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "failovercls"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
Public Function OnFailover(ByVal ctx As Variant, ByVal fo_type As Variant, ByVal fo_event As Variant, ByVal OraDB As Variant)
Dim str As String
   
OnFailover = 0
str = Switch(fo_type = 1&, "NONE", fo_type = 2&, "SESSION", fo_type = 4&, "SELECT", fo_type = 8&, "TRANSACTION")
If IsNull(str) Then
    str = "UNKNOWN!"
    MsgBox ctx.RDBMSVersion
End If

If fo_event = 16 Then
       MsgBox "Failover error gotten. Retrying "
       OnFailover = OO4O_FO_RETRY
       
ElseIf fo_event = 8 Then
    MsgBox " Failover Begin .... with failover type : " & str
    
ElseIf fo_event = 1 Then
    MsgBox "Failover End"
    
Else
    MsgBox "Failover Called with event : " & fo_event
End If

End Function

