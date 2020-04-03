Attribute VB_Name = "Module1"
Global Const LISTVIEW_BUTTON = 11
Global user$, pass$, connectstr$
Global OSess As OraSession
Global odb As OraDatabase
Global ODyn As OraDynaset
' Global OMData As OraMetaData
' Global OMDataAttr As OraMDAttribute
Global SchemaObjectName$
Public fMainForm As frmMain

' Given an metadata type, return a string representation
Function GetMetaDataType(mdtype As Integer) As String
GetMetaDataType = Switch( _
mdtype = ORAMD_TABLE, "Table", _
mdtype = ORAMD_VIEW, "View", _
mdtype = ORAMD_COLUMN, "Column", _
mdtype = ORAMD_COLUMN_LIST, "Column List", _
mdtype = ORAMD_TYPE, "Type", _
mdtype = ORAMD_TYPE_ATTR, "Type Attribute", _
mdtype = ORAMD_TYPE_ATTR_LIST, "Attribute List", _
mdtype = ORAMD_TYPE_METHOD, "Type Method", _
mdtype = ORAMD_TYPE_METHOD_LIST, "Method List", _
mdtype = ORAMD_TYPE_ARG, "Type Method Argument", _
mdtype = ORAMD_TYPE_RESULT, "Result", _
mdtype = ORAMD_PROC, "Procedure", _
mdtype = ORAMD_FUNC, "Function", _
mdtype = ORAMD_ARG, "Argument", _
mdtype = ORAMD_ARG_LIST, "Argument List", _
mdtype = ORAMD_PACKAGE, "Package", _
mdtype = ORAMD_SUBPROG_LIST, "Package List", _
mdtype = ORAMD_COLLECTION, "Collection", _
mdtype = ORAMD_SYNONYM, "Synonym", _
mdtype = ORAMD_SEQENCE, "Sequence", _
mdtype = ORAMD_SCHEMA, "Schema", _
mdtype = ORAMD_OBJECT_LIST, "Object List", _
mdtype = ORAMD_SCHEMA_LIST, "Schema List", _
mdtype = ORAMD_DATABASE, "Database")
End Function

Function InsertAttributeNodes(tv As TreeView, md As OraMetaData, parent As Integer, level As Integer) As Boolean
Dim i%
Dim attr As OraMDAttribute
Dim md1 As Object
Dim node As node, attrVal
Dim str As String

InsertAttributeNodes = True

If level = 0 Then
    InsertAttributeNodes = False
End If

If (InsertAttributeNodes <> True) Then
    Exit Function
End If

On Error GoTo err_insert
' Set attr = md.Attribute(md.Count)
For i = 0 To md.Count - 1
    Set attr = md.Attribute(i)
    
    If (attr.IsMDObject) Then
        Set md1 = attr.Value
        Set node = tv.Nodes.Add(parent, tvwChild, , attr.Name & "   (" & GetMetaDataType(md1.Type) + ")")
        node.Image = 1
        node.SelectedImage = 2
        InsertAttributeNodes = InsertAttributeNodes(tv, md1, node.Index, level - 1)
    Else
        attrVal = attr.Value
        Set node = tv.Nodes.Add(parent, tvwChild, , attr.Name & "   " & attrVal)
        node.Image = 3
    End If

    ' Set attr = Nothing
Loop_Continue:
Next i

Exit Function

err_insert:
    ' insert the error message
    ' MsgBox Error$
    ' MsgBox ODb.LastServerErr
    ' MsgBox ODb.LastServerErrText
    Set node = tv.Nodes.Add(parent, tvwChild, , attr.Name & " " & Error$)
    Resume Loop_Continue
    
End Function
Function isScalarTableOrView(odb As OraDatabase, tabname As String) As Boolean
  On Error GoTo err_isTableOrView
  Dim OMData As OraMetaData

  Set OMData = odb.Describe(tabname)
  
  If (OMData.Type = ORAMD_TABLE) Or (OMData.Type = ORAMD_VIEW) Then
  'check if only scalar types
    isScalarTableOrView = True
  Else
    MsgBox tabname & " is not a table or a view"
    isScalarTableOrView = False
  End If

Exit Function
err_isTableOrView:
    MsgBox Err.Description
    isScalarTableOrView = False
End Function
Sub LoadTree()
  Dim nodRoot As node, nodx As node
  Dim tvTreeView As TreeView
  Dim iNextParentImage As Integer
  Dim OMData As OraMetaData
  Dim ret As Boolean
  
    
  On Error GoTo err_loadtree
  
  Set tvTreeView = fMainForm.tvTreeView
       
  Set nodRoot = tvTreeView.Nodes.Add(, , , SchemaObjectName)
  nodRoot.Image = 1
  nodRoot.SelectedImage = 2
  
  On Error Resume Next
  odb.LastServerErrReset
  Set OMData = odb.Describe(SchemaObjectName)
  If odb.LastServerErr <> 0 Then
       MsgBox "Invalid Schema: " & Error$
       tvTreeView.Visible = False
     Else
       tvTreeView.Visible = True
    End If

On Error GoTo err_loadtree
'Add children of SchemaObjectName
ret = InsertAttributeNodes(tvTreeView, OMData, nodRoot.Index, 10)

Exit Sub
       
err_loadtree:
    MsgBox Error$
  
End Sub
Sub Main()
    Dim fLogin As New frmLogin
    
    On Error GoTo err_main
    fLogin.Show vbModal
    If Not fLogin.OK Then
        'Login Failed so exit app
        End
    End If
    Unload fLogin
        
    Set fMainForm = New frmMain
        
    fMainForm.Show
  
    LoadTree
        
    Set OMData = Nothing
    
    Exit Sub
    
err_main:
    MsgBox "Fatal Error : " & Error
    
End Sub
