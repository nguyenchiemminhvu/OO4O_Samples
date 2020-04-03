VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   5805
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   8520
   LinkTopic       =   "Form1"
   ScaleHeight     =   5805
   ScaleWidth      =   8520
   StartUpPosition =   3  'Windows Default
   Begin VB.Frame Frame2 
      Caption         =   "CLOB Example"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   2895
      Left            =   4680
      TabIndex        =   2
      Top             =   1680
      Width           =   2775
      Begin VB.CommandButton CLOB_Write 
         Caption         =   "Write"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   615
         Left            =   720
         TabIndex        =   6
         Top             =   1680
         Width           =   1695
      End
      Begin VB.CommandButton CLOB_Read 
         Caption         =   "Read"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   615
         Left            =   720
         TabIndex        =   5
         Top             =   720
         Width           =   1695
      End
   End
   Begin VB.Frame Frame1 
      Caption         =   "BLOB  Example"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   2895
      Left            =   840
      TabIndex        =   1
      Top             =   1680
      Width           =   2895
      Begin VB.CommandButton BLOB_Write 
         Caption         =   "Write"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   615
         Left            =   600
         TabIndex        =   4
         Top             =   1680
         Width           =   1815
      End
      Begin VB.CommandButton BLOB_Read 
         Caption         =   "Read"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   615
         Left            =   600
         TabIndex        =   3
         Top             =   720
         Width           =   1815
      End
   End
   Begin VB.Label Label1 
      Caption         =   "Oracle LOB Example"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   -1  'True
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   2400
      TabIndex        =   0
      Top             =   120
      Width           =   3255
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub BLOB_Read_Click()
    'Declare variables as OLE Objects.
    Dim OraSession As OraSession
    Dim OraDatabase As OraDatabase
    Dim OraDynaset As OraDynaset
    Dim PartImage As OraBlob
    Dim chunksize As Long
    Dim AmountRead As Long
    Dim buffer As Variant
    Dim buf() As Byte

    'Create the OraSession Object.
    Set OraSession = CreateObject("OracleInProcServer.XOraSession")

    'Create the OraDatabase Object by opening a connection to Oracle.
    Set OraDatabase = OraSession.OpenDatabase("ExampleDb", "scott/tiger", 0&)

    'Create the OraDynaset Object.
    Set OraDynaset = OraDatabase.CreateDynaset("select * from part", 0&)

   'Get OraBlob from OraDynaset
   Set PartImage = OraDynaset.Fields("part_image").Value

   
   'Set Offset and PollingAmount property for piecewise Read operation
   PartImage.offset = 1
   PartImage.PollingAmount = PartImage.Size
   chunksize = 50000
   'Get a free file number
    FNum = FreeFile

    'Open the file
    Open "image.dat" For Binary As #FNum

    'Do the first read on 'PartImage, buffer must be a variant
    AmountRead = PartImage.Read(buffer, chunksize)
    
    'put will not allow Variant type
    buf = buffer
    
    Put #FNum, , buf

    ' Check for the Status property for polling read operation
    While PartImage.Status = ORALOB_NEED_DATA
        AmountRead = PartImage.Read(buffer, chunksize)
        buf = buffer
        Put #FNum, , buf
    Wend

    Close FNum
    
    MsgBox "Read operation successfull"
End Sub


Private Sub BLOB_Write_Click()
  'Declare variables as OLE Objects.
    Dim OraSession As OraSession
    Dim OraDatabase As OraDatabase
    Dim PartImage As OraBlob
    Dim buffer() As Byte

    'Create the OraSession Object.
    Set OraSession = CreateObject("OracleInProcServer.XOraSession")

    'Create the OraDatabase Object.
    Set OraDatabase = OraSession.OpenDatabase("ExampleDb", "scott/tiger", 0&)

    'Add PartDesc as an Output parameter and set its initial value.
    OraDatabase.Parameters.Add "PartImage", Null, ORAPARM_OUTPUT
    OraDatabase.Parameters("PartImage").serverType = ORATYPE_BLOB

    'Begin the transcation
    OraSession.BeginTrans

   'Execute the statement returing 'PartDesc'
    OraDatabase.ExecuteSQL ("BEGIN select part_image into :PARTIMAGE   from part where part_id = 1 for update NOWAIT; END;")

   'Get 'PartDesc' from Parameters collection
    Set PartImage = OraDatabase.Parameters("PartImage").Value

   'Get a free file number
    FNum = FreeFile
    'Open the file.
    Open "PartImage.Dat" For Binary As #FNum
    
    If (LOF(FNum) = 0) Then
        MsgBox "File size is zero. Make sure that existence of File and its path are correct"
        Exit Sub
    End If
    
    

    'Re adjust the buffer size to hold entire file data
    ReDim buffer(LOF(FNum))

    Get #FNum, , buffer

   'Do one write operation
    amount_written = PartImage.Write(buffer)
    
    Close FNum
    
    MsgBox "Amount written to the LOB data is " & amount_written

  'Ends the trascation
  OraSession.CommitTrans
  
  MsgBox "Write operation successfull"
  
 
