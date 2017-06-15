global class OpportunitiesMailToContact implements Database.Batchable<SObject>,Database.stateful
{   List<Opportunity> opportunities;
    Map<Id,List<Opportunity>> accountOpportunities;
    Map<String,Map<Id,List<Opportunity>>> mailToContact=new Map<String,Map<Id,List<Opportunity>>>();
    
    global Database.QueryLocator start(Database.BatchableContext BC)
    {
         return Database.getQueryLocator('Select Id,(SELECT contact.email from AccountContactRoles)'+
                                          ',(SELECT id, name, amount from opportunities where stagename=\'closed won\')'+
                                          'from account where Id In (select AccountId from AccountContactRole where isPrimary=true)'
                                          +'AND Id In(select accountid from opportunity where StageName= \'Closed Won\'AND CloseDate =today)');
    }
    
    global void execute(Database.BatchableContext BC, List<Account> scope)
    {
        
        for(Account a : scope)
        {
            opportunities=new List<Opportunity>();
            accountOpportunities=new Map<Id,List<Opportunity>>();
            
            opportunities=a.opportunities;
            
            accountOpportunities.put(a.id,opportunities);
            String email=a.AccountContactRoles[0].Contact.Email;
                if(!mailToContact.containsKey(email))
                    {
                        mailToContact.put(email,accountOpportunities);
                    }
                else
                    {
                        mailToContact.get(email).put(a.id,opportunities);
                    }
            
         }
        
        
        
    }
    
    global void finish(Database.BatchableContext BC)
    {
        
        
        for(String recipient: mailToContact.keySet())
            {
                
                Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
                        String[] toAddresses = new String[] {recipient};
                        
                        mail.setToAddresses(toAddresses);
            
                for(Id a : mailToContact.get(recipient).keyset())
                    {
                        String body;
                        String finalbody;
                        Double Totalamount=0;
                        
                        mail.setSubject('Till Date Closed Won opportunities of Id' + a);
                        
                        
                        for(Opportunity o : mailToContact.get(recipient).get(a))
                            {
                                
                                totalamount=Totalamount+o.amount;
                                body='Opportunity Name ' + o.name +
                                          'Amount'+ o.Amount;
                                finalbody+=body; 
                                
                            }
                            
                        mail.setPlainTextBody(finalbody+'Total Amount' + Totalamount);
                            
                     }
                Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
            }
           
     }
    
}