/*
 * Sends the normal key on short press or combo/action on long key press.

 * @param key to listen to and the one to send on short/normal press.
 * @param action Combo or function to send (e.g., combo: "{CtrlDown}t{CtrlUp}").
 * @param tooltip to send after longpress action has been sent
 */
singleOrLongPress(key, action, tooltipText := "") {
    if ( isKeyPressedForDuration(key, MS_300, BEEP_TRUE) ) {
        sendComboOrCallFunction(action)
        if (tooltipText != "")
            myToolTip(tooltipText, MS_1000)
    } else {
        Send("{" key "}")
    }
}

/*
 * Sends a key combination or executes a function based on short/long press.
 * Original key functionality is completely ignored unless it is passed as action.
 *
 * @param key to listen to.
 * @param action Combo or function to send (e.g., combo: "{CtrlDown}t{CtrlUp}").
 * @param longAction <Optional> Combo or function to send if key's long-press is done (e.g., function: "SnowInput").
 */
shortOrLongPressAction(key, action :="", longAction := "") {
    if ( isKeyPressedForDuration(key, MS_300, BEEP_TRUE) ) {
        action := longAction
    } 
    sendComboOrCallFunction(action)
}

/*
 * Sends a key combination or executes a function based on the state of NumLock and short/long press.
 *
 * @param numpadKey The key to send if NumLock is on (e.g., "Numpad7"). Ignores action.
 * @param action The key combination, or function, to send if NumLock is off (e.g., "{CtrlDown}t{CtrlUp}").
 * @param longAction The key combination, or function, to send if NumLock is off and a long-press is done (e.g., "SnowInput()").
 */
 sendNumPad(numpadKey, action, longAction := "") {
    if isNumLock()
        Send("{" numpadKey "}")
    else
        shortOrLongPressAction(numpadKey, action, longAction)
}

; long press calls shutdown dialog.
; keeps normal esc on normal press.
escapeShutdown() {
    releaseTime := getReleaseTimeMs("Escape", BEEP_TRUE)
    
    if ( releaseTime >= MS_300 AND releaseTime < MS_1000 ) {
        myToolTip("Close Window!", MS_1000)
        Send Combo.CLOSE_WINDOW
    }
    else if ( releaseTime >= MS_1000 ) {
        Send Combo.SHOW_DESKTOP
        Sleep 50
        Send Combo.CLICK_DESKTOP
        Sleep 50
        Send Combo.CLOSE_WINDOW
        myToolTip("Going to say Goodbye!?", MS_1000)
    }
    else {
        Send '{Esc}'
    }
}

; toUpper or toLower with CapsLock long press
capsToUpperLower() {
    if ( isKeyPressedForDuration("CapsLock", MS_300) ) {
        
        oldClipboard := ClipboardAll()       ; Save the current CLIPBOARD CONtents to be restored later
        A_Clipboard := ""                  ; Start off empty to allow ClipWait to detect when the text has arrived.
        Send combo.COPY                          ; Copy the selected text to the clipboard
        ClipWait                       ; Wait for the clipboard to contain text
        capsState := GetKeyState("CapsLock", "T")   ; gets if capsState is ON or OFF

        if (capsState)
            A_Clipboard := StrLower(A_Clipboard)
        else
            A_Clipboard := StrUpper(A_Clipboard)

        Send A_Clipboard ; Replace the selected text with the modified clipboard content
        A_Clipboard := oldClipboard   ; Restore the old clipboard contents
        oldClipboard := ""             ; free memory

        Sleep(MS_100)
    }
    else
        SetCapsLockState !GetKeyState("CapsLock", "T")  ; this is the normal expected behaviour of the key
}
