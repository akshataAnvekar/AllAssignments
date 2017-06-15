@isTest
private class TestCountryCityDependancy {

    @testSetup

   public static void createDataFactory() {
       list<City__c> cityList = new list <City__c>();
       for(integer index = 1; index <= 3; index++) {
           City__c record = new city__c();
           record.Name = 'Pune'+index;
           record.Country__c = 'India';
           cityList.add(record);
       }
       for(integer index = 1; index < 2; index++) {
           City__c record = new city__c();
           record.Name = 'Newyork'+index;
           record.Country__c = 'USA';
           cityList.add(record);
       }
       insert cityList;
   }

   static testMethod void testFunctionality() {
       Test.StartTest();
       CountryCityDependancy obj =
       new CountryCityDependancy();
       obj.selectedCountry = 'India';
       obj.getCountryList();
       obj.fetchCity();
       System.assertEquals(3, obj.listSelectedCity.size());
       obj.listSelectedCity.clear();
       obj.selectedCountry = 'USA';
       obj.getCountryList();
       obj.fetchCity();
       System.assertEquals(1, obj.listSelectedCity.size());
       Test.StopTest();
   }
}