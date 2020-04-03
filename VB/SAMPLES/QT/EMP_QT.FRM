VERSION 5.00
Begin VB.Form frmEmpBrowse 
   Appearance      =   0  'Flat
   BackColor       =   &H00FFFFFF&
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Employee Form"
   ClientHeight    =   5715
   ClientLeft      =   3840
   ClientTop       =   3300
   ClientWidth     =   5595
   BeginProperty Font 
      Name            =   "MS Sans Serif"
      Size            =   8.25
      Charset         =   0
      Weight          =   700
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   ForeColor       =   &H00E0E0E0&
   LinkTopic       =   "Form1"
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   5715
   ScaleWidth      =   5595
   Begin VB.CommandButton BInsert 
      Caption         =   "Batch Insert"
      Height          =   375
      Left            =   1680
      TabIndex        =   25
      Top             =   5040
      Width           =   1335
   End
   Begin VB.CommandButton cmdDelete 
      Caption         =   "Delete"
      Height          =   375
      Left            =   1320
      TabIndex        =   24
      Top             =   4320
      Width           =   855
   End
   Begin VB.CommandButton cmdFind 
      Caption         =   "Find"
      Height          =   375
      Left            =   2400
      TabIndex        =   23
      Top             =   4320
      Width           =   855
   End
   Begin VB.CommandButton cmdUpdate 
      Caption         =   "Update"
      Height          =   375
      Left            =   2400
      TabIndex        =   22
      Top             =   3720
      Width           =   855
   End
   Begin VB.CommandButton Commit 
      BackColor       =   &H000000FF&
      Caption         =   "Commit"
      Enabled         =   0   'False
      Height          =   375
      Left            =   3720
      TabIndex        =   21
      Top             =   3720
      Width           =   975
   End
   Begin VB.CommandButton AddNew 
      BackColor       =   &H00C0C000&
      Caption         =   "Add"
      Height          =   375
      Left            =   1320
      TabIndex        =   20
      Top             =   3720
      Width           =   855
   End
   Begin VB.CommandButton cmdFirst 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "|<"
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
      Left            =   1320
      TabIndex        =   8
      Top             =   3120
      Width           =   615
   End
   Begin VB.CommandButton cmdLast 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   ">|"
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
      Left            =   4080
      TabIndex        =   11
      Top             =   3120
      Width           =   615
   End
   Begin VB.CommandButton cmdNext 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
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
      Height          =   375
      Left            =   3120
      TabIndex        =   10
      Top             =   3120
      Width           =   735
   End
   Begin VB.CommandButton cmdPrevious 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
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
      Height          =   375
      Left            =   2160
      TabIndex        =   9
      Top             =   3120
      Width           =   735
   End
   Begin VB.TextBox txtComm 
      Height          =   285
      Left            =   2640
      TabIndex        =   6
      Top             =   2280
      Width           =   1215
   End
   Begin VB.TextBox txtDeptno 
      Height          =   285
      Left            =   2640
      TabIndex        =   7
      Top             =   2640
      Width           =   1215
   End
   Begin VB.TextBox txtSal 
      Height          =   285
      Left            =   2640
      TabIndex        =   5
      Top             =   1920
      Width           =   1215
   End
   Begin VB.TextBox txtHireDate 
      Height          =   285
      Left            =   2640
      TabIndex        =   4
      Top             =   1560
      Width           =   1215
   End
   Begin VB.TextBox txtMgr 
      Height          =   285
      Left            =   2640
      TabIndex        =   3
      Top             =   1200
      Width           =   1215
   End
   Begin VB.TextBox txtJob 
      Height          =   285
      Left            =   2640
      MaxLength       =   9
      TabIndex        =   2
      Top             =   840
      Width           =   2895
   End
   Begin VB.TextBox txtEname 
      Height          =   285
      Left            =   2640
      MaxLength       =   10
      TabIndex        =   1
      Top             =   480
      Width           =   2895
   End
   Begin VB.TextBox txtEmpno 
      Height          =   285
      Left            =   2640
      MaxLength       =   4
      TabIndex        =   0
      Top             =   120
      Width           =   1215
   End
   Begin VB.Label Label8 
      Alignment       =   1  'Right Justify
      Appearance      =   0  'Flat
      AutoSize        =   -1  'True
      BackColor       =   &H00FFFFFF&
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
      BackColor       =   &H00FFFFFF&
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
      BackColor       =   &H00FFFFFF&
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
      BackColor       =   &H00FFFFFF&
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
      BackColor       =   &H00FFFFFF&
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
      BackColor       =   &H00FFFFFF&
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
      BackColor       =   &H00FFFFFF&
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
      BackColor       =   &H00FFFFFF&
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
Attribute VB_Name = "frmEmpBrowse"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Function DoValidationChecks() As Boolean

