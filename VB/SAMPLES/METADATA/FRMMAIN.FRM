VERSION 5.00
Object = "{92096210-97DF-11CF-9F27-02608C4BF3B5}#1.0#0"; "oradc.ocx"
Object = "{00028C01-0000-0000-0000-000000000046}#1.0#0"; "DBGRID32.OCX"
Object = "{6B7E6392-850A-101B-AFC0-4210102A8DA7}#1.1#0"; "COMCTL32.OCX"
Begin VB.Form frmMain 
   Caption         =   "dbexplorer"
   ClientHeight    =   7635
   ClientLeft      =   165
   ClientTop       =   735
   ClientWidth     =   11625
   LinkTopic       =   "Form1"
   ScaleHeight     =   7635
   ScaleWidth      =   11625
   StartUpPosition =   3  'Windows Default
   Begin MSDBGrid.DBGrid DBGrid1 
      Bindings        =   "frmMain.frx":0000
      Height          =   5175
      Left            =   4680
      OleObjectBlob   =   "frmMain.frx":0011
      TabIndex        =   6
      Top             =   360
      Visible         =   0   'False
      Width           =   5775
   End
   Begin ComctlLib.TreeView tvTreeView 
      Height          =   5175
      Left            =   120
      TabIndex        =   8
      Top             =   840
      Width           =   3975
      _ExtentX        =   7011
      _ExtentY        =   9128
      _Version        =   327680
      Indentation     =   441
      LabelEdit       =   1
      LineStyle       =   1
      Style           =   7
      ImageList       =   "imageList"
      Appearance      =   1
   End
   Begin VB.PictureBox tbToolBar 
      Align           =   1  'Align Top
      Height          =   420
      Left            =   0
      ScaleHeight     =   360
      ScaleWidth      =   11565
      TabIndex        =   1
      Top             =   300
      Visible         =   0   'False
      Width           =   11625
   End
   Begin ORADCLibCtl.ORADC ORADC1 
      Height          =   375
      Left            =   6240
      Top             =   6360
      Visible         =   0   'False
      Width           =   3015
      _Version        =   65536
      _ExtentX        =   5318
      _ExtentY        =   661
      _StockProps     =   207
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.24
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
   Begin VB.PictureBox picSplitter 
      BackColor       =   &H00808080&
      BorderStyle     =   0  'None
      FillColor       =   &H00808080&
      Height          =   4800
      Left            =   4200
      ScaleHeight     =   2090.126
      ScaleMode       =   0  'User
      ScaleWidth      =   624
      TabIndex        =   4
      Top             =   840
      Visible         =   0   'False
      Width           =   64
   End
   Begin VB.PictureBox picTitles 
      Align           =   1  'Align Top
      Appearance      =   0  'Flat
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   300
      Left            =   0
      ScaleHeight     =   300
      ScaleWidth      =   11625
      TabIndex        =   2
      TabStop         =   0   'False
      Top             =   0
      Width           =   11625
      Begin VB.Label lblTitle 
         BorderStyle     =   1  'Fixed Single
         Caption         =   " TreeView:"
         Height          =   270
         Index           =   0
         Left            =   120
         TabIndex        =   3
         Tag             =   " TreeView:"
         Top             =   15
         Width           =   2010
      End
   End
   Begin VB.PictureBox sbStatusBar 
      Align           =   2  'Align Bottom
      Height          =   270
      Left            =   0
      ScaleHeight     =   210
      ScaleWidth      =   11565
      TabIndex        =   0
      Top             =   7365
      Width           =   11625
   End
   Begin VB.PictureBox dlgCommonDialog 
      Height          =   480
      Left            =   1740
      ScaleHeight     =   420
      ScaleWidth      =   1140
      TabIndex        =   5
      Top             =   1350
      Width           =   1200
   End
   Begin VB.PictureBox imlIcons 
      BackColor       =   &H80000005&
      Height          =   480
      Left            =   1740
      ScaleHeight     =   420
      ScaleWidth      =   1140
      TabIndex        =   7
      Top             =   1350
      Width           =   1200
   End
   Begin ComctlLib.ImageList imageList 
      Left            =   4800
      Top             =   6240
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   17
      ImageHeight     =   15
      MaskColor       =   8454016
      _Version        =   327680
      BeginProperty Images {0713E8C2-850A-101B-AFC0-4210102A8DA7} 
         NumListImages   =   3
         BeginProperty ListImage1 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "frmMain.frx":09C3
            Key             =   ""
         EndProperty
         BeginProperty ListImage2 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "frmMain.frx":0B09
            Key             =   ""
         EndProperty
         BeginProperty ListImage3 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "frmMain.frx":0C5B
            Key             =   ""
         EndProperty
      EndProperty
   End
   Begin VB.Image imgSplitter 
      Height          =   465
      Left            =   4320
      MousePointer    =   9  'Size W E
      Top             =   6240
      Width           =   150
   End
   Begin VB.Menu mnuFile 
      Caption         =   "&File"
      Begin VB.Menu mnuFileClose 
         Caption         =   "&Close"
      End
   End
   Begin VB.Menu mnuView 
      Caption         =   "&View"
      Begin VB.Menu SchemaObject 
         Caption         =   "&Schema Object..."
      End
      Begin VB.Menu mnuTableData 
         Caption         =   "&Table Data..."
      End
   End
   Begin VB.Menu mnuHelp 
      Caption         =   "&Help"
      Begin VB.Menu mnuHelpAbout 
         Caption         =   "&About dbexplorer..."
      End
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Const NAME_COLUMN = 0
Const TYPE_COLUMN = 1
Const SIZE_COLUMN = 2
Const DATE_COLUMN = 3
Private Declare Function OSWinHelp% Lib "user32" Alias "WinHelpA" (ByVal hwnd&, ByVal HelpFile$, ByVal wCommand%, dwData As Any)
  
