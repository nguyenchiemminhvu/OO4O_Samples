VERSION 1.0 CLASS
BEGIN
  MultiUse = -1
End
Attribute VB_Name = "DEPTPKG"
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

Public Sub GETNAMES(DEPTID As Variant, ByRef NAME As OraCollection)
  OraDatabase.Parameters.Add "DEPTID", DEPTID, ORAPARM_INPUT, 2
  OraDatabase.Parameters.Add "NAME", Null, ORAPARM_OUTPUT, 247, "ENAMELIST"

  OraDatabase.ExecuteSQL ("Begin DEPTPKG.GETNAMES(:DEPTID, :NAME); end;")

  Set NAME = OraDatabase.Parameters("NAME").Value

  OraDatabase.Parameters.Remove "DEPTID"
  OraDatabase.Parameters.Remove "NAME"
End Sub

