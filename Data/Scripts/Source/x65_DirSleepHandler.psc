Scriptname x65_DirSleepHandler extends Quest  ;Dirge script to set health healed by sleeping, otherwise player heals t0o much no matter how low health regen is under race

Float health = 0.0
Float maxhealth = 0.0
Float healthtoheal = 0.0

Event OnInit()
	RegisterForSleep() ; Register for Player sleep event
endEvent

Event OnSleepStart(float afSleepStartTime, float afDesiredSleepEndTime)
	ActorValueInfo valueinfo
	health = Player.GetAV("Health")
	valueinfo = ActorValueInfo.GetActorValueInfoByName("Health")
	maxhealth = valueinfo.GetMaximumValue(Player)
	;debug.notification(afDesiredSleepEndTime - afSleepStartTime)
	healthtoheal = ((afDesiredSleepEndTime - afSleepStartTime) * 180) ;1 hour slept = approx 7.5 points of health, 8 hours = approx 60
endEvent

Event OnSleepStop(bool abInterrupted)
	Float maxdiff
	ActorValueInfo valueinfo
	if abInterrupted
	    ;Debug.notification("Player was woken by something!")
		;player is fully healed bc vanilla mechanics
	else
	    ;Debug.notification("Player woke up naturally")
		valueinfo = ActorValueInfo.GetActorValueInfoByName("Health")
		maxdiff = valueinfo.GetMaximumValue(Player) - maxhealth
		Player.DamageAV("Health", Player.GetAV("Health") - health - maxdiff)
		player.RestoreActorValue("Health", healthtoheal)
		;debug.notification(healthtoheal)
	endIf
endEvent
Actor Property Player  Auto  
