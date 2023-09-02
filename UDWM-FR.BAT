@echo off
chcp 65001 > nul
title Paramètres du mode d'affichage de DWM
color 0A

if exist C:\windows\system32\uDWM.dll.bak (goto :2) else (goto :Win10)
:2
if exist C:\windows\system32\uDWM.dll.bak2 (goto :Win7) else (goto :Win8)

:Win10
echo.
echo  ////////////////////////////////////////////////////////////////
echo. /  Le mode d´affichage DWM actuellement activé est Windows 10  /
echo  ////////////////////////////////////////////////////////////////
echo.
goto :Menu
:Win8
echo.
echo  ///////////////////////////////////////////////////////////////
echo. /  Le mode d´affichage DWM actuellement activé est Windows 8  /
echo  ///////////////////////////////////////////////////////////////
echo.
goto :Menu
:Win7
echo.
echo  ///////////////////////////////////////////////////////////////
echo. /  Le mode d´affichage DWM actuellement activé est Windows 7  /
echo  ///////////////////////////////////////////////////////////////
echo.
goto :Menu

:Menu
echo ********************************************************************
echo * ---------------------------------------------------------------- *
echo *              Changement du mode d´affichage de DWM               *
echo * ---------------------------------------------------------------- *
echo *                                                                  *
echo * Appuyez sur S pour basculer le mode DWM vers le style Windows 7, *
echo *       E pour basculer le mode DWM vers le style Windows 8,       *
echo *       T pour basculer le mode DWM vers le style Windows 10,      *
echo *       A pour annuler le changement et quitter le programme       *
echo ********************************************************************
echo.

CHOICE /C SETA
if "%errorlevel%"=="1" goto :BWIN7
if "%errorlevel%"=="2" goto :BWIN8
if "%errorlevel%"=="3" goto :BWIN10
if "%errorlevel%"=="4" goto :END

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
