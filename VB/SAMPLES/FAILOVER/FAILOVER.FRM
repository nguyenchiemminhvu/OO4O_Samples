VERSION 5.00
Begin VB.Form FAILOVER 
   ClientHeight    =   5025
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   7740
   LinkTopic       =   "Form3"
   ScaleHeight     =   5025
   ScaleMode       =   0  'User
   ScaleWidth      =   7740
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton Cmdfailover 
      Caption         =   "Register for Failover"
      Height          =   615
      Left            =   2280
      TabIndex        =   1
      Top             =   1680
      Width           =   1935
   End
   Begin VB.Label Label5 
      Caption         =   "OO4O FAILOVER"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   2640
      TabIndex        =   0
      Top             =   240
      Width           =   2655
   End
End
Attribute VB_Name = "FAILOVER"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Public Failover_Client As New failovercls


Private Sub Cmdfailover_Click()
    Set orasession = CreateObject("OracleInProcServer.XOraSession")
    Set OraDatabase = orasession.DbOpenDatabase("exampledb", "scott/tiger", ORADB_ENLIST_FOR_CALLBACK)
    OraDatabase.MonitorForFailover Failover_Client, OraDatabase
    
    MsgBox "OK"
    Set OraDynaset = OraDatabase.CreateDynaset("select 1/2 from dual", 0&)
    While Not OraDynaset.EOF
      MsgBox OraDynaset.Fields(0).Value
      OraDynaset.MoveNext
    Wend
    Set OraDynaset = Nothing
    Set OraDatabase = Nothing

End Sub

