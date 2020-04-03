VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
END
Attribute VB_Name = "newcallback"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Attribute VB_Ext_KEY = "SavedWithClassBuilder" ,"Yes"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
'set this to 0 to disable debug code in this class
#Const DebugMode = 1


#If DebugMode Then
    'local variable to hold the serialized class ID that was created in Class_Initialize
    Private mlClassDebugID As Long
'local variable(s) to hold property value(s)
Private mvarMsgid As String 'local copy
Public Property Let Msgid(ByVal vData As String)
    On Error GoTo MsgidLetErr


'used when assigning a value to the property, on the left side of an assignment.
'Syntax: X.Msgid = 5
    mvarMsgid = vData
    Exit Property


MsgidLetErr:


    Call RaiseError(MyUnhandledError, "newcallback:Msgid Property Let")
End Property


Public Property Get Msgid() As String
Attribute Msgid.VB_UserMemId = 0
    On Error GoTo MsgidGetErr


'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Debug.Print X.Msgid
    Msgid = mvarMsgid
    Exit Property


MsgidGetErr:


    Call RaiseError(MyUnhandledError, "newcallback:Msgid Property Get")
End Property



#End If
Public Sub NotifyMe(ByVal Ctx As Variant, ByVal Msgid As Variant)
    On Error GoTo NotifyMeErr
    Dim OraNewMsg As Object
    If IsNull(Msgid) Then
        MsgBox "No Message"
        ' Get Error
        MsgBox OraDatabase.LastServerErrText
    Else
        mvarMsgid = Msgid
        Set OraNewMsg = Ctx.AQMsg
        MsgBox "Message is : " & OraNewMsg & " with Correlate : " & OraNewMsg.correlation & "Priority : " & OraNewMsg.priority
        Set OraNewMsg = Nothing
    End If
    
    Exit Sub


NotifyMeErr:
    Call RaiseError(MyUnhandledError, "newcallback:NotifyMe Method")
End Sub



Private Sub Class_Initialize()
    #If DebugMode Then
        'get the next available class ID, and print out
        'that the class was created successfully
        mlClassDebugID = GetNextClassDebugID()
        Debug.Print "'" & TypeName(Me) & "' instance " & mlClassDebugID & " created"
    #End If
End Sub


Private Sub Class_Terminate()
    'the class is being destroyed
    #If DebugMode Then
        Debug.Print "'" & TypeName(Me) & "' instance " & CStr(mlClassDebugID) & " is terminating"
    #End If
End Sub


#If DebugMode Then
    Public Property Get ClassDebugID()
        'if we are in debug mode, surface this property that consumers can query
        ClassDebugID = mlClassDebugID
    End Property
#End If

