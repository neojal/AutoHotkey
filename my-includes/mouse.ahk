SetTimer(ShowMouseButtons, 100)

ShowMouseButtons() {
    static lastState := ""
    state := ""

    if GetKeyState("LButton", "P")
        state .= "Left Button "
    if GetKeyState("RButton", "P")
        state .= "Right Button "
    if GetKeyState("MButton", "P")
        state .= "Middle Button "
    if GetKeyState("XButton1", "P")
        state .= "XButton1 "
    if GetKeyState("XButton2", "P")
        state .= "XButton2 "

    if (state != lastState) {
        ToolTip(state = "" ? "No buttons pressed" : state)
        lastState := state
    }
}
