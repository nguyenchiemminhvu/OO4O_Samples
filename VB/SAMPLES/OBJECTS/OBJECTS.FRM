VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   7410
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   8415
   LinkTopic       =   "Form1"
   ScaleHeight     =   7410
   ScaleWidth      =   8415
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Move_Last 
      Caption         =   "Move Last"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   6240
      TabIndex        =   16
      Top             =   6120
      Width           =   1215
   End
   Begin VB.CommandButton Move_Prev 
      Caption         =   "Move Prev"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   2520
      TabIndex        =   15
      Top             =   6120
      Width           =   1335
   End
   Begin VB.CommandButton Move_Next 
      Caption         =   "Move Next"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   4320
      TabIndex        =   14
      Top             =   6120
      Width           =   1335
   End
   Begin VB.CommandButton Move_First 
      Caption         =   "Move First"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   600
      TabIndex        =   13
      Top             =   6120
      Width           =   1455
   End
   Begin VB.TextBox Account 
      Height          =   405
      Left            =   4920
      TabIndex        =   12
      Top             =   2160
      Width           =   975
   End
   Begin VB.Frame Frame1 
      Caption         =   "Person  Object"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   2895
      Left            =   2400
      TabIndex        =   2
      Top             =   2760
      Width           =   3495
      Begin VB.TextBox Age 
         Height          =   285
         Left            =   1200
         TabIndex        =   9
         Top             =   960
         Width           =   1455
      End
      Begin VB.TextBox PersonName 
         Height          =   285
         Left            =   1200
         TabIndex        =   8
         Top             =   480
         Width           =   1455
      End
      Begin VB.Frame Frame2 
         Caption         =   "Address Object"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   1215
         Left            =   240
         TabIndex        =   5
         Top             =   1440
         Width           =   2655
         Begin VB.TextBox Zip 
            Height          =   285
            Left            =   960
            TabIndex        =   0
            Top             =   720
            Width           =   1455
         End
         Begin VB.TextBox City 
            Height          =   285
            Left            =   960
            TabIndex        =   10
            Top             =   360
            Width           =   1455
         End
         Begin VB.Label Label8 
            Caption         =   "Zip"
            BeginProperty Font 
               Name            =   "MS Sans Serif"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   255
            Left            =   240
            TabIndex        =   7
            Top             =   720
            Width           =   735
         End
         Begin VB.Label Label6 
            Caption         =   "City"
            BeginProperty Font 
               Name            =   "MS Sans Serif"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   255
            Left            =   240
            TabIndex        =   6
            Top             =   360
            Width           =   735
         End
      End
      Begin VB.Label Label5 
         Caption         =   "Age"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   240
         TabIndex        =   4
         Top             =   960
         Width           =   855
      End
      Begin VB.Label Label4 
         Caption         =   "Name"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   240
         TabIndex        =   3
         Top             =   480
         Width           =   855
      End
   End
   Begin VB.Label Label2 
      Caption         =   "Customer Account No"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   2400
      TabIndex        =   11
      Top             =   2160
      Width           =   2415
   End
   Begin VB.Label Label1 
      Caption         =   "Oracle Objects Demo"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   -1  'True
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   2400
      TabIndex        =   1
      Top             =   720
      Width           =   3255
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
 Dim OraSession As OraSession
 Dim OraDatabase As OraDatabase
 Dim Customers As OraDynaset
 Dim Person As OraRef
 Dim Address As OraObject

 

Private Sub Customers_Reposition()



End Sub

Private Sub Form_Load()
 'Create the OraSession Object.
 Set OraSession = CreateObject("OracleInProcServer.XOraSession")

 'Create the OraDatabase Object by opening a connection to Oracle.
 Set OraDatabase = OraSession.DbOpenDatabase("exampledb", "scott/tiger", 0&)

 'Create the OraDynaset Object
 Set Customers = OraDatabase.CreateDynaset("select * from customers", 0&)
 
 'Get the person object
 Set Person = Customers.Fields("aperson").Value
 
 'Get the Address object
 Set Address = Person.Addr

 CustomerRefresh
 
End Sub

Private Sub Move_First_Click()
    Customers.MoveFirst

    CustomerRefresh
End Sub

Private Sub Move_Last_Click()
    Customers.MoveLast

    CustomerRefresh
End Sub

Private Sub Move_Next_Click()
    Customers.MoveNext
    
    If (Customers.EOF <> True) Then
        CustomerRefresh
    End If
End Sub

Private Sub Move_Prev_Click()

    Customers.MovePrevious
    
    If (Customers.BOF <> True) Then
        CustomerRefresh
    End If

End Sub

Public Sub CustomerRefresh()

    Account.Text = Customers.Fields("account").Value
    
    PersonName.Text = Person.Name
    Age.Text = Person.Age

    City.Text = Address.City
    Zip.Text = Address.Zip

End Sub
