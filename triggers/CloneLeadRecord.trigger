trigger CloneLeadRecord on Lead (after insert) 
{
	TriggerSetting__c isOff = TriggerSetting__c.getInstance();
	
	if(isOff.CloneLeadRecord__c)
	{
        if(checkRecursive.runOnce())
        {
    	   List<Lead> leadlist=new List<Lead>();
    	   leadlist=Trigger.new.deepClone(false);
    	   System.debug(leadlist);
    	   Insert leadlist;
        }
	}

    
}