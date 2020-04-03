VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "OBJTEST"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
' local variable(s) to hold property value(s)
Private OraDatabase As OraDatabase 'local copy
Public Property Let database(ByVal vData As OraDatabase)
   Set OraDatabase = vData
End Property

Public Sub OBJ_NT(PERSON_NAME As String, ByRef PERSON_ADDRESS As OraObject)
  OraDatabase.Parameters.Add "PERSON_NAME", PERSON_NAME, ORAPARM_INPUT, 1
  OraDatabase.Parameters.Add "PERSON_ADDRESS", Null, ORAPARM_OUTPUT, 108, "ADDRESS"

  OraDatabase.ExecuteSQL ("Begin OBJTEST.OBJ_NT(:PERSON_NAME, :PERSON_ADDRESS); end;")

  Set PERSON_ADDRESS = OraDatabase.Parameters("PERSON_ADDRESS").Value

  OraDatabase.Parameters.Remove "PERSON_NAME"
  OraDatabase.Parameters.Remove "PERSON_ADDRESS"
End Sub

