#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance Force
#UseHook


; HUD Hiding script

; Default state of HUD:
global HudActive=true
SetIcon()
;#IfWinExist ahk_exe witcher3.exe
Hotkey, F4, ToggleHUD
return

SetIcon() 
{
    IfExist, tw3hidehud.exe
        Menu, TRAY, Icon, tw3hidehud.exe, % HudActive ? 2 : 1
    else 
    {
        ico := HudActive ? "hud-active.ico" : "hud-inactive.ico"
        IfExist, %ico%
            Menu, TRAY, Icon, %ico%
    }
}

ToggleHUD:
{
    HudActive:=!HudActive
    SetIcon()

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
    return
}

Reload:
{
    MsgBox Reloading Script
    Reload
}