@isTest
private class TestStudentForm {
     
    @testSetup
    public static void createDataFactory() {
           
           list<LangCode__c> Language_List = new list <LangCode__c>();
           LangCode__c record1 = new LangCode__c();
           record1.Name = 'English';
           record1.code__c = 'en';
           Language_List.add(record1);
           LangCode__c record2 = new LangCode__c();
           record2.Name = 'French';
           record2.code__c = 'fr';
           Language_List.add(record2);
           LangCode__c record3 = new LangCode__c();
           record3.Name = 'Spanish';
           record3.code__c = 'es';
           Language_List.add(record3);
           insert Language_List;

   }

   static testMethod void testFunctionality() 
   {
       
       Student__c s=new Student__c();   
       ApexPages.StandardController sc = new ApexPages.standardController(s);
       StudentForm obj= new StudentForm(sc);
       
       Test.StartTest();
       System.debug('*************'+obj);
      
       obj.translation = 'Spanish';
       obj.changeLanguage();
       System.debug('*************'+obj);
       System.assertEquals('es', obj.lang);
       
       obj.translation = 'French';
       obj.changeLanguage();
       System.debug('*************'+obj+obj.lang);
       System.assertEquals('fr', obj.lang);
       
       obj.translation = 'English';
       obj.changeLanguage();
       System.debug('*************'+obj+obj.lang);
       Test.StopTest();
       System.assertEquals('en', obj.lang);
   }
   
   static testMethod void saveTest()
   {
       test.startTest();
       Student__c st=new Student__c(Name='New Test',Roll_Number__c=76,Gender__c='Female');
       ApexPages.StandardController sc = new ApexPages.standardController(st);
       StudentForm obj= new StudentForm(sc);
           
           Test.setCurrentPage(Page.StudentForm);
           obj.translation = 'English';
           obj.changeLanguage();
           System.debug(obj);
           
           obj.submitPage();
           List<Apexpages.Message> msgs = ApexPages.getMessages();
            
            
            
            for(Apexpages.Message msg : msgs)
            {
              String successMsg=msg.getDetail();
                system.assertEquals('Record Added Successfully',successMsg);
                System.debug(successMsg);
                
                test.stopTest();
            }
   }
}