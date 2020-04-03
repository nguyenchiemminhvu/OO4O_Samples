VERSION 5.00
Begin VB.Form DQ_STARTUP 
   Caption         =   "DQ_STARTUP"
   ClientHeight    =   5025
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   7740
   LinkTopic       =   "Form3"
   ScaleHeight     =   5025
   ScaleMode       =   0  'User
   ScaleWidth      =   7740
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton Command1 
      Caption         =   "Connect"
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
      Left            =   1440
      TabIndex        =   8
      Top             =   3840
      Width           =   2415
   End
   Begin VB.ComboBox Combo1 
      Height          =   315
      ItemData        =   "dq_startup.frx":0000
      Left            =   2760
      List            =   "dq_startup.frx":000D
      TabIndex        =   6
      Text            =   "msg_queue"
      Top             =   3000
      Width           =   2295
   End
   Begin VB.TextBox Text3 
      Height          =   375
      Left            =   2760
      TabIndex        =   2
      Text            =   "tiger"
      Top             =   2400
      Width           =   1815
   End
   Begin VB.TextBox Text2 
      Height          =   375
      Left            =   2760
      TabIndex        =   1
      Text            =   "scott"
      Top             =   1800
      Width           =   1815
   End
   Begin VB.TextBox Text1 
      Height          =   375
      Left            =   2760
      TabIndex        =   0
      Text            =   "exampledb"
      Top             =   1200
      Width           =   1815
   End
   Begin VB.Label Label5 
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
      Left            =   1440
      TabIndex        =   9
      Top             =   240
      Width           =   5055
   End
   Begin VB.Label Label4 
      Caption         =   "Queue Name"
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
      TabIndex        =   7
      Top             =   3000
      Width           =   1455
   End
   Begin VB.Label Label3 
      Caption         =   "Password"
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
      Left            =   1080
      TabIndex        =   5
      Top             =   2400
      Width           =   1335
   End
   Begin VB.Label Label2 
      Caption         =   "UserName"
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
      Left            =   1080
      TabIndex        =   4
      Top             =   1800
      Width           =   1455
   End
   Begin VB.Label Label1 
      Caption         =   "Database Name"
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
      TabIndex        =   3
      Top             =   1200
      Width           =   1335
   End
End
Attribute VB_Name = "DQ_STARTUP"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
    Dim connect As String

    Set OraSession = CreateObject("OracleInProcServer.XOraSession")
    connect = Text2.Text + Text3.Text
    OraDatabaseStr = Text1.Text
    OraConnectStr = connect
    Set OraDatabase = OraSession.DbOpenDatabase(Text1.Text, Text2.Text & "/" & Text3.Text, 0&)
    OraQueue = Combo1.Text
    Set OraAq = OraDatabase.CreateAQ(Combo1.Text)
    DQ_STARTUP.Hide
    If (OraQueue = "msg_queue_multiple") Then
        multiconsumer = True
    Else
        multiconsumer = False
    End If
        Load DEQUEUE
        DEQUEUE.Show
        
End Sub

