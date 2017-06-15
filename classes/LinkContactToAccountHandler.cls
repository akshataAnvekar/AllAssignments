public with sharing class LinkContactToAccountHandler 
{
	public static String getContactEmailDomain(Contact c)
	{
		
		String email;
		String[] split;
		
		if(c.Email!=null)
		{
			email=c.Email;
			split=email.split('@');
			return split[1];
		}
		else
		{
			return null;
		}
			
		
	}
	
	public static Map<String,Id> getAccountEmailDomain(Set<String> contactEmail)
	{
		Map<String,Id> accountMap=new Map<String,Id>();
		List<Account> acc=[select id,Domain__c from Account where Domain__c Like :contactEmail];
		for(Account a : acc)
		{
			accountMap.put(a.Domain__c,a.id);
		}
		return accountMap;
	}
    
}