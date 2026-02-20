#Requires AutoHotkey v2.0

; Disable CapsLock and remap it to Ctrl
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
