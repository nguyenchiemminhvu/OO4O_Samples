VERSION 5.00
Begin VB.Form frmChunk 
   Caption         =   "Form1"
   ClientHeight    =   5985
   ClientLeft      =   2910
   ClientTop       =   1335
   ClientWidth     =   6810
   LinkTopic       =   "Form1"
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   5985
   ScaleWidth      =   6810
   Begin VB.CommandButton cmdVerify 
      Caption         =   "Verify!"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1212
      Left            =   1440
      TabIndex        =   7
      Top             =   4440
      Width           =   3972
   End
   Begin VB.CommandButton cmdObjectSizeChange 
      Caption         =   "Change"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   492
      Left            =   3120
      TabIndex        =   2
      Top             =   1200
      Width           =   2292
   End
   Begin VB.TextBox txtObjectSize 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   372
      Left            =   1440
      TabIndex        =   1
      Text            =   "102400"
      Top             =   1200
      Width           =   1212
   End
   Begin VB.Frame frmObjectSize 
      Caption         =   "Object Size"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1092
      Left            =   1200
      TabIndex        =   8
      Top             =   840
      Width           =   4452
   End
   Begin VB.CommandButton cmdGetChunkByte 
      Caption         =   "GetChunkByte"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   732
      Left            =   3120
      TabIndex        =   6
      Top             =   3360
      Width           =   2292
   End
   Begin VB.CommandButton cmdAppendChunkByte 
      Caption         =   "AppendChunkByte"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   732
      Left            =   3120
      TabIndex        =   4
      Top             =   2280
      Width           =   2292
   End
   Begin VB.TextBox txtGetChunkSize 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   372
      Left            =   1440
      TabIndex        =   5
      Text            =   "10240"
      Top             =   3720
      Width           =   1212
   End
   Begin VB.TextBox txtAppendChunkSize 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   372
      Left            =   1440
      TabIndex        =   3
      Text            =   "10240"
      Top             =   2640
      Width           =   1212
   End
   Begin VB.Label lblGetChunkSize 
      Caption         =   "Get Chunk Size:"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   252
      Left            =   1200
      TabIndex        =   10
      Top             =   3360
      Width           =   1452
   End
   Begin VB.Label lblAppendChunkSize 
      Caption         =   "Append Chunk Size:"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   252
      Left            =   1200
      TabIndex        =   9
      Top             =   2280
      Width           =   1812
   End
   Begin VB.Label lblTitle 
      Caption         =   "Access to Oracle LONG RAW column"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   -1  'True
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   372
      Left            =   1200
      TabIndex        =   0
      Top             =   240
      Width           =   4452
   End
End
Attribute VB_Name = "frmChunk"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

 'Declare variables as OLE Objects.
 Dim OraSession As Object
 Dim OraDatabase As Object
 Dim OraDynaset As Object

 'Raw data buffers
 Dim SrcBlob(), DestBlob() As Byte
 Dim BlobSize As Long
 
Private Sub cmdAppendChunkByte_Click()
 
 'Delete data from the test table
 OraDatabase.DbExecuteSQL ("delete from oo4oblob")

 AppendChunkByteExample

End Sub

Private Sub cmdGetChunkByte_Click()

 GetChunkByteExample

End Sub

Private Sub cmdObjectSizeChange_Click()

 UpdateObjectSize
  
End Sub

Private Sub cmdVerify_Click()
 
 For I = 0 To BlobSize - 1

  If SrcBlob(I) <> DestBlob(I) Then
   Msg = "SrcBlob(" & I & ")" & SrcBlob(I) & "<> DestBlob(" & I & ")" & DestBlob(I) & Chr(13) & Chr(10) & "Continue?"
   Style = vbYesNo + vbDefalutButton1
   Title = "Error"
   Response = MsgBox(Msg, Style, Title)
   If Response = vbNo Then
    GoTo Verify_End
   End If
  End If

 Next I
 
 MsgBox "Fine!"

Verify_End:

End Sub

