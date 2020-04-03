VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Begin VB.Form BatchInsert 
   BackColor       =   &H00FFFFFF&
   Caption         =   "Batch Insert"
   ClientHeight    =   5835
   ClientLeft      =   1290
   ClientTop       =   3945
   ClientWidth     =   6600
   LinkTopic       =   "Form1"
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   5835
   ScaleWidth      =   6600
   Begin MSFlexGridLib.MSFlexGrid Grid1 
      Height          =   2655
      Left            =   240
      TabIndex        =   8
      Top             =   240
      Width           =   5055
      _ExtentX        =   8916
      _ExtentY        =   4683
      _Version        =   393216
      Rows            =   10
      Cols            =   3
      AllowUserResizing=   3
   End
   Begin VB.TextBox txtEname 
      Height          =   375
      Left            =   2040
      MaxLength       =   10
      TabIndex        =   4
      Top             =   3960
      Width           =   2055
   End
   Begin VB.CommandButton CmdAddtoGrid 
      Caption         =   "Add to Grid"
      Height          =   375
      Left            =   2160
      TabIndex        =   3
      Top             =   4560
      Width           =   1335
   End
   Begin VB.TextBox txtDeptno 
      Height          =   375
      Left            =   4320
      MaxLength       =   2
      TabIndex        =   2
      Top             =   3960
      Width           =   1815
   End
   Begin VB.TextBox txtEmpno 
      Height          =   375
      Left            =   120
      MaxLength       =   4
      TabIndex        =   1
      Text            =   " "
      Top             =   3960
      Width           =   1695
   End
   Begin VB.CommandButton cmdCommitGrid 
      Caption         =   "CommitGrid"
      Height          =   375
      Left            =   2160
      TabIndex        =   0
      Top             =   5160
      Width           =   1335
   End
   Begin VB.Label Label3 
      BackColor       =   &H00FFFFFF&
      Caption         =   "Department Number"
      Height          =   255
      Left            =   4320
      TabIndex        =   7
      Top             =   3600
      Width           =   1815
   End
   Begin VB.Label Label2 
      BackColor       =   &H00FFFFFF&
      Caption         =   "Employee Name"
      Height          =   375
      Left            =   2040
      TabIndex        =   6
      Top             =   3600
      Width           =   2055
   End
   Begin VB.Label Label1 
      BackColor       =   &H00FFFFFF&
      Caption         =   "Employee Number"
      Height          =   375
      Left            =   120
      TabIndex        =   5
      Top             =   3600
      Width           =   1695
   End
End
Attribute VB_Name = "BatchInsert"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Dim CurrRow As Integer  'Current row in grid while adding to grid
Dim NoOfRows As Integer
Dim NoOfCols As Integer

Dim ReadRow As Integer
Dim ReadCol As Integer


'From ORACONST.TXT

Const ORAPARM_INPUT = 1

'Parameter Types (ServerType)
Const ORATYPE_VARCHAR2 = 1
Const ORATYPE_NUMBER = 2
Const ORATYPE_SINT = 3
Const ORATYPE_FLOAT = 4
Const ORATYPE_STRING = 5
Const ORATYPE_VARCHAR = 9
Const ORATYPE_DATE = 12
Const ORATYPE_UINT = 68
Const ORATYPE_CHAR = 96
Const ORATYPE_CHARZ = 97

Private Sub EmpBatchInsert()

Dim OraSqlStmt As Object
Dim OraPArray(2) As Object

On Error GoTo err_EmpBatchInsert
ErrMsg = ""

'Define parameter arrays, one for each column
OraDatabase.Parameters.AddTable "EMPNO_ARR", ORAPARM_INPUT, ORATYPE_NUMBER, NoOfRows
OraDatabase.Parameters.AddTable "ENAME_ARR", ORAPARM_INPUT, ORATYPE_VARCHAR2, NoOfRows, 10
OraDatabase.Parameters.AddTable "DEPTNO_ARR", ORAPARM_INPUT, ORATYPE_NUMBER, NoOfRows
If OraDatabase.LastServerErr <> 0 Or OraDatabase.LastServerErrText <> "" Then
  Error 1
End If

'Initialize local array to hold parameter arrays
Set OraPArray(0) = OraDatabase.Parameters("EMPNO_ARR")
Set OraPArray(1) = OraDatabase.Parameters("ENAME_ARR")
Set OraPArray(2) = OraDatabase.Parameters("DEPTNO_ARR")

