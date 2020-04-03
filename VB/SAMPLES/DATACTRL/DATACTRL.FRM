VERSION 5.00
Object = "{00028C01-0000-0000-0000-000000000046}#1.0#0"; "DBGRID32.OCX"
Object = "{92096210-97DF-11CF-9F27-02608C4BF3B5}#1.0#0"; "oradc.ocx"
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   9615
   ClientLeft      =   1620
   ClientTop       =   2085
   ClientWidth     =   8640
   LinkTopic       =   "Form1"
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   9615
   ScaleWidth      =   8640
   Begin VB.Frame Frame3 
      Caption         =   "SQL Statement"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   975
      Left            =   600
      TabIndex        =   32
      Top             =   6720
      Width           =   7335
      Begin VB.CommandButton Command12 
         Caption         =   "Execute"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   5400
         TabIndex        =   1
         Top             =   360
         Width           =   1815
      End
      Begin VB.TextBox sqlstmt 
         Height          =   375
         Left            =   240
         TabIndex        =   33
         Text            =   "select * from emp"
         Top             =   360
         Width           =   4935
      End
   End
   Begin VB.CommandButton Command11 
      Caption         =   "Refresh"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   5400
      TabIndex        =   31
      Top             =   8040
      Width           =   1695
   End
   Begin VB.CommandButton Command10 
      Caption         =   "Delete"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   3480
      TabIndex        =   30
      Top             =   8040
      Width           =   1695
   End
   Begin VB.CommandButton Command9 
      Caption         =   "Update"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   1440
      TabIndex        =   29
      Top             =   8040
      Width           =   1815
   End
   Begin VB.CommandButton Command8 
      Caption         =   "Rollback Transcation"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   5760
      TabIndex        =   28
      Top             =   8760
      Width           =   2175
   End
   Begin VB.CommandButton Command7 
      Caption         =   "Commit Transcation"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   3120
      TabIndex        =   27
      Top             =   8760
      Width           =   2295
   End
   Begin VB.CommandButton Command6 
      Caption         =   "Begin Transcation"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   600
      TabIndex        =   26
      Top             =   8760
      Width           =   2175
   End
   Begin VB.Frame Frame2 
      Caption         =   "Move"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1575
      Left            =   4560
      TabIndex        =   21
      Top             =   4920
      Width           =   3375
      Begin VB.TextBox movetxt 
         Height          =   375
         Left            =   1680
         TabIndex        =   25
         Top             =   840
         Width           =   1095
      End
      Begin VB.CommandButton Command5 
         Caption         =   "Move"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   240
         TabIndex        =   24
         Top             =   840
         Width           =   1095
      End
      Begin VB.OptionButton MoveTo 
         Caption         =   "MoveTo"
         Height          =   255
         Left            =   2040
         TabIndex        =   23
         Top             =   360
         Width           =   975
      End
      Begin VB.OptionButton MoveRelative 
         Caption         =   "MoveRelative"
         Height          =   255
         Left            =   240
         TabIndex        =   22
         Top             =   360
         Width           =   1455
      End
   End
   Begin VB.Frame Frame1 
      Caption         =   "Find"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1575
      Left            =   600
      TabIndex        =   8
      Top             =   4920
      Width           =   3495
      Begin VB.TextBox findexpr 
         Height          =   375
         Left            =   1200
         TabIndex        =   20
         Text            =   "Job = 'MANAGER'"
         Top             =   840
         Width           =   2175
      End
      Begin VB.CommandButton Find 
         Caption         =   "Find"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   240
         TabIndex        =   19
         Top             =   840
         Width           =   735
      End
      Begin VB.OptionButton findprev 
         Caption         =   "Prev"
         Height          =   255
         Left            =   960
         TabIndex        =   18
         Top             =   360
         Width           =   255
      End
      Begin VB.OptionButton findlast 
         Caption         =   "Last"
         Height          =   255
         Left            =   2520
         TabIndex        =   13
         Top             =   360
         Width           =   255
      End
      Begin VB.OptionButton findnext 
         Caption         =   "Next"
         Height          =   255
         Left            =   1680
         TabIndex        =   12
         Top             =   360
         Value           =   -1  'True
         Width           =   255
      End
      Begin VB.OptionButton findfirst 
         Caption         =   "First"
         Height          =   255
         Left            =   240
         TabIndex        =   9
         Top             =   360
         Width           =   255
      End
      Begin VB.Label Label8 
         Caption         =   "Last"
         Height          =   255
         Left            =   2760
         TabIndex        =   17
         Top             =   360
         Width           =   615
      End
      Begin VB.Label Label7 
         Caption         =   "Next"
         Height          =   255
         Left            =   1920
         TabIndex        =   16
         Top             =   360
         Width           =   615
      End
      Begin VB.Label Label6 
         Caption         =   "Prev"
         Height          =   255
         Left            =   1200
         TabIndex        =   15
         Top             =   360
         Width           =   495
      End
      Begin VB.Label Label3 
         Caption         =   "First"
         Height          =   255
         Left            =   480
         TabIndex        =   10
         Top             =   360
         Width           =   495
      End
   End
   Begin VB.CommandButton Command4 
      Caption         =   ">I"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   6480
      TabIndex        =   7
      Top             =   4200
      Width           =   1095
   End
   Begin VB.CommandButton Command3 
      Caption         =   ">"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   4680
      TabIndex        =   6
      Top             =   4200
      Width           =   1095
   End
   Begin VB.CommandButton Command2 
      Caption         =   "<"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   2640
      TabIndex        =   5
      Top             =   4200
      Width           =   1095
   End
   Begin VB.CommandButton Command1 
      Caption         =   "I<"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Index           =   0
      Left            =   840
      TabIndex        =   4
      Top             =   4200
      Width           =   1095
   End
   Begin ORADCLibCtl.ORADC empdetails 
      Height          =   270
      Left            =   240
      Top             =   120
      Visible         =   0   'False
      Width           =   2655
      _Version        =   65536
      _ExtentX        =   4683
      _ExtentY        =   476
      _StockProps     =   207
      Caption         =   "Employee Details"
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      DatabaseName    =   "exampledb"
      Connect         =   "scott/tiger"
      RecordSource    =   "select * from emp"
   End
   Begin MSDBGrid.DBGrid DBGrid1 
      Bindings        =   "datactrl.frx":0000
      Height          =   2175
      Left            =   600
      OleObjectBlob   =   "datactrl.frx":0019
      TabIndex        =   2
      Top             =   1560
      Width           =   7335
   End
   Begin VB.Label Label5 
      Caption         =   "Prev"
      Height          =   255
      Left            =   1800
      TabIndex        =   14
      Top             =   5280
      Width           =   495
   End
   Begin VB.Label Label4 
      Caption         =   "First"
      Height          =   255
      Left            =   1800
      TabIndex        =   11
      Top             =   5280
      Width           =   495
   End
   Begin VB.Label Label2 
      Caption         =   "Employee Details"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   -1  'True
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   600
      TabIndex        =   3
      Top             =   1080
      Width           =   2055
   End
   Begin VB.Label Label1 
      Caption         =   "Programmatic Access to Oracle Data Control"
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
      Left            =   1080
      TabIndex        =   0
      Top             =   480
      Width           =   6375
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click(Index As Integer)
empdetails.Recordset.MoveFirst
End Sub

