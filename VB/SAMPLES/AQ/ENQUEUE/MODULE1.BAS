Attribute VB_Name = "Module1"
Public OraSession As Object
Public OraDatabase As Object
Public OraAq As Object
Public OraMsg As Object
Public OraObj As Object

Public Msgid As String
Public OraQueue As String

Public delay As Long
Public priority As Long
Public expiration As Long
Public consumer As String
Public correlation As String
Public correlate As String
Public visibleopt As Long
Public OraAgent As Object
Public multiconsumer As Boolean
Public correlation_isset As Boolean
Public consumer_isset As Boolean
Public consumerarr() As String
Public total_consumers As Integer

Public Sub LoadForm(myForm As Integer)
If (myForm = 2) Then
    Load AQ_AGENT
    AQ_AGENT.Show
ElseIf (myForm = 1) Then
    Load AQ
    AQ.Show
End If
End Sub
