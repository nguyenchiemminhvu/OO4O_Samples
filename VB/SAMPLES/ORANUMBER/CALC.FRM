VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "OraNumber Calculator Demo"
   ClientHeight    =   3690
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   6615
   BeginProperty Font 
      Name            =   "MS Sans Serif"
      Size            =   12
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   ForeColor       =   &H00000000&
   LinkTopic       =   "Form1"
   ScaleHeight     =   3690
   ScaleWidth      =   6615
   StartUpPosition =   3  'Windows Default
   Begin VB.TextBox Text1 
      Alignment       =   1  'Right Justify
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   120
      TabIndex        =   36
      Text            =   "Text1"
      Top             =   120
      Width           =   6375
   End
   Begin VB.CommandButton Command18 
      Caption         =   "CE"
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
      Left            =   4680
      TabIndex        =   35
      Top             =   720
      Width           =   855
   End
   Begin VB.CommandButton Command17 
      Caption         =   "C"
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
      Left            =   5640
      TabIndex        =   34
      Top             =   720
      Width           =   855
   End
   Begin VB.CommandButton Command43 
      Caption         =   "Format"
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
      Left            =   120
      TabIndex        =   33
      Top             =   3120
      Width           =   1695
   End
   Begin VB.CommandButton Command41 
      Caption         =   "Hyp Tan"
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
      Left            =   1320
      TabIndex        =   32
      Top             =   2520
      Width           =   495
   End
   Begin VB.CommandButton Command40 
      Caption         =   "Arc Tan"
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
      Left            =   720
      TabIndex        =   31
      Top             =   2520
      Width           =   495
   End
   Begin VB.CommandButton Command39 
      Caption         =   "Tan"
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
      Left            =   120
      TabIndex        =   30
      Top             =   2520
      Width           =   495
   End
   Begin VB.CommandButton Command38 
      Caption         =   "Hyp Cos"
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
      Left            =   1320
      TabIndex        =   29
      Top             =   1920
      Width           =   495
   End
   Begin VB.CommandButton Command37 
      Caption         =   "Arc Cos"
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
      Left            =   720
      TabIndex        =   28
      Top             =   1920
      Width           =   495
   End
   Begin VB.CommandButton Command36 
      Caption         =   "Cos"
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
      Left            =   120
      TabIndex        =   27
      Top             =   1920
      Width           =   495
   End
   Begin VB.CommandButton Command35 
      Caption         =   "Hyp Sin"
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
      Left            =   1320
      TabIndex        =   26
      Top             =   1320
      Width           =   495
   End
   Begin VB.CommandButton Command34 
      Caption         =   "Arc Sin"
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
      Left            =   720
      TabIndex        =   25
      Top             =   1320
      Width           =   495
   End
   Begin VB.CommandButton Command33 
      Caption         =   "Sin"
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
      Left            =   120
      TabIndex        =   24
      Top             =   1320
      Width           =   495
   End
   Begin VB.CommandButton Command32 
      Caption         =   "+/--"
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
      Left            =   2760
      TabIndex        =   23
      Top             =   3120
      Width           =   495
   End
   Begin VB.CommandButton Command31 
      Caption         =   "Pi"
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
      Left            =   2160
      TabIndex        =   22
      Top             =   3120
      Width           =   495
   End
   Begin VB.CommandButton Command28 
      Caption         =   "Exp"
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
      Left            =   2760
      TabIndex        =   21
      Top             =   2520
      Width           =   495
   End
   Begin VB.CommandButton Command27 
      Caption         =   "Abs"
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
      Left            =   2160
      TabIndex        =   20
      Top             =   2520
      Width           =   495
   End
   Begin VB.CommandButton Command24 
      Caption         =   "Ln"
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
      Left            =   2760
      TabIndex        =   19
      Top             =   1920
      Width           =   495
   End
   Begin VB.CommandButton Command23 
      Caption         =   "Mod"
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
      Left            =   2160
      TabIndex        =   18
      Top             =   1920
      Width           =   495
   End
   Begin VB.CommandButton Command20 
      Caption         =   "Log"
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
      Left            =   2760
      TabIndex        =   17
      Top             =   1320
      Width           =   495
   End
   Begin VB.CommandButton Command19 
      Caption         =   "Sqrt"
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
      Left            =   2160
      TabIndex        =   16
      Top             =   1320
      Width           =   495
   End
   Begin VB.CommandButton Command16 
      Caption         =   "+"
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
      Left            =   6000
      TabIndex        =   15
      Top             =   3120
      Width           =   495
   End
   Begin VB.CommandButton Command15 
      Caption         =   "="
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
      Left            =   5400
      TabIndex        =   14
      Top             =   3120
      Width           =   495
   End
   Begin VB.CommandButton Command14 
      Caption         =   "."
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
      Left            =   4800
      TabIndex        =   13
      Top             =   3120
      Width           =   495
   End
   Begin VB.CommandButton Command13 
      Caption         =   "0"
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
      Left            =   4200
      TabIndex        =   12
      Top             =   3120
      Width           =   495
   End
   Begin VB.CommandButton Command12 
      Caption         =   "--"
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
      Left            =   6000
      TabIndex        =   11
      Top             =   2520
      Width           =   495
   End
   Begin VB.CommandButton Command11 
      Caption         =   "3"
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
      Left            =   5400
      TabIndex        =   10
      Top             =   2520
      Width           =   495
   End
   Begin VB.CommandButton Command10 
      BackColor       =   &H000000FF&
      Caption         =   "2"
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
      Left            =   4800
      MaskColor       =   &H000000FF&
      TabIndex        =   9
      Top             =   2520
      Width           =   495
   End
   Begin VB.CommandButton Command9 
      Caption         =   "1"
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
      Left            =   4200
      TabIndex        =   8
      Top             =   2520
      Width           =   495
   End
   Begin VB.CommandButton Command8 
      Caption         =   "*"
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
      Left            =   6000
      TabIndex        =   7
      Top             =   1920
      Width           =   495
   End
   Begin VB.CommandButton Command7 
      Caption         =   "6"
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
      Left            =   5400
      TabIndex        =   6
      Top             =   1920
      Width           =   495
   End
   Begin VB.CommandButton Command6 
      Caption         =   "5"
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
      Left            =   4800
      TabIndex        =   5
      Top             =   1920
      Width           =   495
   End
   Begin VB.CommandButton Command5 
      Caption         =   "4"
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
      Left            =   4200
      TabIndex        =   4
      Top             =   1920
      Width           =   495
   End
   Begin VB.CommandButton Command4 
      Caption         =   "/"
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
      Left            =   6000
      TabIndex        =   3
      Top             =   1320
      Width           =   495
   End
   Begin VB.CommandButton Command3 
      Caption         =   "9"
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
      Left            =   5400
      TabIndex        =   2
      Top             =   1320
      Width           =   495
   End
   Begin VB.CommandButton Command2 
      Caption         =   "8"
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
      Left            =   4800
      TabIndex        =   1
      Top             =   1320
      Width           =   495
   End
   Begin VB.CommandButton Command1 
      Caption         =   "7"
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
      Left            =   4200
      TabIndex        =   0
      Top             =   1320
      Width           =   495
   End
   Begin VB.Label Label1 
      BackColor       =   &H80000018&
      Caption         =   "OO4O OraNumber Demo"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   15.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   120
      TabIndex        =   37
      Top             =   720
      Width           =   4455
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'Accumulator
Dim Accum As OraNumber

