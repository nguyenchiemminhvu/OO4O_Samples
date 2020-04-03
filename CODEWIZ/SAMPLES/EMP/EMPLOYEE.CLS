VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "EMPLOYEE"
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

Public Sub GETEMPDATA(INDEPTNO As Variant, ByRef EMPCURSOR As OraDynaset)
  OraDatabase.Parameters.Add "INDEPTNO", INDEPTNO, ORAPARM_INPUT, 2
  OraDatabase.Parameters.Add "EMPCURSOR", EMPCURSOR, ORAPARM_OUTPUT, 102

  OraDatabase.ExecuteSQL ("Begin EMPLOYEE.GETEMPDATA(:INDEPTNO, :EMPCURSOR); end;")

  Set EMPCURSOR = OraDatabase.Parameters("EMPCURSOR").Value

  OraDatabase.Parameters.Remove "INDEPTNO"
  OraDatabase.Parameters.Remove "EMPCURSOR"
End Sub

Public Sub GETEMPDATE(INEMPNO As Variant, ByRef OUTEMPDATE As Date)
  OraDatabase.Parameters.Add "INEMPNO", INEMPNO, ORAPARM_INPUT, 2
  OraDatabase.Parameters.Add "OUTEMPDATE", OUTEMPDATE, ORAPARM_OUTPUT, 12

  OraDatabase.ExecuteSQL ("Begin EMPLOYEE.GETEMPDATE(:INEMPNO, :OUTEMPDATE); end;")

  OUTEMPDATE = OraDatabase.Parameters("OUTEMPDATE").Value

  OraDatabase.Parameters.Remove "INEMPNO"
  OraDatabase.Parameters.Remove "OUTEMPDATE"
End Sub

Public Sub GETEMPNAME(INEMPNO As Variant, ByRef OUTEMPNAME As String)
  OraDatabase.Parameters.Add "INEMPNO", INEMPNO, ORAPARM_INPUT, 2
  OraDatabase.Parameters.Add "OUTEMPNAME", OUTEMPNAME, ORAPARM_OUTPUT, 1

  OraDatabase.ExecuteSQL ("Begin EMPLOYEE.GETEMPNAME(:INEMPNO, :OUTEMPNAME); end;")

  OUTEMPNAME = OraDatabase.Parameters("OUTEMPNAME").Value

  OraDatabase.Parameters.Remove "INEMPNO"
  OraDatabase.Parameters.Remove "OUTEMPNAME"
End Sub

Public Sub GETEMPNAMESINARRAY(ARRAYSIZE As Variant, INEMPNOS() As Variant, ByRef OUTEMPNAMES() As String)
  OraDatabase.Parameters.Add "ARRAYSIZE", ARRAYSIZE, ORAPARM_INPUT, 2
  Dim INEMPNOS_OraParamArray As OraParamArray
  OraDatabase.Parameters.AddTable "INEMPNOS", ORAPARM_INPUT, 2, UBound(INEMPNOS) - LBound(INEMPNOS), 22
  Set INEMPNOS_OraParamArray = OraDatabase.Parameters("INEMPNOS")
  Dim INEMPNOS_OraParamArray_count As Integer
  For INEMPNOS_OraParamArray_count = 0 To UBound(INEMPNOS) - LBound(INEMPNOS) - 1
    INEMPNOS_OraParamArray(INEMPNOS_OraParamArray_count) = INEMPNOS(INEMPNOS_OraParamArray_count + LBound(INEMPNOS))
  Next INEMPNOS_OraParamArray_count
  Dim OUTEMPNAMES_OraParamArray As OraParamArray
  OraDatabase.Parameters.AddTable "OUTEMPNAMES", ORAPARM_OUTPUT, 1, UBound(OUTEMPNAMES) - LBound(OUTEMPNAMES), 10
  Set OUTEMPNAMES_OraParamArray = OraDatabase.Parameters("OUTEMPNAMES")

  OraDatabase.ExecuteSQL ("Begin EMPLOYEE.GETEMPNAMESINARRAY(:ARRAYSIZE, :INEMPNOS, :OUTEMPNAMES); end;")

  Dim OUTEMPNAMES_OraParamArray_count As Integer
  For OUTEMPNAMES_OraParamArray_count = 0 To UBound(OUTEMPNAMES) - LBound(OUTEMPNAMES) - 1
    OUTEMPNAMES(OUTEMPNAMES_OraParamArray_count + LBound(OUTEMPNAMES)) = OUTEMPNAMES_OraParamArray(OUTEMPNAMES_OraParamArray_count)
  Next OUTEMPNAMES_OraParamArray_count

  OraDatabase.Parameters.Remove "ARRAYSIZE"
  OraDatabase.Parameters.Remove "INEMPNOS"
  OraDatabase.Parameters.Remove "OUTEMPNAMES"
End Sub

Public Function GETEMPSAL(INEMPNO As Variant) As Variant
  OraDatabase.Parameters.Add "INEMPNO", INEMPNO, ORAPARM_INPUT, 2
  OraDatabase.Parameters.Add "result", 0, ORAPARM_OUTPUT
  OraDatabase.Parameters("result").serverType = 2

  OraDatabase.ExecuteSQL ("declare result Number; Begin :result := EMPLOYEE.GETEMPSAL(:INEMPNO); end;")


  OraDatabase.Parameters.Remove "INEMPNO"
  GETEMPSAL = OraDatabase.Parameters("result").Value
  OraDatabase.Parameters.Remove "result"
End Function

