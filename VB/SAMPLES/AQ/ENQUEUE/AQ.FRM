VERSION 5.00
Begin VB.Form AQ 
   Caption         =   "Form1"
   ClientHeight    =   7335
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   8925
   BeginProperty Font 
      Name            =   "MS Sans Serif"
      Size            =   12
      Charset         =   0
      Weight          =   700
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   LinkTopic       =   "Form1"
   ScaleHeight     =   7335
   ScaleWidth      =   8925
   StartUpPosition =   3  'Windows Default
   Begin VB.ComboBox Comboconsumer 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      ItemData        =   "aq.frx":0000
      Left            =   5520
      List            =   "aq.frx":0002
      Style           =   2  'Dropdown List
      TabIndex        =   20
      Top             =   2040
      Visible         =   0   'False
      Width           =   1815
   End
   Begin VB.TextBox txtdesc 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   300
      Left            =   2400
      TabIndex        =   0
      Text            =   "Desc(optional) "
      ToolTipText     =   "Optional description for message"
      Top             =   960
      Width           =   1695
   End
   Begin VB.TextBox txtcorrelation 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   2400
      TabIndex        =   2
      ToolTipText     =   "Assign an identifier for this message - can be used at dequeue for  specific messages."
      Top             =   1440
      Width           =   1695
   End
   Begin VB.VScrollBar VScrollexpire 
      Height          =   420
      Left            =   3120
      TabIndex        =   17
      TabStop         =   0   'False
      Top             =   3600
      Width           =   375
   End
   Begin VB.TextBox txtexpire 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   420
      Left            =   2400
      TabIndex        =   5
      Text            =   "0"
      Top             =   3600
      Width           =   1095
   End
   Begin VB.VScrollBar vscrolldelay 
      Height          =   375
      Left            =   3000
      TabIndex        =   15
      TabStop         =   0   'False
      Top             =   2160
      Width           =   495
   End
   Begin VB.CommandButton cmdenqimm 
      Caption         =   "ENQUEUE IMMEDIATE"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   1080
      TabIndex        =   6
      Top             =   4920
      Width           =   1815
   End
   Begin VB.CommandButton CmdCommit 
      Caption         =   "COMMIT"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   6480
      TabIndex        =   8
      Top             =   4920
      Width           =   1575
   End
   Begin VB.VScrollBar VScrollprio 
      Height          =   420
      Left            =   3000
      Min             =   -10
      TabIndex        =   14
      TabStop         =   0   'False
      Top             =   2880
      Width           =   375
   End
   Begin VB.TextBox txtprio 
      DataSource      =   "vscroll1"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   420
      Left            =   2400
      TabIndex        =   4
      Text            =   "0"
      ToolTipText     =   "(Signed int)Priority of the message being enqueued"
      Top             =   2880
      Width           =   975
   End
   Begin VB.TextBox txtmsg 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   4200
      ScrollBars      =   3  'Both
      TabIndex        =   1
      ToolTipText     =   "Message to be enqueued"
      Top             =   960
      Width           =   3495
   End
   Begin VB.TextBox txtdelay 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   2400
      TabIndex        =   3
      Text            =   "0"
      ToolTipText     =   "Sets the time interval(in seconds) after which the message is available for processing."
      Top             =   2160
      Width           =   1095
   End
   Begin VB.CommandButton CmdEnqueue 
      Caption         =   "ENQUEUE"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   3720
      TabIndex        =   7
      Top             =   4920
      Width           =   1815
   End
   Begin VB.CommandButton CmdExit 
      BackColor       =   &H8000000D&
      Caption         =   "EXIT"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   7080
      TabIndex        =   10
      Top             =   6360
      Width           =   1335
   End
   Begin VB.Label labelconsumer 
      Caption         =   "Consumer :"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   4320
      TabIndex        =   19
      Top             =   2100
      Visible         =   0   'False
      Width           =   1215
   End
   Begin VB.Label Label7 
      Caption         =   "Correlation :"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   1080
      TabIndex        =   18
      Top             =   1560
      Width           =   1095
   End
   Begin VB.Label Label5 
      Caption         =   "Expiration"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   1080
      TabIndex        =   16
      Top             =   3720
      Width           =   1215
   End
   Begin VB.Label Label3 
      Caption         =   "   Priority :"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   1320
      TabIndex        =   13
      Top             =   3000
      Width           =   1095
   End
   Begin VB.Label Label1 
      Caption         =   "Please key in message :"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   240
      TabIndex        =   12
      Top             =   960
      Width           =   2175
   End
   Begin VB.Label Label8 
      Caption         =   "  Delay :"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   1440
      TabIndex        =   11
      Top             =   2280
      Width           =   855
   End
   Begin VB.Label Label2 
      Alignment       =   2  'Center
      Caption         =   "OO4O ADVANCED QUEUEING"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   1920
      TabIndex        =   9
      Top             =   120
      Width           =   5415
   End