Dim OraSession As OraSession
'Used in the case of operators that require 2 operands
Dim PendingOp As String
Dim PendingVal As OraNumber
Dim opkeyhit As Boolean

'related to the behavior of repeated equals sign hits
Dim eqmode As Boolean





Private Sub Command1_Click()
'7
If Text1.Text = "Error" Then Exit Sub
display = GetCurrentDisplayVal()
Text1.Text = display & "7"
End Sub

Private Sub Command10_Click()
'2
If Text1.Text = "Error" Then Exit Sub
display = GetCurrentDisplayVal()
Text1.Text = display & "2"
End Sub

Private Sub Command11_Click()
'3
If Text1.Text = "Error" Then Exit Sub
display = GetCurrentDisplayVal()
Text1.Text = display & "3"
End Sub

Private Sub Command12_Click()
'sub
DoOp ("sub")
End Sub

Private Sub Command13_Click()
'0
If Text1.Text = "Error" Then Exit Sub
display = GetCurrentDisplayVal()
Text1.Text = display & "0"
End Sub

Private Sub Command14_Click()
'decimal point
x = InStr(1, Text1.Text, ".")
If (x <> 0) Then Exit Sub

If Text1.Text = "Error" Then Exit Sub
display = Text1.Text
If opkeyhit = True Then
display = "0"
opkeyhit = False
End If
Text1.Text = display & "."

