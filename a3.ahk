#SingleInstance Force

Sleep 5000

Carpeta := A_Desktop "\hola"
MouseGetPos &MouseX, &MouseY  
ActividadDetectada := false

BlockInput(True)

Loop 900
{
    Sleep 1000
    If FileExist(Carpeta)
    {
        ExitApp
    }

    MouseGetPos &NewMouseX, &NewMouseY
    If (MouseX != NewMouseX || MouseY != NewMouseY)
    {
        ActividadDetectada := true
        Break
    }
    MouseX := NewMouseX
    MouseY := NewMouseY

    If (GetKeyState("CapsLock", "P") || GetKeyState("NumLock", "P") || GetKeyState("ScrollLock", "P") || GetKeyState("Shift", "P") || GetKeyState("Ctrl", "P") || GetKeyState("Alt", "P") || GetKeyState("LWin", "P") || GetKeyState("RWin", "P") || GetKeyState("Escape", "P") || GetKeyState("Enter", "P") || GetKeyState("Space", "P") || GetKeyState("Tab", "P") || GetKeyState("Backspace", "P") || GetKeyState("Delete", "P") || GetKeyState("A", "P") || GetKeyState("B", "P") || GetKeyState("C", "P") || GetKeyState("E", "P") || GetKeyState("V", "P") || GetKeyState("D", "P") || GetKeyState("I", "P") || GetKeyState("O", "P") || GetKeyState("U", "P"))
    {
        ActividadDetectada := true
        Break
    }
}

If (ActividadDetectada)
{

    Run "microsoft.windows.camera:"   
    Sleep 1700
    If WinExist("Cámara")
        WinActivate("Cámara")
    Else If WinExist("Camera")
        WinActivate("Camera")
    Send "{Space}"
    Send "{Space}"
    Send "{Space}" 
    Sleep 100
    Send "{PrintScreen}"
    Send "{PrintScreen}"
    Send "{PrintScreen}"
    Sleep 550
    If WinExist("Cámara")
        WinClose("Cámara")
    Else If WinExist("Camera") 
        WinClose("Camera")  
    Sleep 100
    
}   


Run "rundll32.exe user32.dll,LockWorkStation"
BlockInput(False)
ExitApp

