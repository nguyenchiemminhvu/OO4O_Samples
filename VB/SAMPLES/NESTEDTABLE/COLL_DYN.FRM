VERSION 5.00
Object = "{92096210-97DF-11CF-9F27-02608C4BF3B5}#1.0#0"; "ORADC.ocx"
Object = "{00028C01-0000-0000-0000-000000000046}#1.0#0"; "DBGRID32.OCX"
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   8595
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   10635
   LinkTopic       =   "Form1"
   ScaleHeight     =   8595
   ScaleWidth      =   10635
   StartUpPosition =   3  'Windows Default
   Begin MSDBGrid.DBGrid DBGrid2 
      Bindings        =   "coll_dyn.frx":0000
      Height          =   3135
      Left            =   5400
      OleObjectBlob   =   "coll_dyn.frx":0012
      TabIndex        =   3
      Top             =   3600
      Width           =   5055
   End
   Begin ORADCLibCtl.ORADC Courses 
      Height          =   375
      Left            =   5160
      Top             =   7200
      Width           =   3135
      _Version        =   65536
      _ExtentX        =   5530
      _ExtentY        =   661
      _StockProps     =   207
      Caption         =   "Courses"
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.24
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
   Begin MSDBGrid.DBGrid DBGrid1 
      Bindings        =   "coll_dyn.frx":09E5
      Height          =   1575
      Left            =   360
      OleObjectBlob   =   "coll_dyn.frx":09F8
      TabIndex        =   1
      Top             =   3600
      Width           =   3495
   End
   Begin ORADCLibCtl.ORADC Division 
      Height          =   375
      Left            =   960
      Top             =   7200
      Width           =   3375
      _Version        =   65536
      _ExtentX        =   5953
      _ExtentY        =   661
      _StockProps     =   207
      Caption         =   "Division"
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.24
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      DatabaseName    =   "exampledb"
      Connect         =   "scott/tiger"
      RecordSource    =   "select * from division"
   End
   Begin VB.Label Label4 
      Caption         =   "Nested Table Example"
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
      Left            =   2880
      TabIndex        =   0
      Top             =   960
      Width           =   3375
   End
   Begin VB.Label Label3 
      DataField       =   "NAME"
      DataSource      =   "Division"
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
      Left            =   8640
      TabIndex        =   2
      Top             =   2880
      Width           =   1695
   End
   Begin VB.Label Label2 
      Caption         =   "Courses for Department"
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
      Left            =   5640
      TabIndex        =   5
      Top             =   2880
      Width           =   2535
   End
   Begin VB.Label Label1 
      Caption         =   "Division Table"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   360
      TabIndex        =   4
      Top             =   2880
      Width           =   2295
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Division_Reposition()
Dim CourseList As OraCollection

Set CourseList = Division.Recordset.Fields("Courses").Value

Division.Recordset.Database.Parameters.Add "COURSELIST", CourseList, ORAPARM_INPUT, ORATYPE_TABLE, "COURSELIST"

'create a read only dynaset based on the courselist.
Set Courses.Recordset = Division.Recordset.Database.CreateDynaset("select *  from THE(select CAST(:COURSELIST AS COURSELIST) from dual)", ORADYN_READONLY)

Division.Recordset.Database.Parameters.Remove "COURSELIST"


End Sub



