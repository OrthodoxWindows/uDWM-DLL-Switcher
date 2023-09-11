#include <GUIConstantsEx.au3>

Main()

Func Main()
		Local $sFile = "DWM-Switcher.ico"
        Local $hGUI = GUICreate("DWM Display Mode Settings", 256, 200)
		GUISetIcon("DWM-Switcher.ico")

		Local $idButton_DWM10 = GUICtrlCreateButton("Switch to Windows 10 DWM style", 10, 35, 180, 25)
        Local $idButton_DWM8 = GUICtrlCreateButton("Switch to Windows 8 DWM style", 10, 70, 180, 25)
	    Local $idButton_DWM7 = GUICtrlCreateButton("Switch to Windows 7 DWM style", 10, 105, 180, 25)
        Local $idButton_Close = GUICtrlCreateButton("Close", 160, 170, 85, 25)

        GUISetState(@SW_SHOW, $hGUI)

        Local $iPID = 0

        While 1
                Switch GUIGetMsg()
                        Case $GUI_EVENT_CLOSE, $idButton_Close
                                ExitLoop
								
						Case $idButton_DWM10
                                ; Run DWM10 script.
                                $iPID = Run("UDWM-Win10-style.bat", "")
								
						Case $idButton_DWM8
                                ; Run DWM8 script.
                                $iPID = Run("UDWM-Win8-style.bat", "")
				
			            Case $idButton_DWM7
                                ; Run DWM7 script.
                                $iPID = Run("UDWM-Win7-style.bat", "")
							
							
                EndSwitch
        WEnd

        GUIDelete($hGUI)

        If $iPID Then ProcessClose($iPID)
EndFunc   ;==>Main
