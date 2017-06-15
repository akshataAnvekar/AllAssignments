public with sharing class AbcContainer {
    
    private Invoice__c invoiceContainer{get;set;}
   public Map<String,Double> mapExpenses{get;set;}
   public List<String> keyMap{get;set;}
   public AbcContainer (ApexPages.StandardController abc)
   {
       invoiceContainer = (Invoice__c)abc.getRecord();
       invoiceContainer = [SELECT Service_Fee__c,Total_Labour_Cost__c,Discount__c,Tax__c,Total__c FROM Invoice__c WHERE Id=:invoiceContainer.Id];
       mapExpenses = new Map<String,Double>();
       keyMap = new List<String>(); 
       System.debug('Invoice Info:::'+invoiceContainer);
       mapExpenses.put('Service Fee', invoiceContainer.Service_Fee__c);
       System.debug(':::After Service Fee');
       mapExpenses.put('Labour Cost', invoiceContainer.Total_Labour_Cost__c);
       System.debug(':::After Labour Cost');
       mapExpenses.put('Discount', invoiceContainer.Discount__c);
       System.debug(':::After Discount');
       mapExpenses.put('Tax', invoiceContainer.Tax__c);
       mapExpenses.put('Total', invoiceContainer.Total__c);
       keyMap.addAll(mapExpenses.keySet());
       System.debug('Map:::::'+mapExpenses);
   }
    
}