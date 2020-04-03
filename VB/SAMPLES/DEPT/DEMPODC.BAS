Option Explicit

Global OraDatabase As Object

Global Const Connect$ = "scott/tiger"
Global Const DatabaseName$ = "ExampleDb"
Global Const DeptQuery$ = "select * from dept"
Global Const EmpQuery$ = "select * from emp where deptno = :deptno"

