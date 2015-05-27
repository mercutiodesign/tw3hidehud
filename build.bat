@echo off
taskkill /im tw3hidehud.exe
"C:\Program Files\AutoHotkey\Compiler\Ahk2Exe.exe" /in hidehud.ahk /out tw3hidehud.exe /icon hud-inactive.ico /mpress 0
"C:\Program Files (x86)\Resource Hacker\ResHacker.exe" -add tw3hidehud.exe, tw3hidehud.exe, hud-active.ico, ICONGROUP, 1,
"C:\Program Files\AutoHotkey\Compiler\mpress.exe" tw3hidehud.exe