Dim mbMoving As Boolean
Const sglSplitLimit = 500

Private Sub Form_Load()
    Me.Left = GetSetting(App.Title, "Settings", "MainLeft", 1000)
    Me.Top = GetSetting(App.Title, "Settings", "MainTop", 1000)
    Me.Width = GetSetting(App.Title, "Settings", "MainWidth", 6500)
    Me.Height = GetSetting(App.Title, "Settings", "MainHeight", 6500)
    
End Sub


Private Sub Form_Paint()
'    lvListView.View = Val(GetSetting(App.Title, "Settings", "ViewMode", "0"))
'    tbToolBar.Buttons(lvListView.View + LISTVIEW_BUTTON).Value = tbrPressed
   ' mnuListViewMode(lvListView.View).Checked = True
End Sub


Private Sub Form_Unload(Cancel As Integer)
    Dim i As Integer


    'close all sub forms
    For i = Forms.Count - 1 To 1 Step -1
        Unload Forms(i)
    Next
    If Me.WindowState <> vbMinimized Then
        SaveSetting App.Title, "Settings", "MainLeft", Me.Left
        SaveSetting App.Title, "Settings", "MainTop", Me.Top
        SaveSetting App.Title, "Settings", "MainWidth", Me.Width
        SaveSetting App.Title, "Settings", "MainHeight", Me.Height
    End If
    ' SaveSetting App.Title, "Settings", "ViewMode"
End Sub

Private Sub mnuTableData_Click()

Dim tblname$

tblname = "emp"
tblname = InputBox("Table Name:", "Table Name", tblname)

If tblname <> "" Then
'check if given object is of type table or view
If isScalarTableOrView(odb, tblname) Then
'Lets set the data control properties
    Set ODyn = odb.CreateDynaset("select * from " & tblname, 0&)
    Set ORADC1.Recordset = ODyn

    DBGrid1.Visible = True

End If

End If

End Sub

Private Sub mnuHelpAbout_Click()
    frmAbout.Show vbModal, Me
End Sub

#If 0 Then
Private Sub mnuViewToolbar_Click()
    If mnuViewToolbar.Checked Then
        tbToolBar.Visible = False
        mnuViewToolbar.Checked = False
    Else
        tbToolBar.Visible = True
        mnuViewToolbar.Checked = True
    End If
    SizeControls imgSplitter.Left
End Sub
#End If

Private Sub Form_Resize()
    On Error Resume Next
    If Me.Width < 3000 Then Me.Width = 3000
    SizeControls imgSplitter.Left
End Sub


Private Sub imgSplitter_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    With imgSplitter
        picSplitter.Move .Left, .Top, .Width \ 2, .Height - 20
    End With
    picSplitter.Visible = True
    mbMoving = True
End Sub


Private Sub imgSplitter_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    Dim sglPos As Single
    

    If mbMoving Then
        sglPos = X + imgSplitter.Left
        If sglPos < sglSplitLimit Then
            picSplitter.Left = sglSplitLimit
        ElseIf sglPos > Me.Width - sglSplitLimit Then
            picSplitter.Left = Me.Width - sglSplitLimit
        Else
            picSplitter.Left = sglPos
        End If
    End If
End Sub


Private Sub imgSplitter_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
    SizeControls picSplitter.Left
    picSplitter.Visible = False
    mbMoving = False
End Sub


Sub SizeControls(X As Single)
    On Error Resume Next
    

    'set the width
    If X < 1500 Then X = 1500
    If X > (Me.Width - 1500) Then X = Me.Width - 1500
    tvTreeView.Width = X
    imgSplitter.Left = X
    'lvListView.Width = Me.Width - (tvTreeView.Width + 140)
    lblTitle(0).Width = tvTreeView.Width
    
    'set data grid
    If DBGrid1.Visible = True Then
        DBGrid1.Width = Me.Width - X
        DBGrid1.Height = Me.Height
        
    End If
    
    'lblTitle(1).Left = lvListView.Left + 20
    'lblTitle(1).Width = lvListView.Width - 40


    'set the top
    If tbToolBar.Visible Then
        tvTreeView.Top = tbToolBar.Height + picTitles.Height
    Else
        tvTreeView.Top = picTitles.Height
    End If
    

    'set the height
    If sbStatusBar.Visible Then
        tvTreeView.Height = Me.ScaleHeight - (picTitles.Top + picTitles.Height + sbStatusBar.Height)
    Else
        tvTreeView.Height = Me.ScaleHeight - (picTitles.Top + picTitles.Height)
    End If
    

    imgSplitter.Top = tvTreeView.Top
    imgSplitter.Height = tvTreeView.Height
