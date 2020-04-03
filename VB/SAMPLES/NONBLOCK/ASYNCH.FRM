VERSION 5.00
Begin VB.Form asynch 
   Caption         =   "Asynchronous Processing in OO4O"
   ClientHeight    =   3135
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   5040
   LinkTopic       =   "Form1"
   ScaleHeight     =   3135
   ScaleWidth      =   5040
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Cancel 
      Caption         =   "Cancel"
      Height          =   615
      Left            =   2400
      TabIndex        =   2
      Top             =   1680
      Visible         =   0   'False
      Width           =   1455
   End
   Begin VB.TextBox txtsql 
      Height          =   285
      Left            =   120
      MaxLength       =   70
      ScrollBars      =   1  'Horizontal
      TabIndex        =   1
      Top             =   840
      Width           =   4335
   End
   Begin VB.CommandButton Submit 
      Caption         =   "Submit for asynch"
      Height          =   615
      Left            =   720
      TabIndex        =   0
      Top             =   1680
      Width           =   1455
   End
End
Attribute VB_Name = "asynch"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim MySession As OraSession
Dim MyDatabase As OraDatabase
Dim Orastmt As OraSqlStmt


Private Sub Cancel_Click()
    On Error GoTo err_handler
    Orastmt.Cancel
    MsgBox "Asynchrous operation cancelled successfully"
        
    Set Orastmt = Nothing
    Cleanup
    Exit Sub
err_handler:
    MsgBox Err.Description
    Cleanup
End Sub

Private Sub Form_Load()
    Dim MyDatabase1 As OraDatabase
    Dim MyDatabase2 As OraDatabase
    
    Dim Orastmt1 As OraSqlStmt
    Dim stat As Long
    
    'Create the OraSession Object.
    Set MySession = CreateObject("OracleInProcServer.XOraSession")
    MySession.CreateDatabasePool 2, 100, 200, "exampledb", "scott/tiger", 0

End Sub

Private Sub Submit_Click()
    On Error GoTo err_handler
    If Submit.Caption = "Check Results" Then
        stat = Orastmt.NonBlockingState
        If stat = ORASQL_STILL_EXECUTING Then
            MsgBox "Asynchrous operation underway"
        Else
            MsgBox "Asynchronous operation completed succesfully"
            Set Orastmt = Nothing
            Cleanup
        End If
    Else
        If IsNull(txtsql.Text) Then
            MsgBox "Please enter a valid sql string for CreateSql"
            Exit Sub
        End If
        If MyDatabase Is Nothing Then
            Set MyDatabase = MySession.GetDatabaseFromPool(10)
        End If
        Set Orastmt = MyDatabase.CreateSql(txtsql.Text, ORASQL_NONBLK)
        Submit.Caption = "Check Results"
        txtsql.Visible = False
        Cancel.Visible = True
    End If
    Exit Sub
err_handler:
    MsgBox Err.Description
    Cleanup
End Sub

Private Sub Cleanup()
    Set MyDatabase = Nothing
    Submit.Caption = "Submit asynchronously"
    txtsql.Visible = True
    Cancel.Visible = False
End Sub
