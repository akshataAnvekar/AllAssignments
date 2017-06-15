public with sharing class LeadSourceRecords {
	
	public static void getLeadRecords()
	{
				
		List<AggregateResult> li=new List<AggregateResult>([SELECT COUNT_DISTINCT(Name),LeadSource FROM LEAD GROUP BY LeadSource HAVING COUNT(LeadSource) > 5]);
		System.debug(li);
		
		
		for(AggregateResult a : li)
		{
			System.debug(a.get('expr0'));
			System.debug(a.get('LeadSource'));
		}
		
		
	}
    
}