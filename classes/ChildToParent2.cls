public with sharing class ChildToParent2 {
    
    public static void getChildParentRecord()
    {
    	List<C__c> crecords=new List<C__c>([select AName__r.Name,BName__r.Name from C__c where C__c.Name LIKE 'John%']);
    	
    }
    
}