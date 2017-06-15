public with sharing class OpportunityRacords {
	
	public void insertOpportunityRecords()
	{
		List<Opportunity> oplist=new List<Opportunity>();
		Opportunity opp;
		for(Integer i=0;i<150;i++)
		{
			opp=new Opportunity(Name='Opportunity'+String.valueOf(i),Amount=20000,StageName='Qualification',CloseDate=Date.valueOf('2017-04-29'));
			oplist.add(opp);
		}
		Insert oplist;
		for(Opportunity o: oplist)
		System.debug(o);
	}
	
	
	
	
	public static void GetOpportunityRecords()
	{
		List<Opportunity> opportunity=new List<Opportunity>([select id,Name,CreatedDate,Amount from Opportunity where Amount > 10000 order by CreatedDate limit 100 offset 50 ALL ROWS]);
		
		
		
		for(Opportunity s : opportunity)
		{
			
			System.debug(s.id+s.Name+s.CreatedDate+s.Amount);
		}
		
	}
    
}