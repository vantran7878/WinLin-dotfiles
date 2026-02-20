#Requires AutoHotkey v2.0.2
#SingleInstance Force

Komorebic(cmd) {
    RunWait(format("komorebic.exe {}", cmd), , "Hide")
}

#q::Komorebic("close")
#m::Komorebic("minimize")

; Focus windows
#h::Komorebic("focus left")
#j::Komorebic("focus down")
#k::Komorebic("focus up")
#l::Komorebic("focus right")

#+[::Komorebic("cycle-focus previous")
#+]::Komorebic("cycle-focus next")

; Move windows
#+h::Komorebic("move left")
#+j::Komorebic("move down")
#+k::Komorebic("move up")
#+l::Komorebic("move right")

; Stack windows
#Left::Komorebic("stack left")
#Down::Komorebic("stack down")
#Up::Komorebic("stack up")
#Right::Komorebic("stack right")
#;::Komorebic("unstack")
#[::Komorebic("cycle-stack previous")
#]::Komorebic("cycle-stack next")

; Resize
#=::Komorebic("resize-axis horizontal increase")
#-::Komorebic("resize-axis horizontal decrease")
#+=::Komorebic("resize-axis vertical increase")
#+_::Komorebic("resize-axis vertical decrease")

; Manipulate windows
#t::Komorebic("toggle-float")
#^f::Komorebic("toggle-monocle")

; Window manager options
#+r::Komorebic("retile")
#p::Komorebic("toggle-pause")

; Layouts
#x::Komorebic("flip-layout horizontal")
#y::Komorebic("flip-layout vertical")

; Workspaces
#1::Komorebic("focus-workspace 0")
#2::Komorebic("focus-workspace 1")
#3::Komorebic("focus-workspace 2")
#4::Komorebic("focus-workspace 3")
#5::Komorebic("focus-workspace 4")
#6::Komorebic("focus-workspace 5")
#7::Komorebic("focus-workspace 6")
#8::Komorebic("focus-workspace 7")

; Move windows across workspaces
#+1::Komorebic("move-to-workspace 0")
#+2::Komorebic("move-to-workspace 1")
#+3::Komorebic("move-to-workspace 2")
#+4::Komorebic("move-to-workspace 3")
#+5::Komorebic("move-to-workspace 4")
#+6::Komorebic("move-to-workspace 5")
#+7::Komorebic("move-to-workspace 6")
#+8::Komorebic("move-to-workspace 7")

SetCapsLockState("AlwaysOff")
CapsLock::Ctrl

; Only activate the following hotkeys if Microsoft Edge is active
#HotIf WinActive("ahk_exe msedge.exe")

!1::Send("^1")
!2::Send("^2")
!3::Send("^3")
!4::Send("^4")
!5::Send("^5")
!6::Send("^6")
!7::Send("^7")
!8::Send("^8")
!9::Send("^9")

#HotIf  ; End the conditional block

#Enter::
{
    Run('*RunAs pwsh.exe')
}

#d::
{
     Run("C:\Users\ASUS\scoop\apps\flow-launcher\current\Flow.Launcher.exe") ; if it's in PATH (e.g. via Scoop)
}


