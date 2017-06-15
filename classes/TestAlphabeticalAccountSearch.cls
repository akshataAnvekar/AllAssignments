@isTest
private class TestAlphabeticalAccountSearch {

     static testMethod void displayByAlphabetTest() {
       test.startTest();
           List<Account> accounts = TestDataFactory.createAccounts(100);
           
           insert accounts;
           
           ApexPages.StandardSetController stdController = new ApexPages.StandardSetController(accounts);
           AlphabeticalSearchController s=new AlphabeticalSearchController(stdController);
           System.debug(accounts);
           s.Alpha = 'T';
           s.searchByAlphabet();
           test.stopTest();
       
       System.assertEquals(100, s.accounts.size());
   }
   
   static testMethod void remoteTest() {
       test.startTest();
           List<Account> accounts = TestDataFactory.createAccounts(100);
           
           insert accounts;
           
           Account acc = [Select Id,Name from Account where Name='TestAccount1'];
           Id accountId = acc.id;
           SearchRecords.deleteAcc(accountId);
       test.stopTest();
       List<Account> accountlist = [Select Id from Account];
       System.assertEquals(99, accountlist.size());
   }
}