Private Sub Form_Load()

 'Create the OraSession Object.
 Set OraSession = CreateObject("OracleInProcServer.XOraSession")

 'Create the OraDatabase Object by opening a connection to Oracle.
 Set OraDatabase = OraSession.DbOpenDatabase("ExampleDb", "scott/tiger", 0&)

 'Create a test table
 OraDatabase.DbExecuteSQL ("create table oo4oblob(longraw long raw)")
 
 'Create the OraDynaset Object.
 Set OraDynaset = OraDatabase.DbCreateDynaset("select longraw from oo4oblob", 0&)
  
 'Update object size
 UpdateObjectSize
  
End Sub


Private Sub Form_Unload(Cancel As Integer)
 
 'drop the test table
 OraDatabase.DbExecuteSQL ("drop table oo4oblob")

End Sub



Public Sub UpdateObjectSize()

 Dim I As Long

 'Redim buffers
 BlobSize = CLng(frmChunk.txtObjectSize)
 ReDim SrcBlob(BlobSize), DestBlob(BlobSize)

 'Create RAW data
 Randomize
 
 For I = 0 To BlobSize - 1
  SrcBlob(I) = Int(256 * Rnd)
 Next I

End Sub

Public Sub AppendChunkByteExample()

 'Declare various variables.
 Dim NumChunks As Integer, RemChunkSize As Long
 Dim I, J As Long
 Dim ChunkSize As Long, CurChunkSize As Long
 Dim Chunk() As Byte
 
 'Set the size of each chunk.
 ChunkSize = CLng(frmChunk.txtAppendChunkSize)
 
 frmChunk.MousePointer = HOURGLASS
  
 'Begin an add operation.
 OraDynaset.DbAddNew
 
 'Clear the LONGRAW field.
 OraDynaset.Fields("LONGRAW").Value = ""
  
 'Set number of chunks.
 NumChunks = BlobSize \ ChunkSize
 
 'Set number of remaining bytes.
 RemChunkSize = BlobSize Mod ChunkSize
 
 CurChunkSize = ChunkSize
 ReDim Chunk(CurChunkSize)
 
 'Loop through the blob.
 For I = 0 To NumChunks
 
  'Calculate the new chunk size.
  If I = NumChunks Then
   CurChunkSize = RemChunkSize
   ReDim Chunk(CurChunkSize)
  End If
   
  'Put data into chunk
  For J = 0 To CurChunkSize
   Chunk(J) = SrcBlob(I * ChunkSize + J)
  Next J
  
  'Append chunk to LONGRAW field.
  OraDynaset.Fields("LONGRAW").DbAppendChunkByte Chunk(0), CurChunkSize
 
 Next I
 
 'Complete the add operation and update the database.
 OraDynaset.DbUpdate
 
 frmChunk.MousePointer = Default
 
End Sub

Public Sub GetChunkByteExample()
 
 'Declare various variables
 Dim CurSize As Long, ChunkSize  As Long
 Dim I, J As Long
 Dim CurChunk() As Byte
 
 'Set the size of each chunk
 ChunkSize = CLng(frmChunk.txtGetChunkSize)
 
 'Redim CurChunk Array
 ReDim CurChunk(ChunkSize)

 frmChunk.MousePointer = HOURGLASS
 
 'Refresh the dynaset.
 OraDynaset.DbRefresh

 I = 0
 'Loop through all of the chunks
 'Oracle does not return the size of columns > 64KB.
 'We should loop until the length of our block is
 'less than we asked for.

 Do
  'Get chunk from long raw field
  CurSize = OraDynaset.Fields("LONGRAW").DbGetChunkByte(CurChunk(0), I * ChunkSize, ChunkSize)
  If CurSize < ChunkSize Then
   ReDim Chunk(CurSize)
   CurSize = OraDynaset.Fields("LONGRAW").DbGetChunkByte(CurChunk(0), I * ChunkSize, CurSize)
  End If
  
  'Put chunk into buffer
  For J = 0 To CurSize
   DestBlob(I * ChunkSize + J) = CurChunk(J)
  Next J
  
  I = I + 1
 Loop Until CurSize < ChunkSize
 
 frmChunk.MousePointer = Default

End Sub

