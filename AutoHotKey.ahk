#SingleInstance force
#NoEnv
SetTitleMatchMode 2
SetWorkingDir %A_ScriptDir%
sendMode Input

global clipboardStoreCount = 10
global storedClipboards := Object()
global quickClipboard = 


setCapsLockState, AlwaysOff
setKeyDelay, 100, 100

:*?:ue::ü
:*?:oe::ö
:*?:ae::ä
::Rene::René
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
#g:: searchGoogle() ; TODO opens some other game window by default

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


$~MButton up::
	highlightedText := getHighlightedText()
	if highlightedText != 
	{
		quickClipboard = %highlightedText%
	}
	mouseGetPos,x,y
	caretX = %a_caretX%
	caretY = %a_caretY%
	click
	sendAsClipboard(quickClipboard)
	mouseClick,,caretX,caretY
	mouseMove,x,y
	return

$~LButton up::
	highlightedText := getHighlightedText()
	if highlightedText != 
	{
		quickClipboard = %highlightedText%
	}
	return



searchGoogle()
{
	text := getHighlightedText()
	if text = 
	{
		text = %clipboard%
	}
    inputBox,search,Google-Suche,Google-Suche,,,,,,,,%text%
    if !errorLevel
    {
        run % "http://www.google.de?query=" . uriEncode(search)
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
    clipWait,1,1
    newClipBoard = %clipboard%
    clipboard = %oldClipBoard%
    if errorLevel
    {
    	return ""
    }
	return newClipBoard
}


sendAsClipboard(text)
{
	newClipboard = %clipboardAll%
	clipboard = %text%
	sendInput,^v
	sleep,10
	clipboard = %newClipBoard%
	return
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




uriDecode(str) {
	Loop
		If RegExMatch(str, "i)(?<=%)[\da-f]{1,2}", hex)
			StringReplace, str, str, `%%hex%, % Chr("0x" . hex), All
		Else Break
	Return, str
}


uriEncode(str) {
   f = %A_FormatInteger%
   SetFormat, Integer, Hex
   If RegExMatch(str, "^\w+:/{0,2}", pr)
      StringTrimLeft, str, str, StrLen(pr)
   StringReplace, str, str, `%, `%25, All
   Loop
      If RegExMatch(str, "i)[^\w\.~%/:]", char)
         StringReplace, str, str, %char%, % "%" . SubStr(Asc(char),3), All
      Else Break
   SetFormat, Integer, %f%
   Return, pr . str
}







