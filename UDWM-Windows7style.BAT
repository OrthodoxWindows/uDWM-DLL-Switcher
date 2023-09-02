@echo off
chcp 65001 > nul

:BWIN7
if exist C:\windows\system32\uDWM.dll.bak (goto :Win7-2) else (goto :B7Win10)
:Win7-2
if exist C:\windows\system32\uDWM.dll.bak2 (goto :B7Win7) else (goto :B7Win8)
:B7Win10
ren C:\windows\system32\uDWM.dll uDWM.dll.bak
ren C:\windows\system32\uDWM.dll.bak3 uDWM.dll
goto :ENDM
:B7Win8
ren C:\windows\system32\uDWM.dll uDWM.dll.bak2
ren C:\windows\system32\uDWM.dll.bak3 uDWM.dll
goto :ENDM
:B7Win7
goto :ENDWM

:ENDM
TASKKILL /f /im DWM.exe
goto :END

:ENDWM
goto :END

:END