#include <GUIConstantsEx.au3>

Main()

Func Main()
		Local $sFile = "DWM-Switcher.ico"
        Local $hGUI = GUICreate("Paramètres du mode d'affichage de DWM", 256, 200)
		GUISetIcon("DWM-Switcher.ico")

		Local $idButton_DWM10 = GUICtrlCreateButton("Basculer DWM vers le style Windows 10", 10, 35, 210, 25)
        Local $idButton_DWM8 = GUICtrlCreateButton("Basculer DWM vers le style Windows 8", 10, 70, 210, 25)
	    Local $idButton_DWM7 = GUICtrlCreateButton("Basculer DWM vers le style Windows 7", 10, 105, 210, 25)
        Local $idButton_Close = GUICtrlCreateButton("Quitter", 160, 170, 85, 25)

        GUISetState(@SW_SHOW, $hGUI)

        Local $iPID = 0

        While 1
                Switch GUIGetMsg()
                        Case $GUI_EVENT_CLOSE, $idButton_Close
                                ExitLoop
								
						Case $idButton_DWM10
                                ; Run DWM10 script.
                                $iPID = Run(UDWM-Win10-style.bat)
								
						Case $idButton_DWM8
                                ; Run DWM8 script.
                                $iPID = Run("UDWM-Win8-style.bat")
				
			            Case $idButton_DWM7
                                ; Run DWM7 script.
                                $iPID = Run("UDWM-Win7-style.bat")
							
							
                EndSwitch
        WEnd

        GUIDelete($hGUI)

        If $iPID Then ProcessClose($iPID)
EndFunc   ;==>Main