'Init the param array variables.
'Add loop to read thru grid ROWS
For ReadRow = 0 To (NoOfRows - 1)
Grid1.Row = ReadRow + 1
'Loop to read thru grid CELLS
    For ReadCol = 0 To NoOfCols - 1 '2
        Grid1.Col = ReadCol '+ 1
        OraPArray(ReadCol).Put_Value Grid1.Text, ReadRow
    Next ReadCol
Next ReadRow

'create a sqlstmt to insert array values into table
Set OraSqlStmt = OraDatabase.CreateSql("insert into  emp(empno,ename,deptno) values(:EMPNO_ARR,:ENAME_ARR,:DEPTNO_ARR)", 0&)

Exit Sub

err_EmpBatchInsert:
    If ErrMsg <> "" Then
        MsgBox ErrMsg
    Else
        MsgBox Error$
    End If
      


End Sub

Private Sub CmdAddtoGrid_Click()

'Update the grid
'Update Empno column
Grid1.Row = CurrRow
Grid1.Col = 0
Grid1.Text = txtEmpno
'Update Ename column
Grid1.Row = CurrRow
Grid1.Col = 1
Grid1.Text = txtEname
'Update Deptno column
Grid1.Row = CurrRow
Grid1.Col = 2
Grid1.Text = txtDeptno

'Increment CurrCol
CurrRow = CurrRow + 1

NoOfRows = CurrRow - 1

End Sub

Private Sub CmdAddGrid_Click()

End Sub

Private Sub cmdCommitGrid_Click()
Dim OraSqlStmt As Object
Dim OraPArray(2) As Object

On Error GoTo err_CommitGrid
ErrMsg = ""

'Define parameter arrays, one for each column
OraDatabase.Parameters.AddTable "EMPNO_ARR", ORAPARM_INPUT, ORATYPE_NUMBER, NoOfRows
OraDatabase.Parameters.AddTable "ENAME_ARR", ORAPARM_INPUT, ORATYPE_VARCHAR2, NoOfRows, 10
OraDatabase.Parameters.AddTable "DEPTNO_ARR", ORAPARM_INPUT, ORATYPE_NUMBER, NoOfRows
If OraDatabase.LastServerErr <> 0 Or OraDatabase.LastServerErrText <> "" Then
  Error 1
End If

'Initialize local array to hold parameter arrays
Set OraPArray(0) = OraDatabase.Parameters("EMPNO_ARR")
Set OraPArray(1) = OraDatabase.Parameters("ENAME_ARR")
Set OraPArray(2) = OraDatabase.Parameters("DEPTNO_ARR")

'Init the param array variables.
'Add loop to read thru grid ROWS
For ReadRow = 0 To (NoOfRows - 1)
Grid1.Row = ReadRow + 1
'Loop to read thru grid CELLS
    For ReadCol = 0 To NoOfCols - 1
        Grid1.Col = ReadCol
        OraPArray(ReadCol).Put_Value Grid1.Text, ReadRow
    Next ReadCol
Next ReadRow

'create a sqlstmt to insert array values into table
Set OraSqlStmt = OraDatabase.CreateSql("insert into emp(empno,ename,deptno) values(:EMPNO_ARR,:ENAME_ARR,:DEPTNO_ARR)", 0&)
If OraDatabase.LastServerErr <> 0 Or OraDatabase.LastServerErrText <> "" Then
  ErrMsg = OraDatabase.LastServerErrText
  Error 1
End If

'Refresh the Dynaset
EmpDynaset.DbRefresh

OraDatabase.Parameters.Remove "EMPNO_ARR"
OraDatabase.Parameters.Remove "ENAME_ARR"
OraDatabase.Parameters.Remove "DEPTNO_ARR"

Exit Sub

err_CommitGrid:
    If ErrMsg <> "" Then
        MsgBox ErrMsg
    Else
        MsgBox Error$
    End If

End Sub



Private Sub Form_Load()
Grid1.Enabled = True
CurrRow = 0  'Top row
ReadRow = 0
ReadCol = 0

'Set column headings

Grid1.Row = CurrRow
Grid1.Col = 0
Grid1.Text = "Employee Number"

Grid1.Col = 1
Grid1.Text = "Employee Name"

Grid1.Col = 2
Grid1.Text = "Department Number"

NoOfCols = 3

CurrRow = CurrRow + 1
    
    
End Sub

