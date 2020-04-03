VERSION 5.00
Begin VB.Form frmLogOraError 
   Appearance      =   0  'Flat
   BackColor       =   &H80000005&
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Oracle Messages and Codes"
   ClientHeight    =   1440
   ClientLeft      =   1950
   ClientTop       =   4695
   ClientWidth     =   6675
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
   MaxButton       =   0   'False
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   1440
   ScaleWidth      =   6675
   Begin VB.CommandButton OK 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "OK"
      Default         =   -1  'True
      Height          =   495
      Left            =   5280
      TabIndex        =   0
      Top             =   480
      Width           =   1215
   End
   Begin VB.Image Image1 
      Appearance      =   0  'Flat
      Height          =   480
      Left            =   120
      Picture         =   "LOGOERR.frx":0000
      Top             =   360
      Width           =   480
   End
   Begin VB.Label ErrText 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Label1"
      ForeColor       =   &H80000008&
      Height          =   1215
      Left            =   720
      TabIndex        =   1
      Top             =   120
      Width           =   4455
   End
End
Attribute VB_Name = "frmLogOraError"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub Form_Load()

 Call CenterForm(frmLogOraError)

 If OraSession.LastServerErr = 0 Then
  If Err = 0 Then
   ErrText.Caption = "Normal, successful completion"
  Else
   ErrText.Caption = "VB-" & Err & " " & Error
  End If
 Else
  ErrText.Caption = OraSession.LastServerErrText
 End If

End Sub

Private Sub OK_Click()
 App.HelpFile = ""
 Unload frmLogOraError
End Sub

