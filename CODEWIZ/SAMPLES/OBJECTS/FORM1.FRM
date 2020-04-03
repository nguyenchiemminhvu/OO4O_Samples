VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Objects Form"
   ClientHeight    =   3540
   ClientLeft      =   165
   ClientTop       =   735
   ClientWidth     =   4410
   LinkTopic       =   "Form1"
   ScaleHeight     =   3540
   ScaleWidth      =   4410
   StartUpPosition =   3  'Windows Default
   Begin VB.ListBox AddrList 
      Height          =   840
      Left            =   1320
      TabIndex        =   4
      Top             =   2280
      Width           =   2055
   End
   Begin VB.TextBox txtName 
      Height          =   375
      Left            =   1440
      TabIndex        =   1
      Top             =   360
      Width           =   1935
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Get Address"
      Height          =   375
      Left            =   1440
      TabIndex        =   0
      Top             =   960
      Width           =   1935
   End
   Begin VB.Label Label3 
      Alignment       =   2  'Center
      Caption         =   "Address"
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
      Top             =   1800
      Width           =   2175
   End
   Begin VB.Line Line1 
      X1              =   240
      X2              =   4080
      Y1              =   1560
      Y2              =   1560
   End
   Begin VB.Label Label1 
      Alignment       =   1  'Right Justify
      Caption         =   "Enter Name:"
      Height          =   375
      Left            =   360
      TabIndex        =   2
      Top             =   360
      Width           =   975
   End
   Begin VB.Menu mNames 
      Caption         =   "Sample &Names"
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
Public OraDatabase As OraDatabase
Public OraDynaset As OraDynaset
Public object_pkg As New PERSONPKG
Public addrobj As OraObject

Private Sub Command1_Click()

  If txtName <> "" Then
     
    'get person object column from person_tab table
    object_pkg.GETADDRESS txtName, addrobj
    
    'populate all the elements of AddrList into the listbox
    AddrList.Clear
    For i = 1 To addrobj.Count
       AddrList.AddItem addrobj(i)
    Next i

  End If

End Sub

Private Sub Form_Load()

 'Create the OraSession Object.
 Set OraSession = New OraSessionClass

 'Create the OraDatabase Object by opening a connection to Oracle
 Set OraDatabase = OraSession.OpenDatabase("exampledb", "scott/tiger", 0&)
 
 'Set database property of the generated PERSONPKG object
 object_pkg.database = OraDatabase

End Sub

Private Sub mExit_Click()
  End
End Sub

Private Sub mNames_Click()
  MsgBox "If the table was created with the sql file provided, " & _
          "following Names should be in the table :  " & _
          "Nasser, Maha, Chris, Gopal, Ashish"
End Sub
