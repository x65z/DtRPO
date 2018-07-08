Scriptname x65_DirPlayerMechanics extends Quest  

Event OnInit()
	RegisterForControl("Jump")
endEvent

Event OnControlDown(string control)
	Player.damageav("stamina", 0.25 * EquippedWeightGlobal.GetValue())
endEvent

Actor Property Player  Auto  

GlobalVariable Property EquippedWeightGlobal  Auto  
