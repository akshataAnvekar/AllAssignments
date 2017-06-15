public with sharing class ParentToChild2 {
	
	public static void InsertCaseRecord()
		{
		Case case1=new Case(Origin='Web',SuppliedEmail='abc@gmail.com',Status='Working');
		Insert case1; 
		}
	
	
	
	
	public void getAccountOpportunity()
	{
		List<Account> accountRecord=new List<Account>([select id,(select id,Name,StageName from Opportunities) from Account where id IN(SELECT Accountid from Opportunity where StageName='Closed Won')]);
		
		for(Account a : accountRecord)
		{
			System.debug(a);
			
			for(Opportunity o:a.Opportunities)
			{
				System.debug(o.id);
				System.debug(o.Name);
				System.debug(o.StageName);
			}
			
		}
		
		
	}
	
    
}