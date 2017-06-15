public with sharing class StatusByLeadSource 
{
	public static void getStatusByLeadSource()
	{
		
		List<AggregateResult> li=new List<AggregateResult>([SELECT Status,LeadSource,COUNT(Name) FROM Lead GROUP BY Status,LeadSource]);
		System.debug(li);
	
    
    	Map<String,Integer> innerMap=new Map<String,Integer>();
    	Map<String,Map<String,Integer>> outerMap=new Map<String,Map<String,Integer>>();
    
    	for(AggregateResult a1 : li )
    	{
    		String status=(String)a1.get('Status');
    		Integer count1=(Integer)a1.get('expr0');
    		String lead_source=(String)a1.get('LeadSource');
    	
    		innerMap.put(status,count1);
    		outerMap.put(lead_source,innerMap);
    	}
    
    	System.debug(innerMap);
    	System.debug(outermap);
    
	} 
}