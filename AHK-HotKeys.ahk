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
#Include "./my-includes/autocomplete.ahk"
#Include "./my-includes/commonFunctions.ahk"
#Include "./my-includes/functions.ahk"
#Include "./my-includes/snowHelper.ahk"

; Force Scroll Lock off at the beginning of the script
SetScrollLockState("Off")
SetCapsLockState("Off")
SetNumLockState("Off")

; -------- NUMPAD --------
; -------- / * - + keys --------
$NumpadAdd::sendNumPad("NumpadAdd", Combo.ZOOM_IN, testTooltip)
$NumpadSub::sendNumPad("NumpadSub", Combo.ZOOM_OUT)        
$NumpadDiv::sendNumPad("NumpadDiv", SnowInput(), testTooltip)      
;$NumpadMult::sendNumPad("NumpadMult", "", "")

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

; ---- ESPECIAL ----
$Escape::escapeShutdown()
$CapsLock::capsToUpperLower()
