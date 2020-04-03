VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "DBEventCls"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
Public Sub NotifyDBEvents(ByVal Ctx As Variant, ByVal Payload As Variant)
    On Error GoTo NotifyMeErr
    MsgBox "Retrieved payload "
    countofMsgs = countofMsgs + 1
    If countofMsgs > 3 Then
        Ctx.Subscriptions(0).UnRegister
    End If
    Exit Sub
NotifyMeErr:
    'Call RaiseError(MyUnhandledError, "newcallback:NotifyMe Method")
    MsgBox Error

End Sub

