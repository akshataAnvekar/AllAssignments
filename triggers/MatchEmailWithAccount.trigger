trigger MatchEmailWithAccount on Case (before insert, before update) 
{
	TriggerSetting__c isOff =TriggerSetting__c.getInstance();
    
    if(isOff.MatchEmailWithAccount__c)
    {
	   if(Trigger.isInsert || Trigger.isUpdate)
	   {
		
		  MatchEmailWithAccountHandler.checkorigin(Trigger.new);
		
	   }
	
    }	
}