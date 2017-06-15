public with sharing class MatchEmailWithAccountHandler {
	
	public static void checkorigin(List<Case> caseList)
	{
		List<Account> acc = [select id,Email__c from Account]; 
		Map<String,id> accountList=new Map<String,id>();
		
		for(Account a : acc)
		{
			accountList.put(a.Email__c,a.id);
		}
		
		for(Case newcase : caseList)
		{
		String email;
		if(newcase.Origin=='Web' || newcase.Origin=='Email' || newcase.Origin=='Chat')
			{
				email=newcase.SuppliedEmail;
				System.debug(newcase.id);
				if(accountList.containsKey(email))
				{
					Id key=accountList.get(email);
					newcase.AccountId=key;
				}
			}
	}
	}
    
}