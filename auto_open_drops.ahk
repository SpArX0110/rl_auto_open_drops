1.45
version := 1.45

#SingleInstance force  

#Persistent
Menu, Tray, Tip , F1: open drops`nF2: identify prints`nF3: trade in items`nF4: stop script`nF5: close script

SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

SetTitleMatchMode, 1
CoordMode ToolTip, screen

URLDownloadToFile, https://raw.githubusercontent.com/SpArX0110/rl_auto_open_drops/main/auto_open_drops.ahk, update.txt
FileReadLine, update, update.txt, 1
FileDelete, update.bat


if (update <= version ) {
  FileDelete, update.txt
  goto Program
} 

else {
	FileDelete, update.txt
Gui +AlwaysOnTop +LastFound +ToolWindow -Caption
 Gui, Add, Text, vtext, NEW UPDATE FOUND!`nDo you want to update?
 Gui, Add, Button, h21 w60 gYes, YES    
 Gui, Add, Button, xp+65 h21 w60 gNo, No
gui, show
return
}




Yes:
{
gui, destroy
file_exists := 0
FileDelete, version.txt
FileDelete, update.txt
FileDelete, auto_open_drops.exe
FileAppend,
(
taskkill auto_open_drops.exe
del auto_open_drops.exe
curl -LJO https://github.com/SpArX0110/rl_auto_open_drops/releases/download/rl_auto_open_drops/auto_open_drops.exe
start auto_open_drops.exe
EXIT /B
), update.bat
run update
ExitApp
return
}

No:
Gui destroy
return

Program:
ToolTip, Waiting for Rocket League to start!!!, 0, 0

WinWait, Rocket League

ToolTip, F1: open drops`nF2: identify prints`nF3: trade in items`nF4: stop script`nF5: close script, 0, 0

Loop{
if not WinExist("Rocket League")
		goto Program
}

F1:: ;open drops
Loop
{
	if not WinExist("Rocket League")
	{
		MsgBox, 4096, Warning!!!, Rocket League is not running!
		Reload
	}
	
	else
	{
		ControlSend, ahk_parent, {Enter}, Rocket League 
		Sleep, 100	
		ControlSend, ahk_parent, {Left}, Rocket League 		
}		
}

F2:: ;identify blueprints
Loop
{
	if not WinExist("Rocket League")
	{
		MsgBox, 4096, Warning!!!, Rocket League is not running!
		Reload
	}
	
	else
	{
		ControlSend, ahk_parent, {Enter}, Rocket League 
		Sleep, 100		
}		
}

F3:: ;trade in items
Loop
{
	if not WinExist("Rocket League")
	{
		MsgBox, 4096, Warning!!!, Rocket League is not running!
		Reload
	}
	
	else
	{
		Loop, 5{
			ControlSend, ahk_parent, {Enter}, Rocket League 
			Sleep, 100	
			ControlSend, ahk_parent, {Down}, Rocket League
			Sleep, 100	
			ControlSend, ahk_parent, {Enter}, Rocket League
			Sleep, 100	
			ControlSend, ahk_parent, {Right}, Rocket League 		
			Sleep, 100	
		}
		Sleep, 500
		ControlSend, ahk_parent, {Enter}, Rocket League 
		Sleep, 100
		MouseClick, left
		Sleep, 100	
		MouseClick, left
		Sleep, 100	
		MouseClick, left
		Sleep, 100	
		MouseClick, left
		Sleep, 100	
		MouseClick, left
		Sleep, 100	
		ControlSend, ahk_parent, {Left}, Rocket League 
		Sleep, 100	
		ControlSend, ahk_parent, {Enter}, Rocket League 
		Sleep, 500	
		ControlSend, ahk_parent, {Enter}, Rocket League 
		
		Loop, 5{
			Sleep, 100	
			ControlSend, ahk_parent, {Up}, Rocket League 
			Sleep, 100	
			ControlSend, ahk_parent, {Left}, Rocket League 
		}
}		
}


F4::Reload
F5::ExitApp
