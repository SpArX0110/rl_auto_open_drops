SetTitleMatchMode, 1

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

