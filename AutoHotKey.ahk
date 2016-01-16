#SingleInstance force
#NoEnv
SetTitleMatchMode 2
SetWorkingDir %A_ScriptDir%

global clipboardStoreCount = 10
global storedClipboards := Object()


setCapsLockState, AlwaysOff
setKeyDelay, 100, 100
capslock & j::sendInput,{down}
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

*^c:: copyToClipboard(getHighlightedText())



*^v::
	sleep, 100
	showClipboard()
	return



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
    clipWait,0,1
    newClipBoard = %clipboard%
    clipboard = %oldClipBoard%
    if errorLevel
    {
    	return ""
    }
	return newClipBoard
}


reloadScript()
{
    setTitleMatchMode,2
    if winActive("AutoHotKey.ahk")
    {
        sendInput,{escape}:w{enter}
        sleep, 50
        msgbox,,,Reloaded!, 1
        reload
    }
	return
}


#IfWinActive,Clipboard-Auswahl
^c::
	sendInput,{up}
	return
^v::
	sendInput,{down}
	return
^k::
	sendInput,{up}
	return
^j::
	sendInput,{down}
	return
ctrl up::
	sendInput,{enter}
	return
#IfWinActive

showClipboard()
{
	loop, 25
	{
		sleep, 10
		if(!getKeyState("ctrl","P"))
		{
			copyToClipboard(storedClipboards[1])
			sendInput,^v
			return
		}
	}
		Gui, Add, ListView, w200 H200 gLV AltSubmit,   .     
		Gui, Add, Button, Hidden Default, Default

		loop,%clipboardStoreCount%
		{  
			LV_Add("", storedClipboards[a_index])
		}
		LV_Modify(0, "-Select")  ; to deselect all selected rows
		LV_Modify(1,"Focus Select")
		Gui, Show,,Clipboard-Auswahl
		return

	LV:
		if A_GuiEvent = DoubleClick
		{
			LV_GetText(col1, A_EventInfo, 1)
			copyToClipboard(col1)
			Gui, destroy
			sendInput,^v
		}
		return

	GuiEscape:
	GuiClose:
		Gui, destroy
	return

	ButtonDefault:
		GuiControlGet, FocusedControl, Focus
		if FocusedControl <> SysListView321
		{
			return
		}

		LV_GetText(col1, LV_GetNext(0, "Focused"), 1)
		copyToClipboard(col1)
		Gui, destroy
		sendInput,^v
	return
}




copyToClipboard(text)
{
	if text = 
	{
		return
	}
	loop,%clipboardStoreCount%
	{
		if(storedClipboards[clipboardStoreCount-a_index] = text)
		{
			storedClipboards.removeAt(clipboardStoreCount-a_index)
		}
		storedClipboards[clipboardStoreCount-a_index+1] := storedClipboards[clipboardStoreCount-a_index]
	}
	storedClipboards[1] := text
	clipboard := text
}













