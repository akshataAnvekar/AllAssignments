public with sharing class InsertBulkLeadRecords {
	
	public static void insertRecords()
	{
		List<Lead> leadlist=new List<Lead>();
		Lead lead;
		for(Integer i=0;i<150;i++)
		{
			lead=new Lead(LastName='Lead'+String.valueOf(i),Company='Eternus',Status='Open - Not Contacted');
			leadlist.add(lead);
		}
		Insert leadlist;
	}
    
}