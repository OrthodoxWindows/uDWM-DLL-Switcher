@echo off
chcp 65001 > nul

:BWIN10
if exist C:\windows\system32\uDWM.dll.bak (goto :Win10-2) else (goto :B10Win10)
:Win10-2
if exist C:\windows\system32\uDWM.dll.bak2 (goto :B10Win7) else (goto :B10Win8)
:B10Win10
goto :ENDWM
:B10Win8
ren C:\windows\system32\uDWM.dll uDWM.dll.bak2
ren C:\windows\system32\uDWM.dll.bak uDWM.dll
goto :ENDM
:B10Win7
ren C:\windows\system32\uDWM.dll uDWM.dll.bak3
ren C:\windows\system32\uDWM.dll.bak uDWM.dll
goto :ENDM

:ENDM
TASKKILL /f /im DWM.exe
goto :END

:ENDWM
goto :END

:END