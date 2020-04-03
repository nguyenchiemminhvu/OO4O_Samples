VERSION 5.00
Begin VB.Form frmOIP 
   Appearance      =   0  'Flat
   BackColor       =   &H80000005&
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Employee Form"
   ClientHeight    =   3585
   ClientLeft      =   2055
   ClientTop       =   2310
   ClientWidth     =   6345
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
   LinkTopic       =   "Form1"
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   3585
   ScaleWidth      =   6345
   Begin VB.CommandButton cmdFirst 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "First"
      Height          =   495
      Left            =   240
      TabIndex        =   8
      Top             =   3000
      Width           =   1215
   End
   Begin VB.CommandButton cmdLast 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "Last"
      Height          =   495
      Left            =   4920
      TabIndex        =   11
      Top             =   3000
      Width           =   1215
   End
   Begin VB.CommandButton cmdNext 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "Next"
      Height          =   495
      Left            =   3600
      TabIndex        =   10
      Top             =   3000
      Width           =   1215
   End
   Begin VB.CommandButton cmdPrevious 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "Previous"
      Height          =   495
      Left            =   1560
      TabIndex        =   9
      Top             =   3000
      Width           =   1215
   End
   Begin VB.TextBox txtComm 
      Appearance      =   0  'Flat
      Height          =   285
      Left            =   2640
      TabIndex        =   6
      Top             =   2280
      Width           =   1215
   End
   Begin VB.TextBox txtDeptno 
      Appearance      =   0  'Flat
      Height          =   285
      Left            =   2640
      TabIndex        =   7
      Top             =   2640
      Width           =   1215
   End
   Begin VB.TextBox txtSal 
      Appearance      =   0  'Flat
      Height          =   285
      Left            =   2640
      TabIndex        =   5
      Top             =   1920
      Width           =   1215
   End
   Begin VB.TextBox txtHireDate 
      Appearance      =   0  'Flat
      Height          =   285
      Left            =   2640
      TabIndex        =   4
      Top             =   1560
      Width           =   1215
   End
   Begin VB.TextBox txtMgr 
      Appearance      =   0  'Flat
      Height          =   285
      Left            =   2640
      TabIndex        =   3
      Top             =   1200
      Width           =   1215
   End
   Begin VB.TextBox txtJob 
      Appearance      =   0  'Flat
      Height          =   285
      Left            =   2640
      TabIndex        =   2
      Top             =   840
      Width           =   2895
   End
   Begin VB.TextBox txtEname 
      Appearance      =   0  'Flat
      Height          =   285
      Left            =   2640
      TabIndex        =   1
      Top             =   480
      Width           =   2895
   End
   Begin VB.TextBox txtEmpno 
      Appearance      =   0  'Flat
      Height          =   285
      Left            =   2640
      TabIndex        =   0
      Top             =   120
      Width           =   1215
   End
   Begin VB.Label Label8 
      Alignment       =   1  'Right Justify
      Appearance      =   0  'Flat
      AutoSize        =   -1  'True
      BackColor       =   &H80000005&
      Caption         =   "Department Number:"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Left            =   360
      TabIndex        =   19
      Top             =   2640
      Width           =   2175
   End
   Begin VB.Label Label7 
      Alignment       =   1  'Right Justify
      Appearance      =   0  'Flat
      AutoSize        =   -1  'True
      BackColor       =   &H80000005&
      Caption         =   "Commission:"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Left            =   1200
      TabIndex        =   18
      Top             =   2280
      Width           =   1335
   End
   Begin VB.Label Label6 
      Alignment       =   1  'Right Justify
      Appearance      =   0  'Flat
      AutoSize        =   -1  'True
      BackColor       =   &H80000005&
      Caption         =   "Salary:"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Left            =   1680
      TabIndex        =   17
      Top             =   1920
      Width           =   855
   End
   Begin VB.Label Label5 
      Alignment       =   1  'Right Justify
      Appearance      =   0  'Flat
      AutoSize        =   -1  'True
      BackColor       =   &H80000005&
      Caption         =   "Hire Date:"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Left            =   1440
      TabIndex        =   16
      Top             =   1560
      Width           =   1095
   End
   Begin VB.Label Label4 
      Alignment       =   1  'Right Justify
      Appearance      =   0  'Flat
      AutoSize        =   -1  'True
      BackColor       =   &H80000005&
      Caption         =   "Manager:"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   240
      Left            =   1560
      TabIndex        =   15
      Top             =   1200
      Width           =   990
   End
   Begin VB.Label Label3 
      Alignment       =   1  'Right Justify
      Appearance      =   0  'Flat
      AutoSize        =   -1  'True
      BackColor       =   &H80000005&
      Caption         =   "Job:"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Left            =   2040
      TabIndex        =   14
      Top             =   840
      Width           =   495
   End
   Begin VB.Label Label2 
      Alignment       =   1  'Right Justify
      Appearance      =   0  'Flat
      AutoSize        =   -1  'True
      BackColor       =   &H80000005&
      Caption         =   "Employee Name:"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Left            =   720
      TabIndex        =   13
      Top             =   480
      Width           =   1815
   End
   Begin VB.Label Label1 
      Alignment       =   1  'Right Justify
      Appearance      =   0  'Flat
      AutoSize        =   -1  'True
      BackColor       =   &H80000005&
      Caption         =   "Employee Number:"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Left            =   480
      TabIndex        =   12
      Top             =   120
      Width           =   2055
   End
   Begin VB.Menu mExit 
      Caption         =   "E&xit!"
   End
