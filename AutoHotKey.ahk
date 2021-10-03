#SingleInstance force
#NoEnv
SetTitleMatchMode 2
setCapsLockState, AlwaysOff
::Rene::René
SC056 & m::sendInput,1
SC056 & ,::sendInput,2
SC056 & .::sendInput,3
SC056 & j::sendInput,4
SC056 & k::sendInput,5
SC056 & l::sendInput,6
SC056 & u::sendInput,7
SC056 & i::sendInput,8
SC056 & o::sendInput,9
SC056 & space::sendInput,0


capslock & j::
    if getKeyState("shift", "p")
    {
        sendInput,{shift down}{down}{shift down}
    }
    else
    {
        sendInput,{down}
    }
    return
capslock & k::
    if getKeyState("shift", "p")
    {
        sendInput,{shift down}{up}{shift up}
    }
    else
    {
        sendInput,{up}
    }
    return
capslock & h::
    if getKeyState("shift", "p")
    {
        sendInput,{shift down}{left}{shift left}
    }
    else
    {
        sendInput,{left}
    }
    return
capslock & l::
    if getKeyState("shift", "p") {
        sendInput,{shift down}{right}{shift right}
    }
    else
    {
        sendInput,{right}
    }
    return
capslock & m::sendInput,{enter}
capslock & o::sendInput,{end}{enter}
capslock & p::sendInput,{backspace}
capslock & i::sendInput,{end}
capslock & `;::sendInput,{home}
capslock & '::sendInput,{home}{shift down}{end}{shift up}^x{backspace}
:*:cw::{control down}{shift down}{right}{shift up}{control up}^x

capslock up::
    sendInput,{escape}
    return


#space::toggleCurrentWindowOnTop()

!l::reloadScript()

^!;::
    run,C:\Program Files\Everything\Everything.exe


toggleCurrentWindowOnTop()
{
    winSet, AlwaysOnTop,Toggle,A
}

reloadScript()
{
    setTitleMatchMode,2
    if winActive("AutoHotKey.ahk")
    {
        sendInput,^s
        sleep, 20
        msgbox,,,Reloaded!, 1
        reload
    }
    return
}