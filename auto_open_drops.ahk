1.2
version := 1.2

#SingleInstance force  

SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

SetTitleMatchMode, 1

URLDownloadToFile, https://raw.githubusercontent.com/SpArX0110/rl_auto_open_drops/main/auto_open_drops.ahk, update.txt
FileReadLine, update, update.txt, 1
FileDelete, update.bat

if (update <= version ) {
  FileDelete, update.txt
  return
ExitApp
  return
} else {
	FileDelete, update.txt
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

F1::
Loop
{
	if not WinExist("Rocket League")
	{
		MsgBox, Rocket League is not running!
		Reload
	}
	
	else
	{
		ControlSend, ahk_parent, {Enter}, Rocket League 
		Sleep, 100	
		ControlSend, ahk_parent, {Left}, Rocket League 		
}		
}

F2::Reload
F3::ExitApp
