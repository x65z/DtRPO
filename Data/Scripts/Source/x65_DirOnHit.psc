Scriptname x65_DirOnHit extends activemagiceffect  

Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
	;debug.notification(abHitBlocked)
	;debug.notification(GetTargetActor().getav("stamina"))
	if abHitBlocked
		GetTargetActor().damageAV("stamina", 3 + 0.5*(aksource.getweight()))
	endif
endEvent