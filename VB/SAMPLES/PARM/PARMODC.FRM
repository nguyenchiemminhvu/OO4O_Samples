VERSION 5.00
Object = "{92096210-97DF-11CF-9F27-02608C4BF3B5}#1.0#0"; "oradc.ocx"
Begin VB.Form frmEmp 
   Appearance      =   0  'Flat
   BackColor       =   &H80000005&
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Emp Using Parameters"
   ClientHeight    =   5145
   ClientLeft      =   2490
   ClientTop       =   2430
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
   MaxButton       =   0   'False
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   5145
   ScaleWidth      =   6345
   Begin VB.ComboBox cmbjob 
      Height          =   300
      ItemData        =   "PARMODC.frx":0000
      Left            =   2760
      List            =   "PARMODC.frx":0013
      Style           =   2  'Dropdown List
      TabIndex        =   18
      Top             =   3600
      Width           =   1935
   End
   Begin VB.TextBox txtComm 
      Appearance      =   0  'Flat
      DataField       =   "comm"
      DataSource      =   "EmpData"
      Height          =   285
      Left            =   2640
      TabIndex        =   6
      Top             =   2280
      Width           =   1215
   End
   Begin VB.TextBox txtDeptno 
      Appearance      =   0  'Flat
      DataField       =   "deptno"
      DataSource      =   "EmpData"
      Height          =   285
      Left            =   2640
      TabIndex        =   7
      Top             =   2640
      Width           =   1215
   End
   Begin VB.TextBox txtSal 
      Appearance      =   0  'Flat
      DataField       =   "sal"
      DataSource      =   "EmpData"
      Height          =   285
      Left            =   2640
      TabIndex        =   5
      Top             =   1920
      Width           =   1215
   End
   Begin VB.TextBox txtHireDate 
      Appearance      =   0  'Flat
      DataField       =   "hiredate"
      DataSource      =   "EmpData"
      Height          =   285
      Left            =   2640
      TabIndex        =   4
      Top             =   1560
      Width           =   1215
   End
   Begin VB.TextBox txtMgr 
      Appearance      =   0  'Flat
      DataField       =   "mgr"
      DataSource      =   "EmpData"
      Height          =   285
      Left            =   2640
      TabIndex        =   3
      Top             =   1200
      Width           =   1215
   End
   Begin VB.TextBox txtJob 
      Appearance      =   0  'Flat
      DataField       =   "job"
      DataSource      =   "EmpData"
      Height          =   285
      Left            =   2640
      TabIndex        =   2
      Top             =   840
      Width           =   2895
   End
   Begin VB.TextBox txtEname 
      Appearance      =   0  'Flat
      DataField       =   "ename"
      DataSource      =   "EmpData"
      Height          =   285
      Left            =   2640
      TabIndex        =   1
      Top             =   480
      Width           =   2895
   End
   Begin VB.TextBox txtEmpno 
      Appearance      =   0  'Flat
      DataField       =   "empno"
      DataSource      =   "EmpData"
      Height          =   285
      Left            =   2640
      TabIndex        =   0
      Top             =   120
      Width           =   1215
   End
   Begin VB.CommandButton cmdExit 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "Exit"
      Height          =   495
      Left            =   4200
      TabIndex        =   9
      Top             =   4200
      Width           =   1215
   End
   Begin VB.CommandButton cmdQuery 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "Query"
      Default         =   -1  'True
      Height          =   495
      Left            =   840
      TabIndex        =   8
      Top             =   4200
      Width           =   1215
   End
   Begin ORADCLibCtl.ORADC EmpData 
      Height          =   255
      Left            =   360
      Top             =   3000
      Width           =   5535
      _Version        =   65536
      _ExtentX        =   9763
      _ExtentY        =   450
      _StockProps     =   207
      Caption         =   "         Previous Employee -- Next Employee"
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      DatabaseName    =   ""
      Connect         =   ""
      RecordSource    =   ""
   End
   Begin VB.Label Label9 
      Caption         =   "Select Job:"
      Height          =   255
      Left            =   1560
      TabIndex        =   19
      Top             =   3600
      Width           =   975
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
      TabIndex        =   17
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
      TabIndex        =   16
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
      TabIndex        =   15
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
      TabIndex        =   14
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
      TabIndex        =   13
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
      TabIndex        =   12
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
      TabIndex        =   11
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
      TabIndex        =   10
      Top             =   120
      Width           =   2055
   End
End
Attribute VB_Name = "frmEmp"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False


Private Sub cmdExit_Click()
 End
End Sub

Private Sub cmdQuery_Click()

 Dim var As Variant

 var = cmbjob.Text
 EmpData.Database.Parameters("job").Value = var
 EmpData.Recordset.DbRefresh

End Sub

Private Sub Combo1_Change()

End Sub

Private Sub EmpData_Reposition()

 If EmpData.Recordset.EOF = True Then
  MsgBox "You are already on in the last record."
 End If

 If EmpData.Recordset.BOF = True Then
  MsgBox "You are already on in the first record."
 End If

End Sub

Private Sub Form_Load()

 EmpData.Connect = Connect$
 EmpData.DatabaseName = DatabaseName$
 EmpData.Refresh

 EmpData.RecordSource = EmpQuery$
 EmpData.Database.Parameters.Add "job", "MANAGER", 1
 cmbjob = "MANAGER"
 EmpData.Refresh

End Sub

