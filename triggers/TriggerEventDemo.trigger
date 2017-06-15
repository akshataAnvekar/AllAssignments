trigger TriggerEventDemo on Project_Detail__c (after delete, after insert, after update, before delete, before insert, before update) 
{
	if(Trigger.isInsert)
	{
	if (Trigger.isBefore)
	{
		System.debug(Trigger.new);
		System.debug(Trigger.old);
		System.debug(Trigger.newMap);
		System.debug(Trigger.oldMap);	
	}
	else if(Trigger.isAfter)
	{
		System.debug(Trigger.new);
		System.debug(Trigger.old);
		System.debug(Trigger.newMap);
		System.debug(Trigger.oldMap);
	}
	}
	
	if(Trigger.isUpdate)
	{
	if (Trigger.isBefore)
	{
		System.debug(Trigger.new);
		System.debug(Trigger.old);
		System.debug(Trigger.newMap);
		System.debug(Trigger.oldMap);	
	}
	else if(Trigger.isAfter)
	{
		System.debug(Trigger.new);
		System.debug(Trigger.old);
		System.debug(Trigger.newMap);
		System.debug(Trigger.oldMap);
	}
	}
	
	if(Trigger.isDelete)
	{
	if (Trigger.isBefore)
	{
		System.debug(Trigger.new);
		System.debug(Trigger.old);
		System.debug(Trigger.newMap);
		System.debug(Trigger.oldMap);	
	}
	else if(Trigger.isAfter)
	{
		System.debug(Trigger.new);
		System.debug(Trigger.old);
		System.debug(Trigger.newMap);
		System.debug(Trigger.oldMap);
	}
	}
    
}