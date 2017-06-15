public with sharing class TriggerCustomSettingDemo {
    
    public static void triggercheck()
    {
        TriggerSetting__c support = new TriggerSetting__c();
        
        
        System.debug(support.CloneLeadRecord__c);
    }
    
}