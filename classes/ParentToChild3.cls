public with sharing class ParentToChild3 
{
	public static void getChildRecords()
	{
		//List<A__c> a=new List<A__c>([select Name,(select Name from C__r) from A__c where id IN(select AName__c from C__r where C__r.Name LIKE '%John%')]);
		
		//For(A__c Acc: a)
		//{
			//System.debug(acc);
		//}
	}
    
}