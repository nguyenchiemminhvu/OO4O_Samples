VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
END
Attribute VB_Name = "CallbackClient"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "SavedWithClassBuilder" ,"Yes"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
 Private mMsgid As String

'set this to 0 to disable debug code in this class
#Const DebugMode = 1
#If DebugMode Then
    'local variable to hold the serialized class ID that was created in Class_Initialize
    Private mlClassDebugID As Long
   
#End If
Public Sub NotifyMe(Ctx As Variant, Msgid As Variant)
    On Error GoTo NotifyMeErr
    MsgBox "I am in the Notification"
    mMsgid = Msgid
    If IsEmpty(Ctx) Then
        MsgBox "Context is null" + OraDatabase.LastServerErr
    End If
    If IsEmpty(Msgid) Then
       MsgBox "Error is " + OraDatabase.LastServerErr
    End If
    
   ' MsgBox Msgid
    'Dim newobj As OraObject
    'Set newobj = OraMsg.Value

    MsgBox OraMsg.Value
    'MsgBox newobj("Text").Value


    'your code goes here...


    Exit Sub


NotifyMeErr:


    Call RaiseError(MyUnhandledError, "CallbackClient:NotifyMe Method")
End Sub
Public Function GetMsgid() As String
GetMsgid = mMsgid
End Function


Public Sub Class_Initialize()
    #If DebugMode Then
        'get the next available class ID, and print out
        'that the class was created successfully
        mlClassDebugID = GetNextClassDebugID()
        Debug.Print "'" & TypeName(Me) & "' instance " & mlClassDebugID & " created"
    #End If
End Sub


Public Sub Class_Terminate()
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