End
Attribute VB_Name = "frmOIP"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub cmdFirst_Click()

 ODynaset.MoveFirst
 Call EmpRefresh

End Sub

Private Sub cmdLast_Click()

 ODynaset.MoveLast
 Call EmpRefresh

End Sub

Private Sub cmdNext_Click()

 If ODynaset.EOF <> True Then
  ODynaset.MoveNext
  If ODynaset.EOF = True Then
   MsgBox WarnLastEmp$
   ODynaset.MoveLast
  End If
 End If

 Call EmpRefresh

End Sub

Private Sub cmdPrevious_Click()

 If ODynaset.BOF <> True Then
  ODynaset.MovePrevious
  If ODynaset.BOF = True Then
   MsgBox WarnFirstEmp$
   ODynaset.MoveFirst
  End If
 End If

 Call EmpRefresh

End Sub

Private Sub EmpRefresh()

 If ODynaset.BOF <> True And ODynaset.EOF <> True Then
 
  'empno and deptno are never NULL
  txtEmpno = ODynaset.Fields("empno").Value
  txtDeptno = ODynaset.Fields("deptno").Value

   'check if ename=NULL
  If IsNull(ODynaset.Fields("ename").Value) Then
   txtEname = ""
  Else
   txtEname = ODynaset.Fields("ename").Value
  End If

 'check if job=NULL
 If IsNull(ODynaset.Fields("job").Value) Then
   txtJob = ""
  Else
   txtJob = ODynaset.Fields("job").Value
  End If

  'check if mgr=NULL
  If IsNull(ODynaset.Fields("mgr").Value) Then
   txtMgr = ""
  Else
   txtMgr = ODynaset.Fields("mgr").Value
  End If

  'check if hiredate=NULL
  If IsNull(ODynaset.Fields("hiredate").Value) Then
   txtHireDate = ""
  Else
   txtHireDate = ODynaset.Fields("hiredate").Value
  End If

  'check if sal=NULL
  If IsNull(ODynaset.Fields("sal").Value) Then
   txtSal = ""
  Else
   txtSal = ODynaset.Fields("sal").Value
  End If

  'check if comm=NULL
  If IsNull(ODynaset.Fields("comm").Value) Then
   txtComm = ""
  Else
   txtComm = ODynaset.Fields("comm").Value
  End If

 Else
      
  txtEmpno = ""
  txtEname = ""
  txtJob = ""
  txtMgr = ""
  txtHireDate = ""
  txtSal = ""
  txtComm = ""
  txtDeptno = ""

 End If

End Sub

Private Sub Form_Load()

'OSession and ODatabase are global
 Set OSession = CreateObject("OracleInProcServer.XOraSession")
 Set ODatabase = OSession.OpenDatabase(DatabaseName$, Connect$, 0&)
 Set ODynaset = ODatabase.CreateDynaset(EmpQuery$, 0&)
 
 Call EmpRefresh

End Sub

Private Sub mExit_Click()
 End
End Sub

