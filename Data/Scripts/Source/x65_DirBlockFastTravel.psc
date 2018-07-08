Scriptname x65_DirBlockFastTravel extends Quest  

Event OnInit()
	;Debug.Notification("Debug: Block Fast Travel init")
	RegisterForMenu("MapMenu")
EndEvent

Event OnMenuOpen(String MenuName)
	
	if GlobIsRidingDragon.GetValue() == 1
		Game.EnableFastTravel()
		;debug.notification("D1")
	else
		Game.EnableFastTravel(false)
		;debug.notification("D0")		
	endif
EndEvent

Event OnMenuClose(String MenuName)
	;Debug.Notification("Debug:Fast travel reenabled")
	Game.EnableFastTravel()	
EndEvent

GlobalVariable Property GlobIsRidingDragon  Auto  