@isTest
private class TestClassCloneLeadRecords {

    static testMethod void testToCloneSingleRecord() {
    	
    	//Inserted single Lead record
    	
    	List<Lead> leadlist=TestDataFactory.createLeads(1);
    	list<TriggerSetting__c> Language_List = new list <TriggerSetting__c>();
        TriggerSetting__c record1 = new TriggerSetting__c();
        record1.CloneLeadRecord__c = true;
        Language_List.add(record1);
    	
    	Test.startTest();
    	insert Language_List;
    	Insert leadlist;
    	Test.stopTest();
    	TriggerSetting__c isOff = TriggerSetting__c.getInstance();
        isOff.CloneLeadRecord__c=true;
    	
    	List<Lead> clonerecordlist=new List<Lead>([select id from Lead where LastName='LeadTest1' and Company='Eternus' and Status='Open-Contacted']);
        Integer size=clonerecordlist.size();
        System.assertEquals(2,size);
        
    }
    
    static testMethod void testForBulkInsertion()
    {
    	//Inserted 100 Lead record
  		List<Lead> leadlist=TestDataFactory.createLeads(100);
  		list<TriggerSetting__c> Language_List = new list <TriggerSetting__c>();
            TriggerSetting__c record1 = new TriggerSetting__c();
            record1.CloneLeadRecord__c = true;
            Language_List.add(record1);
           
           
            Test.startTest();
		    insert Language_List;
		    insert leadlist;
		    Test.stopTest();
		
		    TriggerSetting__c isOff = TriggerSetting__c.getInstance();
		    isOff.CloneLeadRecord__c=true;
		
		
		    List<Lead> newrecords=new List<Lead>([select id from Lead where LastName Like 'LeadTest%']);
		
		    Integer size=newrecords.size();
		    System.assertEquals(200,size);
		
		
		
    }
}