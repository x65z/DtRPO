Scriptname x65_DirCoreMechanics extends Quest  ;Script to control Stamina Drain for all actors

Event OnInit()
	RegisterForActorAction(0) ;swing weapon
	RegisterForActorAction(6) ;fire arrow
endEvent

Event OnActorAction(int actionType, Actor akActor, Form source, int slot)
	
	if actiontype == 0
		akActor.damageAV("stamina", (3 + 3*(source.getweight()/4)))
	else
		akActor.damageAV("stamina", 5 + source.getweight())
		if akActor.getav("stamina") < 1
			Debug.SendAnimationEvent(akActor, "StaggerStart")
		endif
	endif

endEvent