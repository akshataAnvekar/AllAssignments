@isTest
private class TestLinkContactToAccountByEmailDomain {

    static testMethod void toTestContactAccountAssociation() 
    {
    	List<Account> newaccount=TestDataFactory.createAccounts(1);
    	List<Contact> newcontact=TestDataFactory.createContacts(2,'abc@4dinfra.com');
    	
    	
    	Test.startTest();
    	insert newaccount;
    	insert newcontact;
    	Test.stopTest();
    	List<Contact> cont=[select id,AccountId from Contact where Email='abc@4dinfra.com'];
    	List<Account> acc=[select id from Account where Domain__c='4dinfra.com'];
    	
    	Account a=acc[0];
    	
    	
    	for(Contact c: cont)
    	{
    		System.assertEquals(a.id, c.AccountId);
    	}
        
        
    }
    
    
    static testMethod void toTestContactEmailBlank()
    {
    	List<Account> newaccount=TestDataFactory.createAccounts(1);
    	List<Contact> newcontact=TestDataFactory.createContacts(1,null);
  
    	Test.startTest();
    	insert newaccount;
    	insert newcontact;
    	Test.stopTest();
    	
    	List<Contact> cont=[select id,AccountId from Contact where Email=null];
    	Contact c=cont[0];
    	
    	System.assertEquals(null,c.AccountId);
    	
    }
    
    
    static testMethod void toTestAccountExplicitelySelectedByUser()
    {
    	List<Account> newaccount=TestDataFactory.createAccounts(1);
    	
    	//Record inserted with explicitely AccountId
    	List<Contact> newcontact=TestDataFactory.createContacts(2,'abc@14dinfra.com');
    	
    	
    	Test.startTest();
    	insert newaccount;
    	insert newcontact;
    	
    	Test.stopTest();
    	List<Contact> cont=[select id,AccountId from Contact where Email='abc@14dinfra.com'];
    	List<Account> acc=[select id from Account where Domain__c='14dinfra.com'];
    	
    	Account a=acc[0];
    	
    	
    	for(Contact c: cont)
    	{
    		System.assertEquals(c.AccountId,a.id);
    	}
    	
    }
    
    
    static testMethod void toTestForBulkInsertion()
    {
    	List<Account> newaccount=TestDataFactory.createAccounts(150);
    	
    	
    	List<Contact> newcontact=TestDataFactory.createContacts(150,'abc@4dinfra.com');
    	
    	
    	Test.startTest();
    	insert newaccount;
    	insert newcontact;
    	Test.stopTest();
    	
    	List<Contact> cont=[select id,AccountId from Contact where Email='abc@4dinfra.com'];
    	List<Account> acc=[select id from Account where Domain__c='4dinfra.com'];
    	
    	System.assertEquals(150,acc.size());
    	
    	
    }
}