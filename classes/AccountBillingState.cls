public with sharing class AccountBillingState
{
	public static void checkBillingState()
	{
		List<Account> account=new List<Account>([select id,Name,AccountNumber,Type,BillingState from Account where BillingState not in ('Maharashtra','Kerala') order by BillingState desc NULLS LAST limit 10000]);
			
			for(Account a:account)
				{
					System.debug(a.id+a.Name+a.AccountNumber+a.Type+a.BillingState);
				}
	}
    
}