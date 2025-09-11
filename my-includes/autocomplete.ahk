; ---- HOTSTRINGS ----

:*:;ymd::{
    Send FormatTime(, "yyyy-MM-dd")
}
::;today::{
    Send FormatTime(, "dd/MMM/yyyy")
}
::;dtoday::{
    Send FormatTime(, "dd/MM/yyyy")
}
::;mtoday::{
    Send FormatTime(, "MM/dd/yyyy")
}
::;tomorrow::{
    tomorrow := DateAdd(A_Now, 1, "days")
    Send FormatTime(tomorrow, "dd/MMM/yyyy")
}
::;string::{
    Send "This is a string and a date: " FormatTime(, "dd/MMM/yyyy") "."
}

:*:;mx::México
:*:;j::José
