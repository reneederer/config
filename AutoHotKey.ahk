#SingleInstance force
#NoEnv
SetTitleMatchMode 2
setCapsLockState, AlwaysOff
SetWorkingDir %A_ScriptDir%
setMouseDelay,-1
sendMode Input
; Hotkey mbutton, paste_selection
; hotkey mbutton, on

; global clipboardStoreCount = 10
; global storedClipboards := Object()
; global quickClipboard = 

:*:sgf::Sehr geehrte Frau{space}
:*:sgh::Sehr geehrter Herr{space}

!n::
    sendInput,^s
    sleep,1000
    sendInput,c:\UniServerZ\www\site.html
    sleep,1000
    sendInput,{enter}
    sleep,1000
    sendInput,{left}
    sleep,1000
    sendInput,{enter}
    sleep,1000
    runWait,c:\users\Rene\dev\haskell\lazyapplicant\main.exe
    sleep,1000
    run,c:\users\Rene\dev\latex\application\main.pdf
    return

!t::
    run,C:\Users\rene\.babun\cygwin\bin\mintty.exe
    return

!r::
    inputbox,command
    runCommand(command)
    return

runCommand(command)
{
    if(command == "elm")
    {
        startElm()
    }
}

startElm()
{
	inputbox,folder,Wo liegt der Server?,Wo liegt der Server?,,,,,,,,C:\UniserverZ\www\elm
	inputbox,file,Welche Datei soll editiert werden?,Welche Datei soll editiert werden?,,,,,,,,Main.elm
    sleep,100
	sendInput,#r
	sleep,100
	sendInput,cmd /K "cd %folder%"
    sleep,100
    sendInput,{enter}
    sleep,100
    sendInput,elm.exe reactor{enter}
    sleep,100
	sendInput,{LWin down}r{LWin up}
	sleep,100
	sendInput,gvim %folder%\%file%
    sleep,100
    sendInput,{enter}
    sleep,100
    run,http://localhost:8000/%file%
    return
}

#IfWinActive ahk_class ConsoleWindowClass
!Up:: 
Send {WheelUp}
Return

!Down:: 
Send {WheelDown} 
Return
#IfWinActive

:*:mfg::Mit freundlichen Gr��en{enter}{enter}Ren� Ederer{enter}Steinmetzstr. 2{enter}90431 N�rnberg
::Rene::Ren�
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

; `; & w::sendInput,{esc}daw


capslock up::
    if winActive("ahk_exe gvim.exe")
    {
        sendInput,{escape}
        return
    }
    else
    {
        sendInput,{escape}
        return
    }


#space::toggleCurrentWindowOnTop()
#o::searchGoogle() ; TODO opens some other game window by default

^l::reloadScript()

; *^c::
;     copyToClipboard(getHighlightedText())
;     return

; *^v::
;	showClipboard()
; 	return


$F5::
	if winActive("ahk_exe chrome.exe")
	{
		sendInput,{alt down}{tab}{alt up}
	}
	else
	{
		if winActive("ahk_exe gvim.exe")
		{
			sendInput,{escape}
            sleep,250
            sendInput,:wall{enter}
			sleep,100
			sendInput,{alt down}{tab}{alt up}
			sleep,100
			sendInput,{f5}
		}
		else
{
	sendInput,{f5}
}
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
        run % "http://www.google.de/#q=" . uriEncode(search)
    }
}


toggleCurrentWindowOnTop()
{
    winSet, AlwaysOnTop,Toggle,A
}



getHighlightedText()
{
    oldClipBoard := clipboardAll
    clipboard = 
    sendInput,^c
    clipWait,0.1
    sleep,10
    newClipBoard = %clipboard%
    sleep,10
    clipboard = 
    if(oldClipboard != "")
    {
        clipboard := oldClipBoard
        clipWait,1,1
        sleep,20
    }

	return newClipBoard
}


sendAsClipboard(text)
{
    if(text = )
    {
        return
    }
	oldClipboard := clipboardAll
    clipboard = 
	clipboard := text
	clipWait
    sleep,40
	sendInput,^v
	sleep,40
    clipboard = 
	clipboard := oldClipBoard
    if(oldClipboard != "")
    {
        clipWait
    }
    sleep,20
	return
}


reloadScript()
{
    setTitleMatchMode,2
    if winActive("AutoHotKey.ahk")
    {
        sendInput,{escape}:w{enter}
        sleep, 20
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
	return
	;keyWait,v,T0.3
	keyWait,Control,T0.5
    if !errorLevel
    {
        sendAsClipboard(storedClipboards[1])
        return
    }

    if !getKeyState("control", "p")
    {
        if(clipboard != )
        {
            sendAsClipboard(storedClipboards[1])
        }
        return
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
			Gui, destroy
			sendAsClipboard(col1)
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
		Gui, destroy
        sendAsClipboard(col1)
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

    
#IfWinNotActive ahk_class ConsoleWindowClass
~lButton up::
    return
    winWait,A,,1
    text := getHighlightedText()
    if text = 
    {
        keyWait,lbutton,T0.5
        if !errorLevel
        {
            text := getHighlightedText()
        }
    }
    if text != 
    {
        quickClipboard := text
    }
return
#IfWinNotActive

  
paste_selection:
 ;  sendinput {lbutton}
 ;  sendAsClipboard(quickClipboard)
return