End Sub

Private Sub CLOB_Read_Click()
   'Declare variables as OLE Objects.
    Dim OraSession As OraSession
    Dim OraDatabase As OraDatabase
    Dim PartDesc As OraClob
    Dim AmountRead As Long

    Dim buffer As Variant
    Dim buf As String
    


    'Create the OraSession Object.
    Set OraSession = CreateObject("OracleInProcServer.XOraSession")

    'Create the OraDatabase Object.
    Set OraDatabase = OraSession.OpenDatabase("ExampleDb", "scott/tiger", 0&)

    'Add PartDesc as an Output parameter and set its initial value.
    OraDatabase.Parameters.Add "PartDesc", Null, ORAPARM_OUTPUT
    OraDatabase.Parameters("PartDesc").serverType = ORATYPE_CLOB

   'Execute the statement returing 'PartDesc'
    OraDatabase.ExecuteSQL ("BEGIN select part_desc into :PARTDESC   from part where part_id = 1 for update NOWAIT; END;")

   'Get 'PartDesc' from Parameters collection
    Set PartDesc = OraDatabase.Parameters("PartDesc").Value

   'Get a free file number
    FNum = FreeFile
    
    'Open the file.
    Open "Desc.Dat" For Binary As #FNum
    

   'Read entire CLOB value, buffer must be a Variant
    AmountRead = PartDesc.Read(buffer)

    'put will not allow Variant type
    buf = buffer
    
    Put #FNum, , buf
    
    Close FNum
    
    MsgBox "Read operation successfull"
 
End Sub

Private Sub CLOB_Write_Click()
 Dim OraSession As OraSession
 Dim OraDatabase As OraDatabase
 Dim OraDynaset As OraDynaset
 Dim PartDesc As OraClob
 Dim buffer As String
 Dim chunksize As Long
 Dim amount_written As Long
 
 
 'Create the OraSession Object.
 Set OraSession = CreateObject("OracleInProcServer.XOraSession")

 'Create the OraDatabase Object by opening a connection to Oracle.
 Set OraDatabase = OraSession.DbOpenDatabase("ExampleDb", "scott/tiger", 0&)


 'Create the OraDynaset Object
 Set OraDynaset = OraDatabase.Dbcreatedynaset("select * from part", 0&)
 
 Set PartDesc = OraDynaset.Fields("part_desc").Value
   
 chunksize = 32000
 
 'Re adjust the buffer size
 buffer = String$(chunksize, 32)
 
 FNum = FreeFile

 'Open the file.
 Open "partdesc.dat" For Binary As #FNum

 'set the offset and PollingAmount properties for piece wiseWrite operation
 PartDesc.offset = 1
 PartDesc.PollingAmount = LOF(FNum)
 remainder = LOF(FNum)
 
 If (LOF(FNum) = 0) Then
        MsgBox "File size is zero. Make sure that existence of File and its path are correct"
        Exit Sub
 End If
 
 'Lock the row for write operation
 OraDynaset.Edit
 
    Get #FNum, , buffer
        
    'Do first write operation
    amount_written = PartDesc.Write(buffer, chunksize, ORALOB_FIRST_PIECE)
 
    While PartDesc.Status = ORALOB_NEED_DATA
        remainder = remainder - chunksize
        If remainder < chunksize Then
            piecetype = ORALOB_LAST_PIECE
            chunksize = remainder
        Else
            piecetype = ORALOB_NEXT_PIECE
        End If
        Get #FNum, , buffer
        amount_written = PartDesc.Write(buffer, chunksize, piecetype)
    
    Wend
 
    Close FNum
    
'call Update method to commit the transaction
 OraDynaset.Update
 
 MsgBox PartDesc.Size
 
 MsgBox "Write operation successfull"
 
    
End Sub

Private Sub Command1_Click()
 MsgBox PartDesc.Size
 
 OraDynaset.Edit
 
 PartDesc.CopyFromFile "d:\\lob\\partdesc.dat"
 
 OraDynaset.Update
 
 MsgBox PartDesc.Size
 
 Exit Sub
End Sub

Private Sub Schema_Click()

End Sub
