# Microsoft Developer Studio Project File - Name="VSDEPT32" - Package Owner=<4>
# Microsoft Developer Studio Generated Build File, Format Version 6.00
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Application" 0x0101

CFG=VSDEPT32 - Win32 Release
!MESSAGE This is not a valid makefile. To build this project using NMAKE,
!MESSAGE use the Export Makefile command and run
!MESSAGE 
!MESSAGE NMAKE /f "Vsdept32.mak".
!MESSAGE 
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "Vsdept32.mak" CFG="VSDEPT32 - Win32 Release"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "VSDEPT32 - Win32 Release" (based on "Win32 (x86) Application")
!MESSAGE 

# Begin Project
# PROP AllowPerConfigDependencies 0
# PROP Scc_ProjName ""
# PROP Scc_LocalPath ""
CPP=cl.exe
MTL=midl.exe
RSC=rc.exe
# PROP BASE Use_MFC 1
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir ".\WinRel"
# PROP BASE Intermediate_Dir ".\WinRel"
# PROP Use_MFC 1
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\WinRel"
# PROP Intermediate_Dir ".\WinRel"
# PROP Ignore_Export_Lib 0
# ADD BASE CPP /nologo /MT /W3 /GX /O1 /I "..\..\..\include" /I "..\..\include" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_MBCS" /FR /YX /c
# ADD CPP /nologo /MT /W3 /GX /O1 /I "..\..\..\include" /I "..\..\include" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_MBCS" /Yu"STDAFX.H" /FD /c
# SUBTRACT CPP /Fr
# ADD BASE MTL /nologo /D "NDEBUG" /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x409 /d "NDEBUG"
# ADD RSC /l 0x409 /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ..\..\lib\omfc.lib oldnames.lib ..\..\..\lib\oraclm.lib /nologo /stack:0x20000 /subsystem:windows /machine:IX86
# ADD LINK32 ..\..\lib\omfc60.lib oldnames.lib ..\..\..\lib\oraclm32.lib /nologo /stack:0x20000 /subsystem:windows /machine:IX86 /nodefaultlib:"libc.lib"
# Begin Target

# Name "VSDEPT32 - Win32 Release"
# Begin Group "Source Files"

# PROP Default_Filter "cpp;c;cxx;rc;def;r;odl;hpj;bat;for;f90"
# Begin Source File

SOURCE=.\MAINFRM.CPP
# End Source File
# Begin Source File

SOURCE=.\STDAFX.CPP
# ADD BASE CPP /Yc"STDAFX.H"
# ADD CPP /Yc"STDAFX.H"
# End Source File
# Begin Source File

SOURCE=.\VSDEPDOC.CPP
# End Source File
# Begin Source File

SOURCE=.\VSDEPT2.CPP
# End Source File
# Begin Source File

SOURCE=.\VSDEPT2.DEF
# End Source File
# Begin Source File

SOURCE=.\VSDEPT2.RC
# End Source File
# Begin Source File

SOURCE=.\VSDEPVW.CPP
# End Source File
# End Group
# Begin Group "Header Files"

# PROP Default_Filter "h;hpp;hxx;hm;inl;fi;fd"
# Begin Source File

SOURCE=.\mainfrm.h
# End Source File
# Begin Source File

SOURCE=.\stdafx.h
# End Source File
# Begin Source File

SOURCE=.\vsdepdoc.h
# End Source File
# Begin Source File

SOURCE=.\vsdept2.h
# End Source File
# Begin Source File

SOURCE=.\vsdepvw.h
# End Source File
# End Group
# Begin Group "Resource Files"

# PROP Default_Filter "ico;cur;bmp;dlg;rc2;rct;bin;cnt;rtf;gif;jpg;jpeg;jpe"
# Begin Source File

SOURCE=.\RES\TOOLBAR.BMP
# End Source File
# Begin Source File

SOURCE=.\RES\VSDEPT2.ICO
# End Source File
# Begin Source File

SOURCE=.\res\vsdept2.rc2
# End Source File
# End Group
# End Target
# End Project
