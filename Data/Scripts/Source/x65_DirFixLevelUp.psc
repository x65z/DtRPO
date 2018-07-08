Scriptname x65_DirFixLevelUp extends Quest  ;Stops leveling up from reseting attributes

Float health = 0.0
Float magicka = 0.0
Float stamina = 0.0
Float maxhealth = 0.0
Float maxmagicka = 0.0
Float maxstamina = 0.0

Event OnInit()
	RegisterForMenu("StatsMenu")	
	;debug.notification("Init")
endEvent

Event OnMenuOpen(String MenuName)
	ActorValueInfo valueinfo
	health = Player.GetAV("Health")
	magicka = Player.GetAV("Magicka")
	stamina = Player.GetAV("Stamina")
	valueinfo = ActorValueInfo.GetActorValueInfoByName("Health")
	maxhealth = valueinfo.GetMaximumValue(Player)
	valueinfo = ActorValueInfo.GetActorValueInfoByName("Magicka")
	maxmagicka = valueinfo.GetMaximumValue(Player)
	valueinfo = ActorValueInfo.GetActorValueInfoByName("Stamina")
	maxstamina = valueinfo.GetMaximumValue(Player)
EndEvent

Event OnMenuClose(String MenuName)
	Float maxdiff
	ActorValueInfo valueinfo
	valueinfo = ActorValueInfo.GetActorValueInfoByName("Health")
	maxdiff = valueinfo.GetMaximumValue(Player) - maxhealth
	Player.DamageAV("Health", Player.GetAV("Health") - health - maxdiff)
	health = Player.GetAV("Health")
	maxhealth = valueinfo.GetMaximumValue(Player)
	
	valueinfo = ActorValueInfo.GetActorValueInfoByName("Magicka")
	maxdiff = valueinfo.GetMaximumValue(Player) - maxmagicka
	Player.DamageAV("Magicka", Player.GetAV("Magicka") - magicka - maxdiff)
	magicka = Player.GetAV("Magicka")
	maxmagicka = valueinfo.GetMaximumValue(Player)
	
	valueinfo = ActorValueInfo.GetActorValueInfoByName("Stamina")
	maxdiff = valueinfo.GetMaximumValue(Player) - maxstamina
	Player.DamageAV("Stamina", Player.GetAV("Stamina") - stamina - maxdiff)
	stamina = Player.GetAV("Stamina")
	maxstamina = valueinfo.GetMaximumValue(Player)
EndEvent

Actor Property Player  Auto  
