public with sharing class CurrentFiscalYear {
	
	public static void CalculateSum()
	{
		Integer currentYear=System.today().year();
		List<AggregateResult> closedOppSum=new List<AggregateResult>([Select SUM(Amount) from Opportunity WHERE FiscalYear=:currentYear AND StageName='Closed Won']);
		
		System.debug(closedOppSum);
		
		Map<Integer,Object> map1=new Map<Integer,Object>();
		
		
			map1.put(currentYear,closedOppSum[0].get('expr0'));
			System.debug(map1);
		
		
	}
    
}