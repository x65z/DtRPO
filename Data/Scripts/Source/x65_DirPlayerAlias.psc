Scriptname x65_DirPlayerAlias extends ObjectReference  ;Script to manage player alias specific tasks, in particular armor equipped

Event OnObjectEquipped(Form akBaseObject, ObjectReference akReference)
 	if akBaseObject as Armor
 		;debug.notification("Player just equipped armor")
		EquippedWeightGlobal.SetValue(akBaseObject.getweight() + EquippedWeightGlobal.GetValue())
 	endIf
endEvent

Event OnObjectUnequipped(Form akBaseObject, ObjectReference akReference)
 	if akBaseObject as Armor
 		;debug.notification("Player just unequipped armor")
		EquippedWeightGlobal.SetValue(EquippedWeightGlobal.GetValue() - akBaseObject.getweight())
 	endIf
endEvent

GlobalVariable Property EquippedWeightGlobal  Auto  
