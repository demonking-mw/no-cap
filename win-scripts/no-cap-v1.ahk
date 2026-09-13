; ============================================================
; CAPS LOCK CONTROL LAYER
; AutoHotkey v2
; ============================================================

#Requires AutoHotkey v2.0
#SingleInstance Force

SendMode("Input")
SetWorkingDir(A_ScriptDir)
TraySetIcon("main.cpl", 8)


; ============================================================
; CAPS LOCK
;
; Caps Lock NEVER activates actual Caps Lock.
;
; Caps + Backspace -> Ctrl + Backspace
;
; Caps + J -> Left Arrow
; Caps + I -> Up Arrow
; Caps + K -> Down Arrow
; Caps + L -> Right Arrow
;
; Caps + V + J -> Ctrl + Left Arrow
; Caps + V + I -> Ctrl + Up Arrow
; Caps + V + K -> Ctrl + Down Arrow
; Caps + V + L -> Ctrl + Right Arrow
;
; Caps + S -> Mouse Left
; Caps + E -> Mouse Up
; Caps + D -> Mouse Down
; Caps + F -> Mouse Right
;
; Caps + Space -> Left Mouse Click
; ============================================================

SetCapsLockState("AlwaysOff")

; Completely suppress the real Caps Lock key
*CapsLock::return


; ============================================================
; CAPS + V
;
; Physical V is used as a modifier while Caps is held.
; ============================================================

CapsLock & v::return
CapsLock & v up::return


; ============================================================
; ARROW KEYS
; ============================================================

CapsLock & j::
{
    if GetKeyState("v", "P")
        Send("^{Left}")
    else
        Send("{Left}")
}

CapsLock & i::
{
    if GetKeyState("v", "P")
        Send("^{Up}")
    else
        Send("{Up}")
}

CapsLock & k::
{
    if GetKeyState("v", "P")
        Send("^{Down}")
    else
        Send("{Down}")
}

CapsLock & l::
{
    if GetKeyState("v", "P")
        Send("^{Right}")
    else
        Send("{Right}")
}


; ============================================================
; BACKSPACE
; ============================================================

CapsLock & Backspace::
{
    Send("^{Backspace}")
}


; ============================================================
; MOUSE CLICK
;
; Caps + Space -> Left Mouse Button
; ============================================================

CapsLock & Space::
{
    Click()
}


; ============================================================
; MOUSE MOVEMENT
; ============================================================

CapsLock & s::
{
    SetTimer(MouseLeft, 10)
}

CapsLock & s up::
{
    SetTimer(MouseLeft, 0)
}


CapsLock & e::
{
    SetTimer(MouseUp, 10)
}

CapsLock & e up::
{
    SetTimer(MouseUp, 0)
}


CapsLock & d::
{
    SetTimer(MouseDown, 10)
}

CapsLock & d up::
{
    SetTimer(MouseDown, 0)
}


CapsLock & f::
{
    SetTimer(MouseRight, 10)
}

CapsLock & f up::
{
    SetTimer(MouseRight, 0)
}


; ============================================================
; MOUSE MOVEMENT FUNCTIONS
;
; Change "5" to adjust mouse speed.
; ============================================================

MouseLeft()
{
    MouseMove(-5, 0, 0, "R")
}

MouseUp()
{
    MouseMove(0, -5, 0, "R")
}

MouseDown()
{
    MouseMove(0, 5, 0, "R")
}

MouseRight()
{
    MouseMove(5, 0, 0, "R")
}
