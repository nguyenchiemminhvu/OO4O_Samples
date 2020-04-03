VERSION 5.00
Begin VB.Form clob 
   Caption         =   "CLOB Form"
   ClientHeight    =   2445
   ClientLeft      =   165
   ClientTop       =   735
   ClientWidth     =   4110
   LinkTopic       =   "clob"
   ScaleHeight     =   2445
   ScaleWidth      =   4110
   StartUpPosition =   3  'Windows Default
   Begin VB.TextBox txtChapNum 
      Height          =   375
      Left            =   2400
      TabIndex        =   1
      Top             =   840
      Width           =   975
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Get Chapter"
      Height          =   375
      Left            =   1080
      TabIndex        =   0
      Top             =   1680
      Width           =   2295
   End
   Begin VB.Label Label2 
      Caption         =   "MyBook Table"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   -1  'True
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   1200
      TabIndex        =   3
      Top             =   120
      Width           =   1815
   End
   Begin VB.Label Label1 
      Alignment       =   1  'Right Justify
      Caption         =   "Enter Chapter number:"
      Height          =   255
      Left            =   360
      TabIndex        =   2
      Top             =   840
      Width           =   1815
   End
   Begin VB.Menu mChapno 
      Caption         =   "Sample &Chap Num"
   End
   Begin VB.Menu mExit 
      Caption         =   "E&xit"
   End
End
Attribute VB_Name = "clob"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'Declare variables as OLE Objects
Public OraSession As OraSessionClass
Public OraDatabase As OraDatabase
Public OraDynaset As OraDynaset
Public mybook_pkg As New MYBOOKPKG
Public chapclob As OraClob


Private Sub Command1_Click()

  'if txtChapNum is not empty
  If txtChapNum <> "" Then
 
    'get chapters CLOB column from mybook table
    mybook_pkg.GETCHAPTER txtChapNum, chapclob
    'read the chapter CLOB
    readclob chapclob, 100, "chapclob"

  End If

End Sub

Sub readclob(m_oraClob As OraClob, read_amount As Long, desc$)

Dim temp1$, b1, out

    'MsgBox desc & ".size = " & m_oraClob.Size
    'MsgBox desc & ".Read(b1, " & read_amount & ")"
    out = m_oraClob.Read(b1, read_amount)
    temp1 = b1
    MsgBox temp1

End Sub

Private Sub Form_Load()

 'Create the OraSession Object
 Set OraSession = New OraSessionClass

 'Create the OraDatabase Object by opening a connection to Oracle
 Set OraDatabase = OraSession.OpenDatabase("exampledb", "scott/tiger", 0&)
 
 'Set database property of the generated MYBOOKPKG object
 mybook_pkg.database = OraDatabase

End Sub


Private Sub mChapno_Click()

  MsgBox "If the table was created with the sql file provided, " & _
          "following Chapter numbers should be in the table :  " & _
          "1, 2, 3"

End Sub

Private Sub mExit_Click()
  
  End
  
End Sub