Dim DupDyn As Object
Dim DupDynQry As String

On Error GoTo err_ValidationCheck

ErrMsg = ""
'Empno cannot be changed while in Update mode, so we can skip over validation
If DoAdd Then
    If txtEmpno = "" Then
        ErrMsg = "You must enter a value for Employee Number"
        Error 1
    End If
End If

If txtHireDate <> "" And Not IsDate(txtHireDate) Then
    ErrMsg = "Enter date as dd-mmm-yy."
    Error 2
End If

If txtDeptno = "" Then
    ErrMsg = "You must enter a value for Department Number"
    Error 3
End If

'If adding a record, check for Duplicate empno value by
'attempting to count rows with same value
'Build Query:
If DoAdd Then
    DupDynQry = "select count(*) from emp where empno = " & txtEmpno
    Set DupDyn = OraDatabase.DbCreateDynaset(DupDynQry, ORADYN_NOCACHE)

    If DupDyn.Fields(0).Value <> 0 Then
        ErrNum = DUPLICATE_KEY
        ErrMsg = "Employee Number already exists."
        Error ErrNum
    End If
End If
'Succesful validation with no errors returns True
DoValidationChecks = True
Exit Function

err_ValidationCheck:
    If ErrMsg <> "" Then
        MsgBox ErrMsg
    Else
        MsgBox Error$
    End If
    'Validation returns false on failure
    DoValidationChecks = False
    
End Function

Sub SetAfterCommitFlags()
'disable commit and re-enable add and update buttons
Commit.Enabled = False
AddNew.Enabled = True
cmdUpdate.Enabled = True

'enable the other buttons
cmdFirst.Enabled = True
cmdPrevious.Enabled = True
cmdNext.Enabled = True
cmdLast.Enabled = True
cmdFind.Enabled = True
cmdUpdate.Enabled = True
AddNew.Enabled = True

DoUpdate = False
DoAdd = False

txtEmpno.Enabled = True

End Sub

Function UpdateDynasetFields() As Integer
'This function sets the dynaset field value to those
'entered in the text boxes.  The function returns true
'on success, false on error.

ErrMsg = ""

On Error GoTo err_updatedynasetfields


EmpDynaset.Fields("empno").Value = txtEmpno
EmpDynaset.Fields("ename").Value = txtEname
EmpDynaset.Fields("job").Value = txtJob
EmpDynaset.Fields("mgr").Value = txtManager
EmpDynaset.Fields("hiredate").Value = txtHireDate
EmpDynaset.Fields("sal").Value = txtSal
EmpDynaset.Fields("comm").Value = txtComm
EmpDynaset.Fields("deptno").Value = txtDeptno

UpdateDynasetFields = True

Exit Function

err_updatedynasetfields:
    If ErrMsg <> "" Then
        MsgBox ErrMsg
    Else
        MsgBox Error$
    End If
    UpdateDynasetFields = False


End Function


Private Sub AddNew_Click()
'Blank out the fields
  txtEmpno = ""
  txtEname = ""
  txtJob = ""
  txtMgr = ""
  txtHireDate = ""
  txtSal = ""
  txtComm = ""
  txtDeptno = ""
    
'Disable the Add button and enable the commit button
  AddNew.Enabled = False
  Commit.Enabled = True
'Disable the navigation buttons
  DisableNavButtons
'Set doadd to true for commit procedure
  DoAdd = True
End Sub


Private Sub BInsert_Click()
    Load BatchInsert
    BatchInsert.Show
End Sub

Private Sub cmdDelete_Click()
'prompt user
Response = MsgBox("Do you really want to Delete?", vbYesNo + vbExclamation)
    
If Response = vbYes Then
    EmpDynaset.DbDelete
    'attempt to move to next record
    EmpDynaset.DbMoveNext
    If EmpDynaset.EOF Then 'If deleted last record
        EmpDynaset.DbMovePrevious
    End If
    Call EmpRefresh
End If
End Sub

Private Sub cmdFind_Click()
Dim FindClause As String
Dim SingleQuote As String

ErrMsg = ""
SingleQuote = "'"

On Error GoTo err_find
'build the find clause:
'Can make our query case insensitive by converting the names to upper case
'FindClause = "UPPER(ename) = " & SingleQuote & UCase(txtEname) & SingleQuote
FindClause = "ename = " & SingleQuote & txtEname & SingleQuote
   
EmpDynaset.DbFindFirst FindClause

If EmpDynaset.NoMatch Then
    MsgBox "Could not find record matching Employee Name " & txtEname
    EmpDynaset.DbMoveFirst
End If

Call EmpRefresh
 
