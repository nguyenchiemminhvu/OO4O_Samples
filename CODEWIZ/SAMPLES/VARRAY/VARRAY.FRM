VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "VARRAY FORM"
   ClientHeight    =   5340
   ClientLeft      =   165
   ClientTop       =   735
   ClientWidth     =   4785
   BeginProperty Font 
      Name            =   "MS Sans Serif"
      Size            =   8.25
      Charset         =   0
      Weight          =   400
      Underline       =   -1  'True
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   LinkTopic       =   "Form1"
   ScaleHeight     =   5340
   ScaleWidth      =   4785
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Command1 
      Caption         =   "Get List of Employees"
      Height          =   495
      Left            =   1440
      TabIndex        =   5
      Top             =   1560
      Width           =   2415
   End
   Begin VB.TextBox txtDeptno 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   2760
      TabIndex        =   4
      Top             =   840
      Width           =   1095
   End
   Begin VB.ListBox EnameList 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1815
      Left            =   1440
      TabIndex        =   1
      Top             =   3120
      Width           =   2055
   End
   Begin VB.Line Line1 
      X1              =   240
      X2              =   4560
      Y1              =   2400
      Y2              =   2400
   End
   Begin VB.Label Label5 
      Alignment       =   1  'Right Justify
      Caption         =   "Enter Department Id:"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   240
      TabIndex        =   3
      Top             =   840
      Width           =   2415
   End
   Begin VB.Label Label3 
      Caption         =   "EnameList Array"
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
      Left            =   1440
      TabIndex        =   2
      Top             =   2760
      Width           =   2175
   End
   Begin VB.Label Label2 
      Caption         =   "Department Table"
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
      Left            =   1320
      TabIndex        =   0
      Top             =   240
      Width           =   2295
   End
   Begin VB.Menu mDeptNo 
      Caption         =   "Sample &Dept Id"
   End
   Begin VB.Menu mExit 
      Caption         =   "E&xit"
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'Declare variables as OLE Objects
Public OraSession As OraSessionClass
Public OraDatabase As OraDatabase
Public OraDynaset As OraDynaset
Public dept_pkg As New DEPTPKG
Public enames As OraCollection

Private Sub Command1_Click()

  If txtDeptno <> "" Then
  
    'get Enames VARRAY column from department table
    dept_pkg.GETNAMES txtDeptno, enames
    
    'populate all the elements of ENAMELIST into the listbox
    EnameList.Clear
    For I = 1 To enames.Size
      EnameList.AddItem enames(I)
    Next I

  End If

End Sub

Private Sub Form_Load()

 'Create the OraSession Object.
 Set OraSession = New OraSessionClass

 'Create the OraDatabase Object by opening a connection to Oracle
 Set OraDatabase = OraSession.OpenDatabase("exampledb", "scott/tiger", 0&)
 
 'Set database property of the generated DEPTPKG object
 dept_pkg.database = OraDatabase

End Sub

Private Sub mDeptNo_Click()

  MsgBox "If the table was created with the sql file provided, " & _
          "following Dept Id's should be in the table :  " & _
          "10, 20, 30"

End Sub

Private Sub mExit_Click()

  End
  
End Sub
