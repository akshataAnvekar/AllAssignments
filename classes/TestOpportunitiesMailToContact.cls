@isTest
private class TestOpportunitiesMailToContact {
    
    public testmethod static void DataFactory() 
    {
        List<Account> newaccount=TestDataFactory.createAccounts(1);
        
        Test.startTest();
        insert newaccount;
        
        List<Contact> newcontact=TestDataFactory.createContacts(newaccount[0].id,1,'akshataanvekar5@gmail.com');
        insert newcontact;
        
        List<Opportunity> newopportunity=TestDataFactory.createOpportunities(newaccount[0].id,2);
        insert newopportunity;
        
        List<AccountContactRole> newAccountContactRoles=TestDataFactory.createAccountContactRoles(newaccount[0].id,newcontact[0].id,true,1);
        insert newAccountContactRoles;
          
        OpportunitiesMailToContact batch=new OpportunitiesMailToContact();
        Database.executeBatch(batch);
        Test.stopTest();
        
        
        System.assertEquals(newcontact[0].id,newAccountContactRoles[0].ContactId);
        System.assertEquals(newaccount[0].id,newAccountContactRoles[0].AccountId);
        
        List<AccountContactRole> a=[select Contact.Email from AccountContactRole];
        
        System.assertEquals(newcontact[0].Email,a[0].Contact.Email);
        
     }
}