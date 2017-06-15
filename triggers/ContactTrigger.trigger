trigger ContactTrigger on Contact (before insert) {

TriggerSetting__c isOff = TriggerSetting__c.getInstance();
    
    if(!isOff.CloneLeadRecord__c)
    {
    for (Contact c : Trigger.new) 
      {
        c.Email = 'saket@gmail.com';
        System.debug('FirstName-' + c.FirstName + '-LastName-' + c.LastName);
      }
    }
    
}