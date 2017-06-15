trigger TriggerDemo on Opportunity (before insert) {
	
	System.debug(Trigger.new);
	System.debug(Trigger.old);
	System.debug(Trigger.newMap);
	System.debug(Trigger.oldMap);
    
}