@isTest
private class TestDisplayAccountRecords {

    static testMethod void searchAccountsTest()
   {
       test.startTest();
           List<Account> accountList = TestDataFactory.createAccounts(100);
           
           insert accountList;
           
           ApexPages.StandardSetController stdController = new ApexPages.StandardSetController(accountList);
           SearchRecords s=new SearchRecords(stdController);
           s.getstring = 'Acc';
           s.searchAccounts();
       test.stopTest();
       System.assertEquals(100,SearchRecords.accounts.size());
   }
   
   static testMethod void searchFailTest()
   {
       test.startTest();
           List<Account> accountList = TestDataFactory.createAccounts(1);
           ApexPages.StandardSetController stdController = new ApexPages.StandardSetController(accountList);
           
           Test.setCurrentPage(Page.DisplayAllAccountRecords);
           SearchRecords s=new SearchRecords(stdController);
           s.getstring = 'Ac';
           
           
           List<Apexpages.Message> msgs = ApexPages.getMessages();
            
            
            
            for(Apexpages.Message msg:msgs)
            {
              String errorMsg=msg.getDetail();
                system.assertEquals('Please enter atleast 3 characters',errorMsg);
                
                test.stopTest();
            }
   }
}