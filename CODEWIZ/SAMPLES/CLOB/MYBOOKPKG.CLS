VERSION 1.0 CLASS
BEGIN
  MultiUse = -1
End
Attribute VB_Name = "MYBOOKPKG"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
' local variable(s) to hold property value(s)
Private OraDatabase As OraDatabase 'local copy
Public Property Let database(ByVal vData As OraDatabase)
   set OraDatabase = vData
End Property

Public Sub GETCHAPTER(CHAPNO As Variant, ByRef CHAP As OraCLOB)
  OraDatabase.Parameters.Add "CHAPNO", CHAPNO, ORAPARM_INPUT, 2
  OraDatabase.Parameters.Add "CHAP", Null, ORAPARM_OUTPUT, 112

  OraDatabase.ExecuteSQL ("Begin MYBOOKPKG.GETCHAPTER(:CHAPNO, :CHAP); end;")

  Set CHAP = OraDatabase.Parameters("CHAP").Value

  OraDatabase.Parameters.Remove "CHAPNO"
  OraDatabase.Parameters.Remove "CHAP"
End Sub

