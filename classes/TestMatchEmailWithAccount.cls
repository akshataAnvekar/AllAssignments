@isTest
private class TestMatchEmailWithAccount {

    static testMethod void checkAccountAssociationWithCase() {
       
       Account accnt=new Account(Name='TestAccount',Type='Prospect',Domain__c='gmail.com',Email__c='abc@gmail.com');
       Case newcase=new Case(Status='Working',Origin='Web',SuppliedEmail='abc@gmail.com');
       
       Test.startTest();
       insert accnt;
       insert newcase;
       Test.stopTest();
       
       Account acc=[select id,Email__c from Account where Email__c='abc@gmail.com'];
       Case cs=[select id,AccountId from case where SuppliedEmail='abc@gmail.com'];
       
       System.assertEquals(cs.AccountId,acc.id);
       
        
    }
    
    static testMethod void checkEvent()
    {
    	Case newcase=new Case(Status='Working',Origin='Web',SuppliedEmail='abc@gmail.com');
       	insert newcase;
       	
       
    }
}