trigger ProductionTrigger on Production__c (after insert) {
	if (Trigger.isAfter) {
		ProductionQuantityCalculation.Recalculate(Trigger.new);
	}

}