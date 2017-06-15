global class JSONToSobject implements Database.Batchable<sobject>,Database.stateful
{
    
    String query = 'Select JSON__c, IsProccessed__c from Event__c where IsProccessed__c = false';
    
    global Database.QueryLocator start(Database.BatchableContext BC) 
     {
        return Database.getQueryLocator(query);
     }
    global void execute(Database.BatchableContext BC, list<Event__c> events)
     {
        JSONToSobjectHandler.createRecordsBasedOnEvents(events);
        
     }
    global void finish(Database.batchableContext bc)
     {
        System.debug('Processing Completed...');
     }
    
}