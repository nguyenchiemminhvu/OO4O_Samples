VERSION 5.00
Object = "{92096210-97DF-11CF-9F27-02608C4BF3B5}#1.0#0"; "oradc.ocx"
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   7590
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   8970
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
   ScaleHeight     =   7590
   ScaleWidth      =   8970
   StartUpPosition =   3  'Windows Default
   Begin VB.TextBox Text2 
      DataField       =   "DEPT_ID"
      DataSource      =   "Department"
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
      Left            =   2880
      TabIndex        =   7
      Text            =   "Text2"
      Top             =   3840
      Width           =   1575
   End
   Begin VB.TextBox Text1 
      DataField       =   "NAME"
      DataSource      =   "Department"
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
      Left            =   2880
      TabIndex        =   6
      Text            =   "Text1"
      Top             =   3120
      Width           =   1575
   End
   Begin ORADCLibCtl.ORADC Department 
      Height          =   375
      Left            =   960
      Top             =   6000
      Width           =   3495
      _Version        =   65536
      _ExtentX        =   6165
      _ExtentY        =   661
      _StockProps     =   207
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.24
         Charset         =   0
         Weight          =   400
         Underline       =   -1  'True
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      DatabaseName    =   "exampledb"
      Connect         =   "scott/tiger"
      RecordSource    =   "select * from department"
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
      Left            =   4920
      TabIndex        =   2
      Top             =   3120
      Width           =   2055
   End
   Begin VB.Label Label5 
      Caption         =   "Department No"
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
      Left            =   480
      TabIndex        =   5
      Top             =   3840
      Width           =   2175
   End
   Begin VB.Label Label4 
      Caption         =   "Department Name"
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
      Left            =   480
      TabIndex        =   4
      Top             =   3120
      Width           =   2175
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
      Left            =   4920
      TabIndex        =   3
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
      Left            =   360
      TabIndex        =   1
      Top             =   2040
      Width           =   2295
   End
   Begin VB.Label Label1 
      Caption         =   "VARRAY Example"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   -1  'True
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   2640
      TabIndex        =   0
      Top             =   720
      Width           =   2655
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub ORADC1_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)

End Sub

Private Sub Department_Reposition()

Dim Enames As OraCollection

'get Enames VARRAY column from department table
Set Enames = Department.Recordset.Fields("ENAMES").Value

'populate all the elements of Enamelist into the listbox
EnameList.Clear

For I = 1 To Enames.Size
    EnameList.AddItem Enames(I)
Next I

End Sub
