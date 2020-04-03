VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "EmpData Form"
   ClientHeight    =   5790
   ClientLeft      =   165
   ClientTop       =   735
   ClientWidth     =   7425
   LinkTopic       =   "Form1"
   ScaleHeight     =   5790
   ScaleWidth      =   7425
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Command1 
      Caption         =   "Get Employees"
      Height          =   495
      Left            =   1440
      TabIndex        =   22
      Top             =   960
      Width           =   2895
   End
   Begin VB.TextBox txtEmpno 
      Height          =   285
      Left            =   3120
      TabIndex        =   12
      Top             =   2040
      Width           =   1215
   End
   Begin VB.TextBox txtEname 
      Appearance      =   0  'Flat
      Height          =   285
      Left            =   3120
      TabIndex        =   11
      Top             =   2400
      Width           =   2895
   End
   Begin VB.TextBox txtJob 
      Appearance      =   0  'Flat
      Height          =   285
      Left            =   3120
      TabIndex        =   10
      Top             =   2760
      Width           =   2895
   End
   Begin VB.TextBox txtMgr 
      Appearance      =   0  'Flat
      Height          =   285
      Left            =   3120
      TabIndex        =   9
      Top             =   3120
      Width           =   1215
   End
   Begin VB.TextBox txtHireDate 
      Appearance      =   0  'Flat
      Height          =   285
      Left            =   3120
      TabIndex        =   8
      Top             =   3480
      Width           =   1215
   End
   Begin VB.TextBox txtSal 
      Appearance      =   0  'Flat
      Height          =   285
      Left            =   3120
      TabIndex        =   7
      Top             =   3840
      Width           =   1215
   End
   Begin VB.TextBox txtComm 
      Appearance      =   0  'Flat
      Height          =   285
      Left            =   3120
      TabIndex        =   6
      Top             =   4200
      Width           =   1215
   End
   Begin VB.TextBox txtDeptno 
      Appearance      =   0  'Flat
      Height          =   285
      Left            =   3120
      TabIndex        =   5
      Top             =   480
      Width           =   1215
   End
   Begin VB.TextBox txtEmpDeptno 
      Appearance      =   0  'Flat
      Height          =   285
      Left            =   3120
      TabIndex        =   4
      Top             =   4560
      Width           =   1215
   End
   Begin VB.CommandButton cmdEmpFirst 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "First"
      Height          =   495
      Left            =   1080
      TabIndex        =   3
      Top             =   5160
      Width           =   1215
   End
   Begin VB.CommandButton cmdEmpPrevious 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "Previous"
      Height          =   495
      Left            =   2400
      TabIndex        =   2
      Top             =   5160
      Width           =   1215
   End
   Begin VB.CommandButton cmdEmpLast 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "Last"
      Height          =   495
      Left            =   5520
      TabIndex        =   1
      Top             =   5160
      Width           =   1215
   End
   Begin VB.CommandButton cmdEmpNext 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "Next"
      Height          =   495
      Left            =   4200
      TabIndex        =   0
      Top             =   5160
      Width           =   1215
   End
   Begin VB.Label Label1 
      Alignment       =   1  'Right Justify
      AutoSize        =   -1  'True
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
      Height          =   255
      Left            =   960
      TabIndex        =   21
      Top             =   2040
      Width           =   2055
   End
   Begin VB.Label Label2 
      Alignment       =   1  'Right Justify
      AutoSize        =   -1  'True
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
      Height          =   255
      Left            =   1200
      TabIndex        =   20
      Top             =   2400
      Width           =   1815
   End
   Begin VB.Label Label3 
      Alignment       =   1  'Right Justify
      AutoSize        =   -1  'True
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
      Height          =   255
      Left            =   2520
      TabIndex        =   19
      Top             =   2760
      Width           =   495
   End
   Begin VB.Label Label4 
      Alignment       =   1  'Right Justify
      AutoSize        =   -1  'True
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
      Height          =   240
      Left            =   2040
      TabIndex        =   18
      Top             =   3120
      Width           =   990
   End
   Begin VB.Label Label5 
      Alignment       =   1  'Right Justify
      AutoSize        =   -1  'True
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
      Height          =   255
      Left            =   1920
      TabIndex        =   17
      Top             =   3480
      Width           =   1095
   End
   Begin VB.Label Label6 
      Alignment       =   1  'Right Justify
      AutoSize        =   -1  'True
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
      Height          =   255
      Left            =   2160
      TabIndex        =   16
      Top             =   3840
      Width           =   855
   End
   Begin VB.Label Label7 
      Alignment       =   1  'Right Justify
      AutoSize        =   -1  'True
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
      Height          =   255
      Left            =   1680
      TabIndex        =   15
      Top             =   4200
      Width           =   1335
   End
   Begin VB.Label Label9 
      Alignment       =   1  'Right Justify
      AutoSize        =   -1  'True
      Caption         =   "Enter Department Number:"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   240
      Left            =   240
      TabIndex        =   14
      Top             =   480
      Width           =   2745
   End
   Begin VB.Line Line1 
      BorderWidth     =   3
      X1              =   720
      X2              =   6960
      Y1              =   1680
      Y2              =   1680
   End
   Begin VB.Label Label8 
      Alignment       =   1  'Right Justify
      AutoSize        =   -1  'True
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
      Height          =   240
      Left            =   930
      TabIndex        =   13
      Top             =   4560
      Width           =   2145
   End
   Begin VB.Menu mSampleDeptNo 
      Caption         =   "Sample &DeptNo"
   End
   Begin VB.Menu mExit 
      Caption         =   "E&xit!"
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub cmdEmpFirst_Click()

 Employees.DbMoveFirst
 Call EmpRefresh