Private Sub Command10_Click()
    empdetails.Recordset.Delete
    empdetails.Recordset.Refresh
End Sub

Private Sub Command11_Click()
 empdetails.Recordset.Refresh
End Sub


Private Sub Command12_Click()
  empdetails.Recordset.SQL = sqlstmt.Text
  empdetails.Recordset.Refresh

End Sub

Private Sub Command2_Click()
'Make sure we are not at first record
If empdetails.Recordset.IsFirst = True Then
    MsgBox "At First Record "
Else
    empdetails.Recordset.MovePrevious
End If
End Sub


Private Sub Command3_Click()
'Make sure we are not at last record
If empdetails.Recordset.IsLast = True Then
    MsgBox "At Last Record "
Else
    empdetails.Recordset.MoveNext
End If

End Sub


Private Sub Command4_Click()
empdetails.Recordset.MoveLast
End Sub


Private Sub Command5_Click()
If movetxt.Text <> "" Then
 If MoveRelative.Value = True Then
    empdetails.Recordset.MoveRel CInt(movetxt.Text)
 ElseIf MoveTo.Value = True Then
    empdetails.Recordset.MoveTo CInt(movetxt.Text)
 End If
End If
End Sub


Private Sub Command6_Click()
empdetails.Session.BeginTrans
End Sub

Private Sub Command7_Click()
empdetails.Session.CommitTrans
End Sub


Private Sub Command8_Click()
 empdetails.Session.rollback
End Sub


Private Sub Command9_Click()
  empdetails.Recordset.Update
End Sub

Private Sub Find_Click()
If findexpr.Text <> "" Then
 If findfirst.Value = True Then
    empdetails.Recordset.findfirst findexpr
 ElseIf findnext.Value = True Then
    empdetails.Recordset.findnext findexpr
 ElseIf findprev.Value = True Then
    empdetails.Recordset.findprevious findexpr
 ElseIf findlast.Value = True Then
    empdetails.Recordset.findlast findexpr
 End If
 
End If

End Sub


