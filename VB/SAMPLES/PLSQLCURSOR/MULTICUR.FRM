VERSION 5.00
Object = "{92096210-97DF-11CF-9F27-02608C4BF3B5}#1.0#0"; "oradc.ocx"
Object = "{FAEEE763-117E-101B-8933-08002B2F4F5A}#1.1#0"; "DBLIST32.OCX"
Object = "{00028C01-0000-0000-0000-000000000046}#1.0#0"; "DBGRID32.OCX"
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   7980
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   8250
   LinkTopic       =   "Form1"
   ScaleHeight     =   7980
   ScaleWidth      =   8250
   StartUpPosition =   3  'Windows Default
   Begin MSDBGrid.DBGrid DBGrid2 
      Bindings        =   "multicur.frx":0000
      Height          =   1935
      Left            =   1200
      OleObjectBlob   =   "multicur.frx":0012
      TabIndex        =   9
      Top             =   5640
      Width           =   6015
   End
   Begin MSDBGrid.DBGrid DBGrid1 
      Bindings        =   "multicur.frx":09C4
      Height          =   1935
      Left            =   1200
      OleObjectBlob   =   "multicur.frx":09D6
      TabIndex        =   7
      Top             =   2880
      Width           =   6015
   End
   Begin MSDBCtls.DBCombo DBCombo1 
      Bindings        =   "multicur.frx":1388
      Height          =   315
      Left            =   5400
      TabIndex        =   4
      Top             =   1560
      Width           =   1575
      _ExtentX        =   2778
      _ExtentY        =   556
      _Version        =   327680
      ListField       =   "NAME"
      BoundColumn     =   ""
      Text            =   ""
   End
   Begin ORADCLibCtl.ORADC SalesDC 
      Height          =   255
      Left            =   5160
      TabIndex        =   3
      Top             =   240
      Visible         =   0   'False
      Width           =   1695
      _Version        =   65536
      _ExtentX        =   2990
      _ExtentY        =   450
      _StockProps     =   207
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      DatabaseName    =   ""
      Connect         =   ""
      RecordSource    =   ""
   End
   Begin ORADCLibCtl.ORADC OrderDC 
      Height          =   255
      Left            =   3000
      TabIndex        =   2
      Top             =   240
      Visible         =   0   'False
      Width           =   1575
      _Version        =   65536
      _ExtentX        =   2778
      _ExtentY        =   450
      _StockProps     =   207
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      DatabaseName    =   ""
      Connect         =   ""
      RecordSource    =   ""
   End
   Begin ORADCLibCtl.ORADC CustNameDC 
      Height          =   255
      Left            =   1080
      TabIndex        =   1
      Top             =   240
      Visible         =   0   'False
      Width           =   1575
      _Version        =   65536
      _ExtentX        =   2778
      _ExtentY        =   450
      _StockProps     =   207
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
      RecordSource    =   "select name from customer"
   End
   Begin VB.Label Label4 
      Caption         =   "Sales Details"
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
      Left            =   1200
      TabIndex        =   8
      Top             =   5160
      Width           =   1935
   End
   Begin VB.Label Label3 
      Caption         =   "Order Details"
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
      Left            =   1200
      TabIndex        =   6
      Top             =   2280
      Width           =   1935
   End
   Begin VB.Label Label2 
      Caption         =   "Please choose the Customer Name :"
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
      Left            =   1320
      TabIndex        =   5
      Top             =   1560
      Width           =   3975
   End
   Begin VB.Label Label1 
      Caption         =   "PLSQL Multiple Cursor - Sample"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   18
         Charset         =   0
         Weight          =   700
         Underline       =   -1  'True
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   1200
      TabIndex        =   0
      Top             =   720
      Width           =   5895
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim OraSession As OraSession
Dim OraDatabase As OraDatabase
Dim OraSqlStmt As OraSqlStmt

Private Sub Command1_Click()
 'Now Change the customer name to VOLLYRITE
    OraDatabase.Parameters("NAME").Value = "VOLLYRITE"
    'Now refreshes the SQLStmt object
    OraSqlStmt.Refresh
 
End Sub

Private Sub DBCombo1_Change()
MsgBox "change"
End Sub

Private Sub DBCombo1_Click(Area As Integer)
    'Now Change the customer name to VOLLYRITE
    OraDatabase.Parameters("NAME").Value = DBCombo1.Text
 
    'Now refreshes the SQLStmt object
    OraSqlStmt.Refresh
 
End Sub

Private Sub Form_Load()
 
 MsgBox "This example requires that you have the CUSTOMERS package/ Tables setup in your database." & _
       " Please install DEMOBLD7.SQL and MULTICUR.SQL provided in your OO4O directory."

 
 'Create the OraSession Object.
 Set OraSession = CreateObject("OracleInProcServer.XOraSession")

 'Create the OraDatabase Object by opening a connection to Oracle.
 Set OraDatabase = OraSession.OpenDatabase("ExampleDb", "scott/tiger", 0&)
' Create the Deptno parameter
 OraDatabase.Parameters.Add "NAME", "VOLLYRITE", ORAPARM_INPUT
 OraDatabase.Parameters("NAME").ServerType = ORATYPE_VARCHAR2
 
 OraDatabase.Parameters.Add "ORDCURSOR", 0, ORAPARM_OUTPUT
 OraDatabase.Parameters("ORDCURSOR").ServerType = ORATYPE_CURSOR
 
 OraDatabase.Parameters.Add "SALESCURSOR", 0, ORAPARM_OUTPUT
 OraDatabase.Parameters("SALESCURSOR").ServerType = ORATYPE_CURSOR
 
 'Create OraDynaset based on "EmpCursor" created in stored procedure.
 Set OraSqlStmt = OraDatabase.CreateSql("Begin Customers.GetCutomerSalesOrder(:Name,:OrdCursor,:SalesCursor); end;", ORASQL_FAILEXEC)
 
 'Attach the order,sales data control to the cursor dynaset
 Set OrderDC.Recordset = OraDatabase.Parameters("ORDCURSOR").Value
 Set SalesDC.Recordset = OraDatabase.Parameters("SALESCURSOR").Value
 
End Sub

Private Sub Form_Unload(Cancel As Integer)
'Now remove the Parameters object
 ' MUST BE CALLED for OraParameter of type ORATYPE_CURSOR
 OraDatabase.Parameters.Remove ("NAME")
 OraDatabase.Parameters.Remove ("ORDCURSOR")
 OraDatabase.Parameters.Remove ("SALESCURSOR")
 
 
End Sub

