Attribute VB_Name = "Module1"
Public OraSession As Object
Public OraDatabase As Object
Public OraAq As Object
Public OraMsg As Object
Public OraObj As Object

Public Msgid As String
Public OraQueue As String

Public wait As Integer
Public dqmode As Integer
Public navigate As Integer
Public correlate As String
Public multiconsumer As Boolean
Public correlate_isset As Boolean
Public consumer_isset As Boolean
Dim consumer As String