End Sub

Private Sub Command15_Click()
DoOp ("eq")
End Sub

Private Sub Command16_Click()
'Add
DoOp ("add")
End Sub

Private Sub Command17_Click()
'C
Text1.Text = "0"
Accum.Value = 0
PendingOp = ""
PendingVal.Value = 0
End Sub

Private Sub Command18_Click()
'CE
Text1.Text = "0"
End Sub

Private Sub Command19_Click()
'Sqrt
If Text1.Text = "Error" Then Exit Sub
Accum.Value = Text1.Text
Accum.Sqrt
Text1.Text = Accum.Value

End Sub

Private Sub Command2_Click()
'8
If Text1.Text = "Error" Then Exit Sub
display = GetCurrentDisplayVal()
Text1.Text = display & "8"
End Sub

Private Sub Command20_Click()
DoOp ("log")
End Sub

Private Sub Command23_Click()
DoOp ("mod")
End Sub

Private Sub Command24_Click()
'ln
On Error GoTo err
If Text1.Text = "Error" Then Exit Sub
Accum.Value = Text1.Text
Accum.Ln
Text1.Text = Accum.Value
Exit Sub
err:
Text1.Text = "Error"

End Sub

Private Sub Command27_Click()
If Text1.Text = "Error" Then Exit Sub
Accum.Value = Text1.Text
Accum.Abs
Text1.Text = Accum.Value

End Sub

Private Sub Command28_Click()
DoOp ("power")
End Sub

Private Sub Command3_Click()
'9
If Text1.Text = "Error" Then Exit Sub
display = GetCurrentDisplayVal()
Text1.Text = display & "9"
End Sub

Private Sub Command31_Click()
'Pi
If Text1.Text = "Error" Then Exit Sub
Accum.SetPi
Text1.Text = Accum.Value

End Sub

Private Sub Command32_Click()
'+/-
If Text1.Text = "Error" Then Exit Sub
Accum.Value = Text1.Text
Accum.Neg
Text1.Text = Accum.Value

End Sub

Private Sub Command33_Click()
'Sin
If Text1.Text = "Error" Then Exit Sub
Accum.Value = Text1.Text
Accum.Sin
Text1.Text = Accum.Value

End Sub

Private Sub Command34_Click()
'ArcSin
If Text1.Text = "Error" Then Exit Sub
On Error GoTo err
Accum.Value = Text1.Text
Accum.ArcSin
Text1.Text = Accum.Value
Exit Sub
err:
Text1.Text = "Error"


End Sub

Private Sub Command35_Click()
'HypSin
If Text1.Text = "Error" Then Exit Sub
On Error GoTo err
Accum.Value = Text1.Text
Accum.HypSin
Text1.Text = Accum.Value
Exit Sub
err:
Text1.Text = "Error"

End Sub

Private Sub Command36_Click()
'Cos
If Text1.Text = "Error" Then Exit Sub
Accum.Value = Text1.Text
Accum.Cos
Text1.Text = Accum.Value

End Sub

Private Sub Command37_Click()
'ArcCos
If Text1.Text = "Error" Then Exit Sub
On Error GoTo err
Accum.Value = Text1.Text
Accum.ArcCos
Text1.Text = Accum.Value
Exit Sub
err:
Text1.Text = "Error"

End Sub

Private Sub Command38_Click()
'HypCos
If Text1.Text = "Error" Then Exit Sub
Accum.Value = Text1.Text
Accum.HypCos
Text1.Text = Accum.Value

End Sub

Private Sub Command39_Click()
'Tan
If Text1.Text = "Error" Then Exit Sub
Accum.Value = Text1.Text
Accum.Tan
Text1.Text = Accum.Value

