VERSION 5.00
Object = "{FAEEE763-117E-101B-8933-08002B2F4F5A}#1.1#0"; "DBLIST32.OCX"
Object = "{00028C01-0000-0000-0000-000000000046}#1.0#0"; "DBGRID32.OCX"
Object = "{92096210-97DF-11CF-9F27-02608C4BF3B5}#1.0#0"; "oradc.ocx"
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   8970
   ClientLeft      =   2295
   ClientTop       =   1950
   ClientWidth     =   8115
   LinkTopic       =   "Form1"
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   8970
   ScaleWidth      =   8115
   Begin VB.Frame Frame1 
      Caption         =   "Department Details"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   2655
      Left            =   480
      TabIndex        =   3
      Top             =   5760
      Width           =   7095
      Begin MSDBCtls.DBCombo deptno 
         Bindings        =   "lookup.frx":0000
         DataField       =   "DEPTNO"
         DataSource      =   "Empdetails"
         Height          =   315
         Left            =   5520
         TabIndex        =   10
         Top             =   1920
         Width           =   1095
         _ExtentX        =   1931
         _ExtentY        =   556
         _Version        =   393216
         BackColor       =   12632256
         ForeColor       =   0
         ListField       =   "DEPTNO"
         BoundColumn     =   "DEPTNO"
         Text            =   "deptno"
      End
      Begin MSDBCtls.DBList deptloc 
         Bindings        =   "lookup.frx":001A
         DataField       =   "DEPTNO"
         DataSource      =   "Empdetails"
         Height          =   1620
         Left            =   2640
         TabIndex        =   7
         Top             =   720
         Width           =   1815
         _ExtentX        =   3201
         _ExtentY        =   2858
         _Version        =   393216
         BackColor       =   -2147483643
         ForeColor       =   -2147483640
         ListField       =   "LOC"
         BoundColumn     =   "DEPTNO"
      End
      Begin MSDBCtls.DBList deptname 
         Bindings        =   "lookup.frx":0034
         DataField       =   "DEPTNO"
         DataSource      =   "Empdetails"
         Height          =   1620
         Left            =   360
         TabIndex        =   5
         Top             =   720
         Width           =   1935
         _ExtentX        =   3413
         _ExtentY        =   2858
         _Version        =   393216
         BackColor       =   -2147483643
         ForeColor       =   -2147483640
         ListField       =   "DNAME"
         BoundColumn     =   "DEPTNO"
      End
      Begin VB.Label Label3 
         Caption         =   "Department Number :"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   -1  'True
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   2
         Left            =   4920
         TabIndex        =   9
         Top             =   1560
         Width           =   1695
      End
      Begin VB.Label Label4 
         BorderStyle     =   1  'Fixed Single
         Caption         =   "For updating Department number in emp table choose Department number from the combo box and move to next row"
         Height          =   1095
         Left            =   4920
         TabIndex        =   8
         Top             =   360
         Width           =   1935
      End
      Begin VB.Label Label3 
         Caption         =   "Department Location"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   -1  'True
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   1
         Left            =   2640
         TabIndex        =   6
         Top             =   360
         Width           =   1935
      End
      Begin VB.Label Label3 
         Caption         =   "Department Name"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   -1  'True
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   0
         Left            =   360
         TabIndex        =   4
         Top             =   360
         Width           =   1575
      End
   End
   Begin ORADCLibCtl.ORADC Empdetails 
      Height          =   375
      Left            =   4200
      Top             =   120
      Visible         =   0   'False
      Width           =   2415
      _Version        =   65536
      _ExtentX        =   4260
      _ExtentY        =   661
      _StockProps     =   207
      Caption         =   "Employee Detail"
      ForeColor       =   16777152
      DatabaseName    =   "exampledb"
      Connect         =   "scott/tiger"
      RecordSource    =   "select * from emp"
   End
   Begin ORADCLibCtl.ORADC deptdetails 
      Height          =   390
      Left            =   1080
      Top             =   120
      Visible         =   0   'False
      Width           =   2775
      _Version        =   65536
      _ExtentX        =   4895
      _ExtentY        =   688
      _StockProps     =   207
      Caption         =   "Department Details"
      DatabaseName    =   "exampledb"
      Connect         =   "scott/tiger"
      RecordSource    =   "select * from dept"
   End
   Begin MSDBGrid.DBGrid DBGrid1 
      Bindings        =   "lookup.frx":004E
      Height          =   3615
      Left            =   480
      OleObjectBlob   =   "lookup.frx":0067
      TabIndex        =   2
      Top             =   1800
      Width           =   7095
   End
   Begin VB.Label Label2 
      Caption         =   "Employee Details"
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
      Left            =   480
      TabIndex        =   1
      Top             =   1320
      Width           =   1935
   End
   Begin VB.Label Label1 
      Caption         =   "Employee Department lookup table Example"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   -1  'True
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   840
      TabIndex        =   0
      Top             =   720
      Width           =   6375
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
