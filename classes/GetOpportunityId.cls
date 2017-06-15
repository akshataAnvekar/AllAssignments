public class GetOpportunityId {
	
	public void getClosedOpportunities()
	{
		List<Opportunity> opportunitylist= new List<Opportunity>([select id from Opportunity where StageName='Closed Won' AND Account.Name!=null]);
	/*	System.debug(opportunitylist);
		
		for(Opportunity list1: opportunitylist)
		{
			System.debug(list1.id);
		}
		
		Set<Opportunity> opportunityset= new Set<Opportunity>(opportunitylist);
		for(Opportunity set1: opportunityset)
		{
			System.debug(set1.id);
		}*/
		
		Map<Id,Opportunity> opportunitymap= new Map<Id,Opportunity>([select id,AccountId from Opportunity where StageName='Closed Won' AND Account.Name!=null]);
		for(Opportunity map1: opportunitymap.values())
		{
			System.debug(map1);
		}
		
		
	}
    
}