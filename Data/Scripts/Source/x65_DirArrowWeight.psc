Scriptname x65_DirArrowWeight extends activemagiceffect   ;Dirge Script to simulate arrow weight, since ammunition records don't have a weight value

;Event OnInit()
;	debug.notification("Debug: Arrow weight started.")
;	;AddInventoryEventFilter("AMMO") ; Not implemented in SSE yet?
;EndEvent

Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
	if akBaseItem as Ammo
		if akBaseItem.IsPlayable()
			Player.AddItem(DummyArrowMisc, aiItemCount, true)
		endif
	EndIf
EndEvent

Event OnItemRemoved(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer)		
	if akBaseItem as Ammo
		if akBaseItem.IsPlayable()
			Player.RemoveItem(DummyArrowMisc, aiItemCount, true)
		endif
	EndIf
EndEvent

MiscObject Property DummyArrowMisc  Auto  

Actor Property Player  Auto  
