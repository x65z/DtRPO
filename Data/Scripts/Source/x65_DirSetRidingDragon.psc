Scriptname x65_DirSetRidingDragon extends activemagiceffect  

function OnEffectStart(Actor akTarget, Actor akCaster)
	GlobIsRidingDragon.SetValue(1)
	debug.notification("I can fast travel now.")
endFunction

function OnEffectFinish(Actor akTarget, Actor akCaster)
	GlobIsRidingDragon.SetValue(0)
	debug.notification("I can no longer fast travel.")
endFunction

GlobalVariable Property GlobIsRidingDragon  Auto  
