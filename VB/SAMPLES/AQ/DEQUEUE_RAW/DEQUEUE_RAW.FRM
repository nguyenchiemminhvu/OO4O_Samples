VERSION 5.00
Begin VB.Form DEQUEUE 
   Caption         =   "DEQUEUE"
   ClientHeight    =   8460
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   9420
   LinkTopic       =   "Form1"
   ScaleHeight     =   8460
   ScaleWidth      =   9420
   StartUpPosition =   3  'Windows Default
   Begin VB.TextBox txtconsumer 
      Height          =   375
      Left            =   1680
      TabIndex        =   1
      Top             =   1560
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.CheckBox optnavigate 
      Caption         =   "DQ_FIRST_MSG"
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
      Left            =   6360
      TabIndex        =   4
      ToolTipText     =   "Retrieve the first message matching the search criteria"
      Top             =   2040
      Width           =   2295
   End
   Begin VB.CheckBox optwait 
      Caption         =   "DQ_WAIT_FOREVER"
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
      Left            =   6360
      TabIndex        =   3
      ToolTipText     =   "Wait forever if there is no message available for dequeue."
      Top             =   1440
      Width           =   2295
   End
   Begin VB.CheckBox optremove 
      Caption         =   "DQ_REMOVE"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Left            =   6360
      TabIndex        =   2
      ToolTipText     =   "Read the message and remove from queue"
      Top             =   720
      Width           =   1575
   End
   Begin VB.Frame Message 
      Caption         =   "Message Attributes"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   2775
      Left            =   360
      TabIndex        =   9
      Top             =   2640
      Width           =   6975
      Begin VB.TextBox txtdesc 
         Height          =   375
         Left            =   1560
         TabIndex        =   14
         Top             =   1680
         Width           =   1455
      End
      Begin VB.TextBox txtmsg 
         Height          =   375
         Left            =   3000
         TabIndex        =   13
         Top             =   1680
         Width           =   3135
      End
      Begin VB.TextBox txtprio 
         Height          =   375
         Left            =   1560
         TabIndex        =   10
         Top             =   960
         Width           =   1215
      End
      Begin VB.Label Label4 
         Caption         =   "Message :"
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
         Left            =   480
         TabIndex        =   12
         Top             =   1800
         Width           =   975
      End
      Begin VB.Label Label3 
         Caption         =   "Priority :"
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
         Left            =   720
         TabIndex        =   11
         Top             =   1080
         Width           =   1095
      End
   End
   Begin VB.TextBox Txtcorrelate 
      Height          =   375
      Left            =   1680
      TabIndex        =   0
      ToolTipText     =   "Identifiers to look for in the message"
      Top             =   960
      Width           =   1695
   End
   Begin VB.CommandButton txtexit 
      BackColor       =   &H8000000D&
      Caption         =   "EXIT"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   4320
      TabIndex        =   6
      Top             =   5880
      Width           =   1935
   End
   Begin VB.CommandButton Dequeue 
      Caption         =   "DEQUEUE"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   1680
      TabIndex        =   5
      Top             =   5880
      Width           =   1815
   End
   Begin VB.Label Labelconsumer 
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
      Height          =   375
      Left            =   600
      TabIndex        =   15
      Top             =   1680
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.Label Label14 
      Caption         =   "Correlate :"
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
      Left            =   600
      TabIndex        =   8
      Top             =   1080
      Width           =   975
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
      Left            =   2040
      TabIndex        =   7
      Top             =   0
      Width           =   5415
   End
End
Attribute VB_Name = "DEQUEUE"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Dequeue_Click()
    If (multiconsumer) Then
        If (consumer_isset) Then
            OraAq.consumer = consumer
            consumer_isset = False
        End If
    End If
    
    If (correlate_isset) Then
        OraAq.correlate = correlate
        correlate_isset = False
    End If
    
    OraAq.DequeueMode = dqmode
    OraAq.wait = wait
    OraAq.Navigation = navigate
    OraAq.Dequeue
      
    txtprio = OraMsg.Priority
    txtmsg = OraMsg.Value
    Txtcorrelate = OraMsg.Correlation
End Sub
Private Sub Form_Load()
    correlate = ""
    dqmode = 1
    wait = 0
    navigate = 3
    consumer = ""
    
    Set OraMsg = OraAq.AQMsg
    If (multiconsumer = True) Then
        txtconsumer.Visible = True
        Labelconsumer.Visible = True
    End If
    
End Sub

Private Sub optnavigate_Click()
    If optnavigate.Value = 1 Then
        navigate = 1
    Else
        navigate = 3
    End If

End Sub

Private Sub optremove_Click()
    If optremove.Value = 1 Then
        dqmode = 3
    Else
        dqmode = 1
    End If
End Sub
Private Sub Optwait_Click()
    If optwait.Value = 1 Then
        wait = -1
    Else
        wait = 0
    End If
End Sub

Private Sub txtconsumer_Change()
    consumer = txtconsumer
    consumer_isset = True
End Sub

Private Sub Txtcorrelate_Change()
    correlate = Txtcorrelate.Text
    correlate_isset = True
End Sub
Private Sub txtexit_Click()
    Set OraObj = Nothing
    Set OraMsg = Nothing
    Set OraAq = Nothing
    Set OraDatabase = Nothing
    Set OraSession = Nothing
    End
End Sub
