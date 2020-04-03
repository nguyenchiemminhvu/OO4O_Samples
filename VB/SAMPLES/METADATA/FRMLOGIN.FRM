VERSION 5.00
Begin VB.Form frmLogin 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Login"
   ClientHeight    =   3165
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   4515
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3165
   ScaleWidth      =   4515
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Tag             =   "Login"
   Begin VB.TextBox txtSchemaName 
      Height          =   285
      Left            =   1440
      TabIndex        =   9
      Text            =   "emp"
      Top             =   1560
      Width           =   2205
   End
   Begin VB.TextBox txtDbname 
      Height          =   285
      Left            =   1440
      TabIndex        =   1
      Text            =   "exampledb"
      Top             =   360
      Width           =   2205
   End
   Begin VB.CommandButton cmdCancel 
      Cancel          =   -1  'True
      Caption         =   "Cancel"
      Height          =   360
      Left            =   2100
      TabIndex        =   5
      Tag             =   "Cancel"
      Top             =   2100
      Width           =   1140
   End
   Begin VB.CommandButton cmdOK 
      Caption         =   "OK"
      Default         =   -1  'True
      Height          =   360
      Left            =   495
      TabIndex        =   4
      Tag             =   "OK"
      Top             =   2100
      Width           =   1140
   End
   Begin VB.TextBox txtPassword 
      Height          =   285
      IMEMode         =   3  'DISABLE
      Left            =   1410
      PasswordChar    =   "*"
      TabIndex        =   3
      Text            =   "tiger"
      Top             =   1125
      Width           =   2220
   End
   Begin VB.TextBox txtUserName 
      Height          =   285
      Left            =   1425
      TabIndex        =   2
      Text            =   "scott"
      Top             =   735
      Width           =   2205
   End
   Begin VB.Label lblSchemaName 
      Caption         =   "&Schema Object:"
      Height          =   255
      Index           =   2
      Left            =   120
      TabIndex        =   8
      Tag             =   "&Password:"
      Top             =   1575
      Width           =   1200
   End
   Begin VB.Label lblDbname 
      Caption         =   "&Database:"
      Height          =   255
      Index           =   2
      Left            =   120
      TabIndex        =   7
      Tag             =   "&User Name:"
      Top             =   375
      Width           =   1080
   End
   Begin VB.Label lblLabels 
      Caption         =   "&Password:"
      Height          =   255
      Index           =   1
      Left            =   105
      TabIndex        =   0
      Tag             =   "&Password:"
      Top             =   1140
      Width           =   1080
   End
   Begin VB.Label lblLabels 
      Caption         =   "&User Name:"
      Height          =   255
      Index           =   0
      Left            =   105
      TabIndex        =   6
      Tag             =   "&User Name:"
      Top             =   750
      Width           =   1080
   End
End
Attribute VB_Name = "frmLogin"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Declare Function GetUserName Lib "advapi32.dll" Alias "GetUserNameA" (ByVal lpbuffer As String, nSize As Long) As Long


Public OK As Boolean
Private Sub Form_Load()
    Dim sBuffer As String
    Dim lSize As Long
    
    On Error GoTo err_frmLoginLoad

    'Create the OraSession Object.
    Set OSess = CreateObject("OracleInProcServer.XOraSession")

    sBuffer = Space$(255)
    lSize = Len(sBuffer)
   ' Call GetUserName(sBuffer, lSize)
    
    Exit Sub
err_frmLoginLoad:
    MsgBox "Fatal Error : " & Error$
End Sub





Private Sub cmdCancel_Click()
    OK = False
    Me.Hide
End Sub


Private Sub cmdOK_Click()
    'check for correct password
     'Create the OraDatabase Object by opening a connection to Oracle.
        On Error Resume Next
        Set ODb = OSess.OpenDatabase(txtDbname, LTrim(RTrim(txtUserName & "/" & txtPassword)), 0&)
        'if automation error then exit sub
        If Err = 440 Then
            If OSess.LastServerErr = 1017 Then  'Invalid user/pass
                MsgBox "Invalid Password, try again! " & Error$, , "Login"
                txtPassword.SetFocus
                txtPassword.SelStart = 0
                txtPassword.SelLength = Len(txtPassword.Text)
            Else
                MsgBox "Error: " & Error$
            End If
            OK = False
            Exit Sub
        End If
        
        SchemaObjectName = txtSchemaName
        If SchemaObjectName = "" Then
            MsgBox "Enter Schema Name  "
            OK = False
            Exit Sub
        End If
 
        OK = True
        Me.Hide

End Sub

