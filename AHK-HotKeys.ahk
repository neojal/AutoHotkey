/*
ToDo:
- charlongpress function
- sound as param when calling from main
- tune snowHelper
*/

#Requires AutoHotkey v2.0
#SingleInstance Force

; Causes the script to behave as though the specified file's contents are present at this exact position.
#Include "./my-includes/constants.ahk"
#Include "./my-includes/combos.ahk"
#Include "./my-includes/commonFunctions.ahk"
#Include "./my-includes/functions.ahk"
#Include "./my-includes/snowHelper.ahk"
#Include "./my-includes/autocomplete.ahk"

; Testing mouse:
; #Include "./my-includes/mouse.ahk"

; DONT INCLUDE IN GIT REPO!!!!!!!!!!!
#Include "./my-includes/autocompleteProject.ahk" 

; Force Scroll Lock off at the beginning of the script
SetScrollLockState("Off")
SetCapsLockState("Off")
SetNumLockState("Off")

; BLOCK TO MONITOR ACTIVE WINDOW ONLY WHEN ITS NOT CAUSED BY MOUSE CLICK
global lastWinId := "" ; Declare and initialize the global variable
global lastInputTrigger := ""


; ~LButton:: listens left mouse button (LButton) being pressed.
; The ~ (tilde) prefix means: don't block the default behavior — the mouse click will still go through to the system or application.
~LButton:: {
    global lastInputTrigger := "Mouse Click"
}

SetTimer(PutMouseOnActiveWindow, 1000) ; Check every 500 milliseconds
PutMouseOnActiveWindow() {
    global lastXPosActiveWindow
    global lastWinId 
    global lastInputTrigger

    ; mouse pointer stuff
    try {
        activeWinId := WinGetID("A")
        WinGetPos &currX, , , , "A"

        ; if activeWindow is not equal to lastWindow, and if there is a change on window position
        if ( activeWinId != lastWinId || currX != lastXPosActiveWindow) {

            lastWinId := activeWinId
            lastXPosActiveWindow := currX

            ; used to avoid Browser child windows popups
            activeWinTitle := WinGetTitle("A")
            
            if( lastInputTrigger != "Mouse Click" && activeWinTitle != ""  ) {

                centerMousePointer()
                ;TscShellContainerClass : Windows Remote Desktop Services (RDS)
                ;ToolTip "The active window's class is " WinGetClass("A")
                ;ToolTip "The active window's ID is " WinGetPID("A")
                ;ToolTip "The active window's ID is " WinGetProcessName("A")
                ;ToolTip "The active window's Title is " WinGetTitle("A")
            }
        }
    } catch {
        
    ; currentWinTitle := "Unknown"
    ; Optional: Log the error or handle it differently
    ; MsgBox("Error getting window title: " e.Message)

    } finally {
        lastInputTrigger := "" ; Reset after use
    }
}

; gets current window dimensions and centers mouse pointer
centerMousePointer() {

    WinGetPos &X, &Y, &W, &H, "A"
    DllCall("SetCursorPos", "int", X+(W/2) , "int", Y+(H/2))
    ; Send("{CtrlDown}{CtrlUp}")
}
; END: BLOCK TO MONITOR ACTIVE WINDOW ONLY WHEN ITS NOT CAUSED BY MOUSE CLICK




; ---- ESPECIAL ----
$Escape::escapeShutdown()
$CapsLock::capsToUpperLower()





; -------- NUMPAD --------
; -------- / * - + keys --------
$NumpadAdd::sendNumPad("NumpadAdd", Combo.ZOOM_IN, testTooltip)
$NumpadSub::sendNumPad("NumpadSub", Combo.ZOOM_OUT)        
$NumpadDiv::sendNumPad("NumpadDiv", SnowInput(), testTooltip)      
$NumpadMult::sendNumPad("NumpadMult", centerMousePointer(), "")

; Edge Tabs
$NumpadHome::sendNumPad("NumpadHome", Combo.BROWSER_NEW_TAB)    
$NumpadUp::sendNumPad("NumpadUp", Combo.BROWSER_RECOVER_TAB)
$NumpadPgup::sendNumPad("NumpadPgUp",Combo.BROWSER_CLOSE_TAB)

; Edge Navigating Tabs
$NumpadLeft::Send(Combo.BROWSER_PREVIOUS_TAB)    
$NumpadClear::Send(Combo.BROWSER_NEXT_TAB)   
$NumpadRight::sendNumPad("NumpadRight", Combo.BROWSER_MOVE_TAB_LEFT, Combo.BROWSER_MOVE_TAB_RIGHT) 

; Navigating Windows
$NumpadEnd::sendNumPad("NumpadEnd", Combo.ALT_TAB, Combo.WIN_SEE_APPS)
$NumpadDown::Send(Combo.WIN_SNAP_LEFT)  
$NumpadPgdn::Send(Combo.WIN_SNAP_MAXIMIZE) 

; Clipboard
$NumpadIns::sendNumPad("NumpadIns", Combo.COPY, Combo.CUT)
$NumpadDel::Send(Combo.PASTE)   

; Non-Logi Mouse
$XButton1::Send(Combo.COPY)
$XButton2::Send(Combo.PASTE)



; ---- OLD KEYBOARD KEYS
;$PrintScreen::Send(Combo.SCREEN_CAPTURE_TEXT)
$ScrollLock::Send(Combo.SCREEN_CAPTURE_TEXT)
$Pause::Send(Combo.LISTENING)

; ---- MEDIA/BUILT IN KEYS ----
Browser_Home::Run BROWSER_PROFILE1
+Browser_Home::Run BROWSER_DEFAULT
Launch_Mail::Run OUTLOOK
Launch_Media::Send Combo.WIN_SOUND_OUT         
Launch_App2::Run KEEPASSXC

; ---- FUNCTION KEYS ----
$F1::singleOrLongPress("F1", Combo.BROWSER_PREVIOUS_TAB, "")
$F2::singleOrLongPress("F2", Combo.BROWSER_NEXT_TAB, "")
$F3::singleOrLongPress("F3", Combo.ZOOM_OUT, "")
$F4::singleOrLongPress("F4", Combo.ZOOM_IN, "")

$F5::singleOrLongPress("F5", Combo.POWER_TOYS_RUN, "")
$F6::singleOrLongPress("F6", Combo.CUT, "Cut!")
$F7::singleOrLongPress("F7", Combo.COPY, "Copy!")
$F8::singleOrLongPress("F8", Combo.PASTE, "Paste!")

$F9::singleOrLongPress("F9", Combo.WIN_EXPLORER, "")
$F10::singleOrLongPress("F10", Combo.SAVE, "Saved!")
$F11::singleOrLongPress("F11", Combo.PRINT, "")
$F12::singleOrLongPress("F12", Combo.CLOSE_WINDOW, "Window Closed")
