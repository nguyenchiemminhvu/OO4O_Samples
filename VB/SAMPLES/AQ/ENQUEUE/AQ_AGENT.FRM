VERSION 5.00
Begin VB.Form AQ_AGENT 
   Caption         =   "ADD AQ AGENT"
   ClientHeight    =   2625
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   4545
   LinkTopic       =   "Form2"
   ScaleHeight     =   2625
   ScaleWidth      =   4545
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Command3 
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
      Height          =   375
      Left            =   3240
      TabIndex        =   3
      Top             =   1200
      Width           =   855
   End
   Begin VB.TextBox Text1 
      Height          =   375
      Left            =   1800
      TabIndex        =   0
      ToolTipText     =   "Specify the consumer for this queue/message"
      Top             =   360
      Width           =   1455
   End
   Begin VB.CommandButton Command2 
      Caption         =   "END"
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
      Left            =   1920
      TabIndex        =   2
      ToolTipText     =   "exit this form"
      Top             =   1200
      Width           =   855
   End
   Begin VB.CommandButton Command1 
      Caption         =   "ADD"
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
      TabIndex        =   1
      ToolTipText     =   "Adds the consumer to the subscribers for this queue/message"
      Top             =   1200
      Width           =   975
   End
   Begin VB.Label Label1 
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
      Left            =   720
      TabIndex        =   4
      Top             =   480
      Width           =   975
   End
End
Attribute VB_Name = "AQ_AGENT"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim mystr, mystr1 As String
Private Sub Command1_Click()
    If (total_consumers = 10) Then
        MsgBox "Number of subscribers cannot exceed 10"
    End If
    
    If (Text1.Text <> "") Then
        OraDatabase.Parameters(0).Value = Text1.Text
        ret = OraDatabase.DbExecuteSQL(mystr)
        ret = OraDatabase.DbExecuteSQL(mystr1) ' Check ret is ok

        consumerarr(total_consumers) = Text1.Text
        total_consumers = total_consumers + 1
        Text1.Text = ""
        Text1.SetFocus
    End If

End Sub

Private Sub Command2_Click()
    OraDatabase.Parameters.Remove "SUBSCRIBER"
    End
End Sub

Private Sub Command3_Click()
    OraDatabase.Parameters.Remove "SUBSCRIBER"
    AQ_AGENT.Hide
    Load AQ
    AQ.Show
End Sub
Private Sub Form_Load()
    Dim ret As Integer
    Dim oparams As Object
    ReDim consumerarr(10) As String
    
    total_consumers = 0
    Set oparams = OraDatabase.Parameters
    oparams.Add "SUBSCRIBER", 0, 1
    oparams("SUBSCRIBER").serverType = 1  'ORATYPE_VARCHAR2
    'myStr = "execute sys.dbms_aqadm.Add_Subscriber(" & OraQueue & ",:SUBSCRIBER)"
    mystr = "declare subs sys.aq$_agent; begin subs:= sys.aq$_agent (:SUBSCRIBER,null,null);end;"
    mystr1 = "dbms_aqadm.Add_Subscriber(queue_name =>'msg_queue_multiple',subscriber =>:SUBSCRIBER);"

End Sub
