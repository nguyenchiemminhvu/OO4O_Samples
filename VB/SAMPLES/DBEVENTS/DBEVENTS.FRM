VERSION 5.00
Begin VB.Form DBEvents 
   Caption         =   "DBEvents"
   ClientHeight    =   3195
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   4680
   LinkTopic       =   "DBEvents"
   ScaleHeight     =   3195
   ScaleWidth      =   4680
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Command1 
      Caption         =   "Subscribe to DB Events"
      Height          =   615
      Left            =   1200
      TabIndex        =   0
      Top             =   840
      Width           =   2055
   End
End
Attribute VB_Name = "DBEvents"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Public DBEventsHdlr As New DBEventCls
Private Sub Command1_Click()

  Dim gOraSession As Object
  Dim gadmincatalog As Object
  Dim gOraDatabase As OraDatabase
  'Dim gOraSubscriptions As New Class1
  Dim gOraSubscriptions As Object
  Dim gOracoll As Collection

  'Create the OraSession Object
  Set gOraSession = CreateObject("OracleInProcServer.XOraSession")
  'Create the OraDatabase Object by opening a connection to Oracle.
  Set gOraDatabase = gOraSession.DbOpenDatabase("exampledb", "pubsub/pubsub", ORADB_ENLIST_FOR_CALLBACK)
  'Set gOracoll = gOraSubscriptions.Enable(gOraDatabase)
  'gOraSubscriptions.Add ("PUBSUB.LOGON:ADMIN")
  'gOraSubscriptions.register
  Set gOraSubscriptions = gOraDatabase.Subscriptions
  'gOraDatabase.CreateDynaset("select * from emp", 0&)
  gOraSubscriptions.Add "pubsub.LOGON:ADMIN", DBEventsHdlr, gOraDatabase
  gOraSubscriptions(0).Register
  MsgBox "Logon Event Registered, Click on OK and logon to the database to receive the notification"
  
End Sub

Private Sub Timer1_Timer()

End Sub