End Sub

Private Sub cmdEmpLast_Click()
 
 Employees.DbMoveLast
 Call EmpRefresh

End Sub

Private Sub cmdEmpNext_Click()
 
 If Employees.EOF <> True Then
  Employees.DbMoveNext
  If Employees.EOF = True Then
   MsgBox WarnLastEmp$
   Employees.DbMoveLast
  End If
 End If

 Call EmpRefresh

End Sub

Private Sub cmdEmpPrevious_Click()

 If Employees.BOF <> True Then
  Employees.DbMovePrevious
  If Employees.BOF = True Then
   MsgBox WarnFirstEmp$
   Employees.DbMoveFirst
  End If
 End If

 Call EmpRefresh

End Sub

Private Sub Command1_Click()

  If txtDeptno <> "" Then

   'get Employees dynaset
    emp_pkg.GETEMPDATA txtDeptno, Employees
    'Refresh employee information
    Call EmpRefresh
  
  End If

End Sub

Private Sub EmpRefresh()

  If Employees.EOF <> True And Employees.BOF <> True Then

    'empno is never NULL
    txtEmpno = Employees("empno").Value
    txtEname = Employees("ename").Value
    txtJob = Employees("job").Value
    
    'check if mgr=nul
    If Not IsNull(Employees("mgr").Value) Then
      txtMgr = Employees("mgr").Value
    Else
      txtMgr = ""
    End If

    txtHireDate = Employees("hiredate").Value
    txtSal = Employees("sal").Value

    'check if comm=nul
    If Not IsNull(Employees("comm").Value) Then
      txtComm = Employees("comm").Value
    Else
      txtComm = ""
    End If

    txtEmpDeptno = Employees("deptno").Value
    
  Else
  
    txtEmpno = ""
    txtEname = ""
    txtJob = ""
    txtMgr = ""
    txtHireDate = ""
    txtSal = ""
    txtComm = ""
    txtEmpDeptno = ""

  End If

End Sub

Private Sub Form_Load()

  'Session and Database are declared public in emp.bas
  'Create the OraSession Object
  Set OraSession = New OraSessionClass

  'Create the OraDatabase Object
  Set OraDatabase = OraSession.OpenDatabase("exampledb", "scott/tiger", 0&)
 
  'Set database property of the generated EMPLOYEE object
  emp_pkg.database = OraDatabase

End Sub

Private Sub mExit_Click()
  
  End
  
End Sub

Private Sub mSampleDeptNo_Click()

  MsgBox "Department Numbers in the standard Emp table : 10, 20, 30"

End Sub
