public class AccountOpportunityList 
{
	public static void GetAccountlist()
	{
		List<Account> accountopportunity=new List<Account>([select id,(select id from Opportunities) from Account where id!=null]);
		Map<id,List<Account>> accountopportunityID=new Map<id,List<Account>>();
		
		
		for(Account s : accountopportunity)
		{
			
			accountopportunityID.put(s.id,accountopportunity);
		}
		
	}
    
}