End Sub

Private Sub Command4_Click()
'div
DoOp ("div")
End Sub

Private Sub Command40_Click()
'ArcTan
If Text1.Text = "Error" Then Exit Sub
Accum.Value = Text1.Text
Accum.ArcTan
Text1.Text = Accum.Value

End Sub

Private Sub Command41_Click()
'HypTan
If Text1.Text = "Error" Then Exit Sub
Accum.Value = Text1.Text
Accum.HypTan
Text1.Text = Accum.Value

End Sub

Private Sub Command42_Click()
'ArcTan2
DoOp ("arctan2")
End Sub

Private Sub Command43_Click()
On Error GoTo err
Accum.Value = 0
PendingOp = ""
PendingVal.Value = 0
If Text1.Text = " " Then Text1.Text = ""
Accum.Format = Text1.Text
PendingVal.Format = Text1.Text
Accum.Value = 0
If Text1.Text = "" Then
Text1.Text = "Format set to Default Format"
Else
Text1.Text = "Format changed successfully"
End If
Exit Sub
err:
Text1.Text = "Invalid Format"
Accum.Format = "TM"
PendingVal.Format = "TM"


End Sub

Private Sub Command5_Click()
'4
If Text1.Text = "Error" Then Exit Sub
display = GetCurrentDisplayVal()
Text1.Text = display & "4"
End Sub

Private Sub Command6_Click()
'5
If Text1.Text = "Error" Then Exit Sub
display = GetCurrentDisplayVal()
Text1.Text = display & "5"
End Sub

Private Sub Command7_Click()
'6
If Text1.Text = "Error" Then Exit Sub
display = GetCurrentDisplayVal()
Text1.Text = display & "6"
End Sub

Private Sub Command8_Click()
'mul
DoOp ("mul")
End Sub

Private Sub Command9_Click()
'1
If Text1.Text = "Error" Then Exit Sub
display = GetCurrentDisplayVal()
Text1.Text = display & "1"
End Sub

Private Sub Form_Load()


 'Create the OraSession Object.
 Set OraSession = CreateObject("OracleInProcServer.XOraSession")

Set Accum = OraSession.CreateOraNumber("0")
Set PendingVal = OraSession.CreateOraNumber("0")
Text1.Text = Accum.Value
PendingOp = ""
opkeyhit = True
On Error GoTo err
Accum.Add "0"
Exit Sub
err:
MsgBox "Error Initializing OraNumber. Demo will not work"

End Sub

Private Sub DoOp(currop As String)

'Operators that require two operands go here
If Text1.Text = "Error" Then Exit Sub
On Error GoTo err

If (currop <> "eq") And (eqmode = True) Then
PendingVal = "0"
PendingOp = ""
End If

If (currop <> "eq") Or (eqmode <> True) Then Accum.Value = Text1.Text

If currop = "eq" Then eqmode = True Else eqmode = False

opkeyhit = True

If PendingOp = "" Then GoTo nopend


If PendingOp = "add" Then PendingVal.Add Accum

If PendingOp = "sub" Then PendingVal.Sub Accum

If PendingOp = "mul" Then PendingVal.Mul Accum

If PendingOp = "div" Then PendingVal.Div Accum

If PendingOp = "power" Then PendingVal.Power Accum

If PendingOp = "arctan2" Then PendingVal.ArcTan2 Accum

If PendingOp = "log" Then PendingVal.Log Accum

If PendingOp = "mod" Then PendingVal.Mod Accum

Text1.Text = PendingVal.Value


nopend:
If currop = "eq" Then
Exit Sub
End If
PendingOp = currop
PendingVal = Text1.Text

Exit Sub
err:
Text1.Text = "Error"



End Sub

Private Sub Text1_KeyDown(KeyCode As Integer, Shift As Integer)
'This clears out the screen when usere starts typing
If Text1.Text = "Error" Then Exit Sub

If opkeyhit = True Then
opkeyhit = False
Text1.Text = ""
End If

End Sub

Private Function GetCurrentDisplayVal()
display = Text1.Text
If display = "0" Then display = ""
If opkeyhit = True Then
display = ""
opkeyhit = False
End If
GetCurrentDisplayVal = display
End Function