Exit Sub
 
err_find:
     If ErrMsg <> "" Then
        MsgBox ErrMsg
    Else
        MsgBox Error$
    End If
 
End Sub

Private Sub cmdFirst_Click()
 
 EmpDynaset.DbMoveFirst
 Call EmpRefresh

End Sub

Private Sub cmdLast_Click()

 EmpDynaset.DbMoveLast
 Call EmpRefresh

End Sub

Private Sub cmdNext_Click()

 If EmpDynaset.EOF <> True Then
  EmpDynaset.DbMoveNext
  If EmpDynaset.EOF = True Then
   MsgBox WarnLastEmp$
   EmpDynaset.DbMoveLast
  End If
 End If

 Call EmpRefresh

End Sub

Private Sub cmdPrevious_Click()

 If EmpDynaset.BOF <> True Then
  EmpDynaset.DbMovePrevious
  If EmpDynaset.BOF = True Then
   MsgBox WarnFirstEmp$
   EmpDynaset.DbMoveFirst
  End If
 End If

 Call EmpRefresh

End Sub

Private Sub EmpRefresh()
'check if the current dynaset row is valid
 If EmpDynaset.BOF <> True And EmpDynaset.EOF <> True Then

  txtEmpno = EmpDynaset.Fields("empno").Value
  
  ' we can't display nulls, so display ""  for NULL fields
  If Not IsNull(EmpDynaset.Fields("ename").Value) Then
    txtEname = EmpDynaset.Fields("ename").Value
    Else
    txtEname = ""
    End If
    
  If Not IsNull(EmpDynaset.Fields("job").Value) Then
    txtJob = EmpDynaset.Fields("job").Value
    Else
    txtJob = ""
    End If
    
  'check if mgr=nul
  If Not IsNull(EmpDynaset.Fields("mgr").Value) Then
   txtMgr = EmpDynaset.Fields("mgr").Value
   Else
   txtMgr = ""
   End If
  
  If Not IsNull(EmpDynaset.Fields("hiredate").Value) Then
    txtHireDate = EmpDynaset.Fields("hiredate").Value
  Else
    txtHireDate = ""
  End If
  
  If Not IsNull(EmpDynaset.Fields("hiredate").Value) Then
    txtSal = EmpDynaset.Fields("sal").Value
  Else
    txtSal = ""
    End If
    
  'check if comm=nul
  If Not IsNull(EmpDynaset.Fields("comm").Value) Then
   txtComm = EmpDynaset.Fields("comm").Value
  Else
   txtComm = ""
  End If

  txtDeptno = EmpDynaset.Fields("deptno").Value

'if the current dynaset row is invalid, display nothing
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

Private Sub DisableNavButtons()
'disable all buttons while adding and updating
cmdFirst.Enabled = False
cmdPrevious.Enabled = False
cmdNext.Enabled = False
cmdLast.Enabled = False
cmdFind.Enabled = False
cmdUpdate.Enabled = False
AddNew.Enabled = False

End Sub

Private Sub cmdUpdate_Click()
'Disable the Update button and enable the commit button
  cmdUpdate.Enabled = False
  Commit.Enabled = True
'Disable all other buttons
  DisableNavButtons
  
  txtEmpno.Enabled = False
  DoUpdate = True
End Sub

Private Sub Command1_Click()
    Load BatchInsert
    BatchInsert.Show
End Sub

Private Sub Commit_Click()
 
On Error GoTo err_commit
 
ErrMsg = ""
'Do validation checks on entered data
If DoValidationChecks Then 'If validation checks have passed
   
    'If we are adding a record use DbAddNew
    If DoAdd = True Then
        EmpDynaset.DbAddNew
    End If
    'If we are updating a record use DbEdit
    If DoUpdate = True Then
       EmpDynaset.DbEdit
    End If
    'Update the dynaset fields and then update database if there is
    'no error.
    If UpdateDynasetFields Then
        EmpDynaset.Update
    End If

    SetAfterCommitFlags

End If 'Endif for DoValidationChecks

Exit Sub

err_commit:
    If ErrMsg <> "" Then
        MsgBox ErrMsg
    Else
        MsgBox Error$
    End If

End Sub

Private Sub Form_Load()
'Set flags to flase
DoUpdate = False
DoAdd = False
EmpNoChanged = False
'OraSession and OraDatabase are global
 Set OraSession = CreateObject("OracleInProcServer.XOraSession")
 Set OraDatabase = OraSession.OpenDatabase(DatabaseName$, Connect$, 0&)
 Set EmpDynaset = OraDatabase.DbCreateDynaset(EmpQuery$, 0&)
 
 Call EmpRefresh

End Sub

Private Sub mExit_Click()
 End
End Sub

