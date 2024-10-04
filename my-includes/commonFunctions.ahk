; Checks the state of the NumLock key.
isNumLock := () => GetKeyState("NumLock", "T")

; for char key. Returns 1 true if pressed char was lowercase, otherwise false 0
isKeyLowerCase := () => ( !GetKeyState("Shift") && !GetKeyState("CapsLock", "T") ) ? 1 : 0

testTooltip := () => myToolTip(TEST_TOOLTIP_FUNCTION, MS_3000)    

; SoundBeep Frequency, Duration
beep := () => beepLow()
beepLow := () => SoundBeep(300, 50)
beepHigh := () => SoundBeep(1000, 500)
beepVeryHigh := () => SoundBeep(1500, 100)



; Creates a tool tip with the passed text that lasts msTime milliseconds
myToolTip(text, msTime) {
    ToolTip text
    SetTimer () => ToolTip(), -1*msTime
}

/*
 * Receives a function or a key combination, 
*/
sendComboOrCallFunction(action) {
    if IsObject(action) {
        action.Call()
    } else if action != "" {
        Send(action)
    }
}

/*
 * @param key The key to check (e.g., "x", F1...F12).
 * @param duration The duration in milliseconds to check if the key was pressed.
 * @param beep default is true, pass false to silent.
 * @return releaseTime if the key was pressed for the specified duration or more, 0 otherwise.
 */
 isKeyPressedForDuration(key, duration, sound := BEEP_FALSE) {
    releaseTime := getReleaseTimeMs(key, sound)
    if ( releaseTime >= duration ) 
        return releaseTime
    else 
        return 0
}

/*
 * @param key The key to check (e.g., "x", F1...F12).
 * @return time in ms that the key was pressed
 */
 getReleaseTimeMs(key, sound := BEEP_FALSE) {
    startTime := A_TickCount 
    KeyWait key
    releaseTime := A_TickCount - startTime
    if sound
        beep()
    return releaseTime
}

; Function to URL-encode a string
UrlEncode(str) {
    static chars := "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-_.~"
    encoded := ""
    Loop Parse, str
    {
        char := A_LoopField
        if InStr(chars, char)
            encoded .= char
        else
            encoded .= "%" Format("{:02X}", Ord(char))
    }
    return encoded
}
