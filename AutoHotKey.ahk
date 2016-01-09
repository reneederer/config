setCapsLockState, AlwaysOff
setKeyDelay, 100, 100
capslock & j::sendInput,{down}
capslock & k::sendInput,{up}
capslock & h::sendInput,{left}
capslock & l::sendInput,{right}
capslock & m::sendInput,{enter}
capslock up::
    if winActive("ahk_exe gvim.exe")
    {
        sendInput,{escape}
    }
    return

#space::toggleCurrentWindowOnTop()
#g::searchGoogle()
^l::reloadScript()


F12::
	if winActive("ahk_exe chrome.exe")
	{
		sendInput,{alt down}{tab}{alt up}
	}
	else
	{
		if winActive("ahk_exe gvim.exe")
		{
			sendInput,{escape}:wall{enter}
			sleep,50
			sendInput,{alt down}{tab}{alt up}
			sleep,200
			sendInput,{f5}
		}
	}
	return



searchGoogle()
{
    inputBox,search,Google-Suche,Google-Suche,
    if !errorLevel
    {
        run,http://www.google.de?query=%search%
    }
}


toggleCurrentWindowOnTop()
{
    winSet, AlwaysOnTop,Toggle,A
}


getHighlightedText()
{
    oldClipBoard = %clipboard%
    clipboard = 
    sendInput,^c
    clipWait,2,1
    newClipBoard = %clipboard%
    clipboard = %oldClipBoard%
    return newClipBoard
}


reloadScript()
{
    setTitleMatchMode,2
    if winActive("AutoHotKey.ahk")
    {
        sendInput,{escape}:w{enter}
        msgbox,,,Reloaded!, 1
        reload
    }
	return
}





