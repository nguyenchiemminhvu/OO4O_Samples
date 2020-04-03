VERSION 5.00
Begin VB.Form frmLogin 
   Appearance      =   0  'Flat
   BackColor       =   &H80000005&
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Login Test"
   ClientHeight    =   2370
   ClientLeft      =   2910
   ClientTop       =   3555
   ClientWidth     =   4050
   BeginProperty Font 
      Name            =   "MS Sans Serif"
      Size            =   8.25
      Charset         =   0
      Weight          =   700
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   ForeColor       =   &H80000008&
   LinkTopic       =   "Form4"
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   2370
   ScaleWidth      =   4050
   Begin VB.CommandButton Cancel 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "Cancel"
      Height          =   495
      Left            =   2280
      TabIndex        =   7
      Top             =   1680
      Width           =   1215
   End
   Begin VB.CommandButton ok 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "OK"
      Default         =   -1  'True
      Height          =   495
      Left            =   480
      TabIndex        =   6
      Top             =   1680
      Width           =   1215
   End
   Begin VB.TextBox lDatabaseName 
      Appearance      =   0  'Flat
      Height          =   285
      Left            =   1440
      TabIndex        =   2
      Text            =   "ExampleDb"
      Top             =   1200
      Width           =   2295
   End
   Begin VB.TextBox lPassword 
      Appearance      =   0  'Flat
      Height          =   285
      IMEMode         =   3  'DISABLE
      Left            =   1440
      PasswordChar    =   "*"
      TabIndex        =   1
      Text            =   "tiger"
      Top             =   720
      Width           =   2295
   End
   Begin VB.TextBox lUsername 
      Appearance      =   0  'Flat
      Height          =   285
      Left            =   1440
      TabIndex        =   0
      Text            =   "Scott"
      Top             =   240
      Width           =   2295
   End
   Begin VB.Label Label3 
      Alignment       =   1  'Right Justify
      Appearance      =   0  'Flat
      AutoSize        =   -1  'True
      BackColor       =   &H80000005&
      Caption         =   "Database"
      ForeColor       =   &H80000008&
      Height          =   195
      Left            =   480
      TabIndex        =   5
      Top             =   1200
      Width           =   825
   End
   Begin VB.Label Label2 
      Alignment       =   1  'Right Justify
      Appearance      =   0  'Flat
      AutoSize        =   -1  'True
      BackColor       =   &H80000005&
      Caption         =   "Password:"
      ForeColor       =   &H80000008&
      Height          =   195
      Left            =   480
      TabIndex        =   4
      Top             =   720
      Width           =   885
   End
   Begin VB.Label Label1 
      Alignment       =   1  'Right Justify
      Appearance      =   0  'Flat
      AutoSize        =   -1  'True
      BackColor       =   &H80000005&
      Caption         =   "User Name:"
      ForeColor       =   &H80000008&
      Height          =   195
      Left            =   240
      TabIndex        =   3
      Top             =   240
      Width           =   1005
   End
End
Attribute VB_Name = "frmLogin"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub Cancel_Click()
 Unload frmLogin
 End
End Sub

Private Sub Form_Load()

 Call CenterForm(frmLogin)

End Sub

Private Sub lDatabaseName_GotFocus()

 lDatabaseName.SelStart = 0
 lDatabaseName.SelLength = Len(lDatabaseName.Text)

End Sub

Private Sub lPassword_GotFocus()
 
 lPassword.SelStart = 0
 lPassword.SelLength = Len(lPassword.Text)

End Sub

Private Sub lUsername_GotFocus()

 lUsername.SelStart = 0
 lUsername.SelLength = Len(lUsername.Text)

End Sub

Private Sub OK_Click()

 If lUsername.Text <> "" Then
  UserName$ = lUsername.Text
  Password$ = lPassword.Text
  DatabaseName$ = lDatabaseName.Text
  Connect$ = UserName$ + "/" + Password$
 
 On Error GoTo NoOraConnection
 Set OraSession = CreateObject("OracleInProcServer.XOraSession")
 Set OraDatabase = OraSession.DbOpenDatabase(DatabaseName$, Connect$, 0&)

NoOraConnection:
 frmLogOraError.Show MODAL
 End

 End If
End Sub

