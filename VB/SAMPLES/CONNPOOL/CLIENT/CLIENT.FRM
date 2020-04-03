VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   3195
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   ScaleHeight     =   3195
   ScaleWidth      =   4680
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Command1 
      Caption         =   "Get OraDatabase from the Connection Pool"
      Height          =   615
      Left            =   120
      TabIndex        =   0
      Top             =   1080
      Width           =   4215
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
    Dim mydb As Object
    Dim OraDynaset As Object

    ' Connect to Connpool out-of-process Activex server
    Set objCbSvr = CreateObject("connpool.OraConnPool")
    
    ' Get the database object from the Connection pool
    Set mydb = objCbSvr.GetDatabase(App.ThreadID)
    
    ' Display the RDBMSVersion of OraDatabase object
    MsgBox mydb.RDBMSVersion
    ' Release the database object from the connection pool
    objCbSvr.ReleaseDatabase (App.ThreadID)
    
    
    
End Sub

