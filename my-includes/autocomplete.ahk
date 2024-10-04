; ---- HOTSTRINGS ----
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
::;ho::{
    Send "HANDOVER - MEXICO - " FormatTime(, "dd/MMM/yyyy") "- SHIFT E to A"
}

:*:;confirm::could you please confirm if the incident is resolved?
:*:;resolved::The incident has been resolved. Please, reopen if the issue persists.
:*:;wdcase::Please submit a Workday case and ask HR to set the correct job department for the employee, you can share the following error message:{Enter}{Enter}Once employee's job department is fixed in Workday, the new profile will flow into Dayforce the next day.\nKB0027942
::;@fgl::jose.aguilera@fglsports.com
::;@epam::jose_aguilera@epam.com
:*:;mx::México
:*:;j::José
::;pc::Pending Caller