End
Attribute VB_Name = "AQ"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub CmdCommit_Click()
    OraSession.DbCommitTrans
    OraSession.DbBeginTrans
    initialise_all
End Sub
Private Sub cmdenqimm_Click()
    If (txtmsg = "") Then
        MsgBox "Please enter a message - Cannot enqueue null message"
        txtmsg.SetFocus
    Else
        'Enqueue Immediate = 1
        visibleopt = 1
        Enqueue
        initialise_all
    End If
End Sub
Private Sub CmdEnqueue_Click()
    If (txtmsg = "") Then
        MsgBox "Please enter a message - Cannot enqueue null message"
        txtmsg.SetFocus
    Else
        'Enqueue Immediate = 1
        visibleopt = 2
        Enqueue
        initialise_all
    End If
End Sub
Private Sub CmdExit_Click()
    Set OraObj = Nothing
    Set OraMsg = Nothing
    Set OraAq = Nothing
    Set OraDatabase = Nothing
    Set OraSession = Nothing
    End
End Sub

Private Sub Comboconsumer_Change()
    If (multiconsumer) Then
        consumer = Comboconsumer.Text
    End If
End Sub

Private Sub Form_Load()
    
    Set OraMsg = OraAq.AQMsg(1, "MESSAGE_TYPE")
    Set OraObj = OraDatabase.CreateOraObject("MESSAGE_TYPE")
    'Begin Transaction
    OraSession.DbBeginTrans
    initialise_all
    If (multiconsumer = True) Then
        labelconsumer.Visible = True
        Comboconsumer.Visible = True
        For cnt = 0 To 10
            Comboconsumer.List(cnt) = consumerarr(cnt)
            Comboconsumer.ItemData(cnt) = 0
        Next cnt
    End If

End Sub
Private Sub txtcorrelation_Change()
    correlation = txtcorrelation.Text
    correlation_isset = True
End Sub
Private Sub txtdelay_Change()
    delay = txtdelay.Text
End Sub
Private Sub txtexpire_Change()
    expiration = txtexpire.Text
End Sub
Private Sub initialise_all()
    'Initialise all text boxes
    txtpriority = VScrollprio.Value
    txtdelay = vscrolldelay.Value
    txtexpire = VScrollexpire.Value
    
    'Initialize all fields
    correlation = ""
    delay = 0
    expiration = 0
    priority = 0
    consumer = ""
    correlate = ""
    consumer_isset = False
    correlation_isset = False

End Sub
Private Sub Enqueue()
    OraMsg.priority = priority
    OraMsg.expiration = expiration
    OraMsg.delay = delay
    If (correlation_isset) Then
        OraMsg.correlation = correlation
        correlation_isset = False
    End If
    OraAq.Visible = visibleopt
    If (multiconsumer) Then
        consumer = Comboconsumer.Text
        If (consumer_isset) Then
            Set OraAgent = OraMsg.AQAgent(consumer)
            consumer_isset = False
        End If
    End If
        
    
    OraObj("subject").Value = txtdesc
    OraObj("text").Value = txtmsg
    
    OraMsg.Value = OraObj
    Msgid = OraAq.Enqueue
    
    MsgBox "'" & txtmsg & "' " & " Enqueued    "
    
End Sub
Private Sub txtprio_Change()
    priority = txtprio.Text
End Sub
Private Sub vscrolldelay_Change()
    txtdelay = vscrolldelay.Value
End Sub
Private Sub VScrollexpire_Change()
    txtexpire = VScrollexpire.Value
End Sub
Private Sub VScrollprio_Change()
    txtprio = VScrollprio.Value
End Sub
