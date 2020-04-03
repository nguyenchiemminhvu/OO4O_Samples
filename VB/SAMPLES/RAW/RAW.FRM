VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Raw Test"
   ClientHeight    =   3195
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   ScaleHeight     =   3195
   ScaleWidth      =   4680
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Command1 
      Caption         =   "Run Test"
      Height          =   615
      Left            =   1080
      TabIndex        =   0
      Top             =   1200
      Width           =   2295
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
Dim OraSession As OraSession
Dim OraDatabase As OraDatabase
Dim OraDynaset As OraDynaset
Dim iKey As Long
Dim outtable As OraParamArray
Dim intable As OraParamArray
Dim bothtable As OraParamArray
Dim testarray1(1999) As Byte
Dim testarray2(1999) As Byte
Set OraSession = CreateObject("OracleInProcServer.XOraSession")
Set OraDatabase = OraSession.OpenDatabase("ExampleDB", "scott/tiger", 0&)

'Populate testarray1 and testarray2 with a repeating sequence
seq = 0
For i = 0 To 1999
seq = seq + 1
If seq > 100 Then seq = 1
testarray1(i) = seq
testarray2(i) = seq + 10
Next
 
'OraParameter example
OraDatabase.Parameters.Add "IN", testarray1, ORAPARM_INPUT
OraDatabase.Parameters("IN").serverType = ORATYPE_RAW_BIN
OraDatabase.Parameters.Add "OUT", Null, ORAPARM_OUTPUT
OraDatabase.Parameters("OUT").serverType = ORATYPE_RAW_BIN
OraDatabase.Parameters("OUT").MinimumSize = 2000
OraDatabase.Parameters.Add "BOTH", testarray2, ORAPARM_BOTH
OraDatabase.Parameters("BOTH").serverType = ORATYPE_RAW_BIN

OraDatabase.ExecuteSQL ("begin rawtest.scalartest(:in, :out, :both); end;")

outArray = OraDatabase.Parameters("OUT").Value
bothArray = OraDatabase.Parameters("BOTH").Value

'OraParamArray example

OraDatabase.Parameters.AddTable "outtable", ORAPARM_OUTPUT, ORATYPE_RAW_BIN, 3, 2000
OraDatabase.Parameters.AddTable "intable", ORAPARM_INPUT, ORATYPE_RAW_BIN, 3, 2000
OraDatabase.Parameters.AddTable "bothtable", ORAPARM_BOTH, ORATYPE_RAW_BIN, 3, 2000
 
Set outtable = OraDatabase.Parameters("outtable")
Set intable = OraDatabase.Parameters("intable")
Set bothtable = OraDatabase.Parameters("bothtable")
For iKey = 0 To 2
    intable.put_Value testarray1, iKey
    bothtable.put_Value testarray2, iKey
Next

OraDatabase.ExecuteSQL ("begin rawtest.arraytest(:intable, :outtable, :bothtable); end;")

For iKey = 0 To 2
inarray = intable(iKey)
outArray = outtable(iKey)
bothArray = bothtable(iKey)
Next
End Sub
