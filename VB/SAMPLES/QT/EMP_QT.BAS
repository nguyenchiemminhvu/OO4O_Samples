Attribute VB_Name = "EMPOIP1"

'Global objects
Global OraSession As Object
Global OraDatabase As Object
Global EmpDynaset As Object

' Not required to be constant.
Global Const EmpQuery$ = "select * from emp"
Global Const DatabaseName$ = "Exampledb"
Global Const Connect$ = "scott/tiger"

Global Const WarnFirstEmp$ = "You are already on the first employee."
Global Const WarnLastEmp$ = "You are already on the last employee."

Global Const DUPLICATE_KEY = 1000


Global ErrMsg$
Global ErrNum As Integer

'From ORACONST.TXT
Global Const ORADYN_NOCACHE = &H8&

Global Const CHR = &H8&



Global DoUpdate As Boolean
Global DoAdd As Boolean

Global EmpNoChanged As Boolean


