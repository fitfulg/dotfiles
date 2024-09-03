; Define the hotkey to toggle visibility (Ctrl+Alt+S)
^!s::
; Attempt to find the Windows Terminal window
SetTitleMatchMode, 2
IfWinExist, ahk_class CASCADIA_HOSTING_WINDOW_CLASS
{
    WinGet, MinMaxState, MinMax, ahk_class CASCADIA_HOSTING_WINDOW_CLASS
    if (MinMaxState = -1) ; Window is hidden
    {
        WinRestore, ahk_class CASCADIA_HOSTING_WINDOW_CLASS
        WinActivate, ahk_class CASCADIA_HOSTING_WINDOW_CLASS
    }
    else if (MinMaxState = 1) ; Window is minimized
    {
        WinRestore, ahk_class CASCADIA_HOSTING_WINDOW_CLASS
        WinActivate, ahk_class CASCADIA_HOSTING_WINDOW_CLASS
    }
    else
    {
        WinMinimize, ahk_class CASCADIA_HOSTING_WINDOW_CLASS
    }
}
else
{
    ; If the window does not exist, show a message
    MsgBox, Windows Terminal is not running.
}
return