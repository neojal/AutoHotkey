; Define a class for key combinations
class Combo {
    ; Browser Combos
    static ZOOM_IN := "{CtrlDown}={CtrlUp}"
    static ZOOM_OUT := "{CtrlDown}-{CtrlUp}"

    ; browser tab mgmt
    static BROWSER_NEW_TAB := "{CtrlDown}t{CtrlUp}"
    static BROWSER_CLOSE_TAB := "{CtrlDown}w{CtrlUp}"
    static BROWSER_RECOVER_TAB := "{CtrlDown}{ShiftDown}t{ShiftUp}{CtrlUp}"

    ; Browser tab navigation
    static BROWSER_PREVIOUS_TAB := "{CtrlDown}{ShiftDown}{Tab}{ShiftUp}{CtrlUp}"
    static BROWSER_NEXT_TAB := "{CtrlDown}{Tab}{CtrlUp}"
    static BROWSER_MOVE_TAB_LEFT := "{CtrlDown}{ShiftDown}{PgUp}{ShiftUp}{CtrlUp}"
    static BROWSER_MOVE_TAB_RIGHT := "{CtrlDown}{ShiftDown}{PgDn}{ShiftUp}{CtrlUp}"

    ; Windows Combos
    static WIN_SOUND_OUT := "{CtrlDown}#v{CtrlUp}"
    static SHOW_DESKTOP := "#d"
    static CLOSE_WINDOW := "{AltDown}{F4}{AltUp}"

    static WIN_EXPLORER := "#e"
    static SAVE := "{CtrlDown}s{CtrlUp}"
    static PRINT := "{CtrlDown}p{CtrlUp}"
    static SELECT_ALL := "{CtrlDown}a{CtrlUp}" 
    
    ; Windows navigation
    static WIN_SEE_APPS := "{CtrlDown}{AltDown}{Tab}{AltUp}{CtrlUp}"
    static WIN_SNAP_LEFT := "#{Left}"
    static WIN_SNAP_MAXIMIZE := "#{Up}"
    static ALT_TAB := "{AltDown}{Tab}{AltUp}" 

    ; Clipboard
    static COPY := "{CtrlDown}c{CtrlUp}"
    static PASTE := "{CtrlDown}v{CtrlUp}"
    static CUT := "{CtrlDown}x{CtrlUp}"

    ; Windows Capture
    static SCREEN_CAPTURE_TEXT := "{ShiftDown}#t{ShiftUp}"
    static LISTENING := "#h"

    ; Other
    static POWER_TOYS_RUN := "{AltDown}{Space}{AltUp}" 
    static CLICK_DESKTOP := "{Click 500 500}"
}