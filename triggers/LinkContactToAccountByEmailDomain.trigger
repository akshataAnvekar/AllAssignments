trigger LinkContactToAccountByEmailDomain on Contact (before insert, before update) 
{
	Set<String> contactDomain=new Set<String>();
		String email;
		String[] split;
		TriggerSetting__c isOff =TriggerSetting__c.getInstance();
    
    if(isOff.LinkContactToAccountByEmailDomain__c)
    {
	   if(Trigger.isInsert || Trigger.isUpdate)
	   {
		
		for(Contact c1: Trigger.new)
		{
			ContactDomain.add(LinkContactToAccountHandler.getContactEmailDomain(c1));
		}
		
		for(Contact c2: Trigger.new)	
		{	
			Map<String,Id> accDomains=LinkContactToAccountHandler.getAccountEmailDomain(contactDomain);
			
			if(c2.Email!=null && (c2.AccountId==null || c2.AccountId!=null))
			{
				email=c2.Email;
				split=email.split('@');
				
				if(accDomains.containsKey(split[1]))
				{
					c2.AccountId=accDomains.get(split[1]);
				}
			
			}
			else
			{
				c2.AccountId=null;
			}
		
		}
	}
   }
	
    
}