End Sub

Private Sub SchemaObject_Click()
SchemaObjectName = "emp"
SchemaObjectName = InputBox("Schema Object Name:", "Schema Object Name", SchemaObjectName)
LoadTree
End Sub

Private Sub tbToolBar_ButtonClick(ByVal Button As ComctlLib.Button)


    Select Case Button.Key


        Case "Back"
            'To Do
            MsgBox "Back Code goes here!"
        Case "Forward"
            'To Do
            MsgBox "Forward Code goes here!"
    End Select
End Sub

Private Sub mnuHelpContents_Click()
    

    Dim nRet As Integer


    'if there is no helpfile for this project display a message to the user
    'you can set the HelpFile for your application in the
    'Project Properties dialog
    If Len(App.HelpFile) = 0 Then
        MsgBox "Unable to display Help Contents. There is no Help associated with this project.", vbInformation, Me.Caption
    Else
        On Error Resume Next
        nRet = OSWinHelp(Me.hwnd, App.HelpFile, 3, 0)
        If Err Then
            MsgBox Err.Description
        End If
    End If
End Sub


Private Sub mnuHelpSearch_Click()
    

    Dim nRet As Integer


    'if there is no helpfile for this project display a message to the user
    'you can set the HelpFile for your application in the
    'Project Properties dialog
    If Len(App.HelpFile) = 0 Then
        MsgBox "Unable to display Help Contents. There is no Help associated with this project.", vbInformation, Me.Caption
    Else
        On Error Resume Next
        nRet = OSWinHelp(Me.hwnd, App.HelpFile, 261, 0)
        If Err Then
            MsgBox Err.Description
        End If
    End If
End Sub



Private Sub mnuVAIByDate_Click()
    'To Do
'  lvListView.SortKey = DATE_COLUMN
End Sub


Private Sub mnuVAIByName_Click()
    'To Do
'  lvListView.SortKey = NAME_COLUMN
End Sub


Private Sub mnuVAIBySize_Click()
    'To Do
'  lvListView.SortKey = SIZE_COLUMN
End Sub


Private Sub mnuVAIByType_Click()
    'To Do
'  lvListView.SortKey = TYPE_COLUMN
End Sub

Private Sub mnuViewRefresh_Click()
    'To Do
    MsgBox "Refresh Code goes here!"
End Sub

Private Sub mnuEditCopy_Click()
    'To Do
    MsgBox "Copy Code goes here!"
End Sub


Private Sub mnuEditCut_Click()
    'To Do
    MsgBox "Cut Code goes here!"
End Sub


Private Sub mnuEditDSelectAll_Click()
    'To Do
    MsgBox "Select All Code goes here!"
End Sub


Private Sub mnuEditInvertSelection_Click()
    'To Do
    MsgBox "Invert Selection Code goes here!"
End Sub


Private Sub mnuEditPaste_Click()
    'To Do
    MsgBox "Paste Code goes here!"
End Sub


Private Sub mnuEditPasteSpecial_Click()
    'To Do
    MsgBox "Paste Special Code goes here!"
End Sub


Private Sub mnuEditUndo_Click()
    'To Do
    MsgBox "Undo Code goes here!"
End Sub

Private Sub mnuFileOpen_Click()
    'To Do
    MsgBox "Open Code goes here!"
End Sub


Private Sub mnuFileFind_Click()
    'To Do
    MsgBox "Find Code goes here!"
End Sub


Private Sub mnuFileSendTo_Click()
    'To Do
    MsgBox "Send To Code goes here!"
End Sub


Private Sub mnuFileNew_Click()
    'To Do
'call input dlg box
SchemaObjectName = "emp"
SchemaObjectName = InputBox("Enter Schema Name: ", "Schema Object Name", SchemaObjectName)

'Lets call Load Tree
LoadTree
End Sub


Private Sub mnuFileDelete_Click()
    'To Do
    MsgBox "Delete Code goes here!"
End Sub


Private Sub mnuFileRename_Click()
    'To Do
    MsgBox "Rename Code goes here!"
End Sub


Private Sub mnuFileProperties_Click()
    'To Do
    MsgBox "Properties Code goes here!"
End Sub


Private Sub mnuFileMRU_Click(Index As Integer)
    'To Do
    MsgBox "MRU Code goes here!"
End Sub


Private Sub mnuFileClose_Click()
    'unload the form
    Unload Me
End Sub

