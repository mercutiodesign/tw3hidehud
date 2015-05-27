#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance Force
#UseHook


; HUD Hiding script

; Default state of HUD:
HudActive=true

; Hotkey, F3, Reload ; Bind Reload to a hotkey for debugging
#IfWinExist ahk_exe witcher3.exe
Hotkey, F4, ToggleHUD
return

ToggleHUD:
{
    HudActive:=!HudActive

    SetKeyDelay, 200
    IfWinExist, ahk_exe witcher3.exe
    {
        IfWinActive
        {
            Send {Esc}
            Sleep 500 ; give the pause menu time to load
        }
        else
            WinActivate
    }
    else
        return

    ; enter the hud menu
    Send {Down 3}{Enter}{Down 5}{Enter 2}

    SetKeyDelay, 0
    if HudActive
    {
        Loop, 3
            Send {Down}{Right}
        Send {Down} ; don't enable witcher senses on minimap
        Loop, 8
            Send {Down}{Right}
        Send {Down} ; don't enable control hints
        Loop, 9
            Send {Down}{Right}
    }
    else
    {
        Loop, 22
            Send {Down}{Left}
    }

    ; resume the game
    Send {Esc 4}

    BlockInput, Off
    return
}

Reload:
{
    MsgBox Reloading Script
    Reload
}