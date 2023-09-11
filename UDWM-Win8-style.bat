@echo off
chcp 65001 > nul

:BWIN8
if exist C:\windows\system32\uDWM.dll.bak (goto :Win8-2) else (goto :B8Win10)
:Win8-2
if exist C:\windows\system32\uDWM.dll.bak2 (goto :B8Win7) else (goto :B8Win8)
:B8Win10
ren C:\windows\system32\uDWM.dll uDWM.dll.bak
ren C:\windows\system32\uDWM.dll.bak2 uDWM.dll
goto :ENDM
:B8Win8
goto :ENDWM
:B8Win7
ren C:\windows\system32\uDWM.dll uDWM.dll.bak3
ren C:\windows\system32\uDWM.dll.bak2 uDWM.dll
goto :ENDM

:ENDM
TASKKILL /f /im DWM.exe
goto :END

:ENDWM
goto :END

:END
