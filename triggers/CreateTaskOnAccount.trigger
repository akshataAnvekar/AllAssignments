trigger CreateTaskOnAccount on Account (after insert) 
{
	TriggerSetting__c isOff = TriggerSetting__c.getInstance();
    
    if(isOff.CreateTaskOnAccount__c)
    {
 	  CreateTaskOnAccountHandler.createTask(Trigger.new);
    }
 		
}