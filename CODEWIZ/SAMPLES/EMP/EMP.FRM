VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Employee Form"
   ClientHeight    =   4095
   ClientLeft      =   165
   ClientTop       =   735
   ClientWidth     =   6210
   LinkTopic       =   "Form1"
   ScaleHeight     =   4095
   ScaleWidth      =   6210
   StartUpPosition =   3  'Windows Default
   Begin VB.TextBox txtEmpSal 
      Height          =   375
      Left            =   3015
      TabIndex        =   4
      Top             =   2160
      Width           =   1575
   End
   Begin VB.TextBox txtEmpDate 
      Height          =   375
      Left            =   3015
      TabIndex        =   3
      Top             =   1560
      Width           =   1575
   End
   Begin VB.TextBox txtEmpname 
      Height          =   375
      Left            =   3015
      TabIndex        =   2
      Top             =   960
      Width           =   1575
   End
   Begin VB.TextBox txtEmpno 
      Height          =   375
      Left            =   3015
      TabIndex        =   1
      Top             =   360
      Width           =   1575
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Get Employee Information"
      Height          =   495
      Left            =   1560
      TabIndex        =   0
      Top             =   3000
      Width           =   3135
   End
   Begin VB.Label Label4 
      Alignment       =   1  'Right Justify
      Caption         =   "Hire Date:"
      Height          =   375
      Left            =   720
      TabIndex        =   8
      Top             =   1560
      Width           =   2055
   End
   Begin VB.Label Label2 
      Alignment       =   1  'Right Justify
      Caption         =   "Employee Name:"
      Height          =   375
      Left            =   720
      TabIndex        =   7
      Top             =   960
      Width           =   2055
   End
   Begin VB.Label Label1 
      Alignment       =   1  'Right Justify
      Caption         =   "Enter Employee Number:"
      Height          =   375
      Left            =   720
      TabIndex        =   6
      Top             =   360
      Width           =   2055
   End
   Begin VB.Label Label3 
      Alignment       =   1  'Right Justify
      Caption         =   "Salary:"
      Height          =   375
      Left            =   720
      TabIndex        =   5
      Top             =   2160
      Width           =   2055
   End
   Begin VB.Menu mSampleEmpNo 
      Caption         =   "Sample &EmpNo"
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
Private Sub Command1_Click()

 'if txtEmpno is not empty
 If txtEmpno <> "" Then

   'get ename column from emp table
   emp_pkg.GETEMPNAME txtEmpno, ename
   txtEmpname = ename

   'get hiredate column from emp table
   emp_pkg.GETEMPDATE txtEmpno, edate
   txtEmpDate = edate

   'get sal column from emp table
   txtEmpSal = emp_pkg.GETEMPSAL(txtEmpno)

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


Private Sub mSampleEmpNo_Click()

MsgBox "Some of the Employee Numbers in the standard Emp table : 7839, 7698, 7782, 7566"

End Sub
