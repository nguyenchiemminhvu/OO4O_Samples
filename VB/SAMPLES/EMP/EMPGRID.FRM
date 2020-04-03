VERSION 5.00
Object = "{00028C01-0000-0000-0000-000000000046}#1.0#0"; "DBGRID32.OCX"
Object = "{92096210-97DF-11CF-9F27-02608C4BF3B5}#1.0#0"; "oradc.ocx"
Begin VB.Form frmODC 
   Appearance      =   0  'Flat
   BackColor       =   &H80000005&
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Employee Form"
   ClientHeight    =   3345
   ClientLeft      =   2490
   ClientTop       =   2715
   ClientWidth     =   6330
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
   ScaleHeight     =   3345
   ScaleWidth      =   6330
   Begin ORADCLibCtl.ORADC EmpData 
      Height          =   255
      Left            =   480
      Top             =   3000
      Visible         =   0   'False
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
   Begin MSDBGrid.DBGrid DBGrid1 
      Bindings        =   "EMPGRID.frx":0000
      Height          =   2535
      Left            =   360
      OleObjectBlob   =   "EMPGRID.frx":0012
      TabIndex        =   0
      Top             =   240
      Width           =   5655
   End
   Begin VB.Menu mExit 
      Caption         =   "E&xit!"
   End
End
Attribute VB_Name = "frmODC"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Form_Load()

 EmpData.Connect = Connect$
 EmpData.DatabaseName = DatabaseName$
 EmpData.RecordSource = EmpQuery$
 EmpData.Refresh

End Sub

Private Sub mExit_Click()
 End
End Sub

