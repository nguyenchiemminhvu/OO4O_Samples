VERSION 5.00
Object = "{92096210-97DF-11CF-9F27-02608C4BF3B5}#1.0#0"; "oradc.ocx"
Object = "{00028C01-0000-0000-0000-000000000046}#1.0#0"; "DBGRID32.OCX"
Begin VB.Form frmDeptEmp 
   Appearance      =   0  'Flat
   BackColor       =   &H80000005&
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Dept-Emp Master Detail Form"
   ClientHeight    =   4905
   ClientLeft      =   2355
   ClientTop       =   2235
   ClientWidth     =   6495
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
   MaxButton       =   0   'False
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   4905
   ScaleWidth      =   6495
   Begin VB.TextBox txtLoc 
      Appearance      =   0  'Flat
      DataField       =   "loc"
      DataSource      =   "DeptData"
      Height          =   285
      Left            =   2640
      TabIndex        =   2
      Top             =   840
      Width           =   2775
   End
   Begin VB.TextBox txtDname 
      Appearance      =   0  'Flat
      DataField       =   "dname"
      DataSource      =   "DeptData"
      Height          =   285
      Left            =   2640
      TabIndex        =   1
      Top             =   480
      Width           =   2775
   End
   Begin VB.TextBox txtDeptno 
      Appearance      =   0  'Flat
      DataField       =   "deptno"
      DataSource      =   "DeptData"
      Height          =   285
      Left            =   2640
      TabIndex        =   0
      Top             =   120
      Width           =   1215
   End
   Begin ORADCLibCtl.ORADC DeptData 
      Height          =   255
      Left            =   240
      Top             =   1200
      Width           =   5655
      _Version        =   65536
      _ExtentX        =   9975
      _ExtentY        =   450
      _StockProps     =   207
      Caption         =   "     Previous Department -- Next Department"
      DatabaseName    =   "exampledb"
      Connect         =   "scott/tiger"
      RecordSource    =   ""
   End
   Begin ORADCLibCtl.ORADC EmpData 
      Height          =   255
      Left            =   240
      Top             =   4560
      Visible         =   0   'False
      Width           =   5655
      _Version        =   65536
      _ExtentX        =   9975
      _ExtentY        =   450
      _StockProps     =   207
      Caption         =   "     Previous Employee -- Next Employee"
      DatabaseName    =   "exampledb"
      Connect         =   "scott/tiger"
      RecordSource    =   ""
   End
   Begin MSDBGrid.DBGrid DBGrid1 
      Bindings        =   "DEPTGRID.frx":0000
      Height          =   2535
      Left            =   240
      OleObjectBlob   =   "DEPTGRID.frx":0016
      TabIndex        =   6
      Top             =   1800
      Width           =   5655
   End
   Begin VB.Label Label11 
      Alignment       =   1  'Right Justify
      Appearance      =   0  'Flat
      AutoSize        =   -1  'True
      BackColor       =   &H80000005&
      Caption         =   "Location:"
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
      TabIndex        =   5
      Top             =   840
      Width           =   960
   End
   Begin VB.Line Line1 
      BorderWidth     =   3
      X1              =   120
      X2              =   6360
      Y1              =   1560
      Y2              =   1560
   End
   Begin VB.Label Label10 
      Alignment       =   1  'Right Justify
      Appearance      =   0  'Flat
      AutoSize        =   -1  'True
      BackColor       =   &H80000005&
      Caption         =   "Department Name:"
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
      Left            =   600
      TabIndex        =   4
      Top             =   480
      Width           =   1950
   End
   Begin VB.Label Label9 
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
      Height          =   240
      Left            =   360
      TabIndex        =   3
      Top             =   120
      Width           =   2145
   End
   Begin VB.Menu mExit 
      Caption         =   "E&xit!"
   End
End
Attribute VB_Name = "frmDeptEmp"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Option Explicit

Private Sub DeptData_Reposition()

 If DeptData.Recordset.EOF <> True Then
  OraDatabase.Parameters("deptno").Value = DeptData.Recordset.fields("deptno").Value
  EmpData.Refresh
 End If

End Sub

Private Sub DeptData_Click()

End Sub

Private Sub EmpData_Click()

End Sub

Private Sub Form_Load()

 'Refresh the data control without setting the
 'Recordsource. This will create the underlying Session
 'and Database.
 EmpData.Connect = Connect$
 EmpData.DatabaseName = DatabaseName$
 EmpData.Refresh

 'Add a parameter for the Emp query.
 Set OraDatabase = EmpData.Database
 OraDatabase.Parameters.Add "deptno", 0, 1

 EmpData.RecordSource = EmpQuery$
 EmpData.Refresh
 
 'Set the recordsource of the emp data control and refresh.
 DeptData.Connect = Connect$
 DeptData.DatabaseName = DatabaseName$
 DeptData.RecordSource = DeptQuery$
 DeptData.Refresh

End Sub

Private Sub mExit_Click()
 End
End Sub

