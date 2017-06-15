global class RemoveDuplicateLeads implements Database.Batchable<SObject>,Database.stateful{
    
    global Integer Totalcount=0;
    Eliminate_duplicate_Field__c criteria;
    Set<String> uniqueRecords=new Set<String>();
    Set<Lead> duplicateRecords=new Set<Lead>();
    List<Lead> deleteRecords=new List<Lead>();
    
    global RemoveDuplicateLeads()
    {
       Totalcount=0;
       criteria=Eliminate_duplicate_Field__c.getInstance();
    }
    
    global Database.QueryLocator start(Database.BatchableContext BC)
    {
         return Database.getQueryLocator('Select id,Name,Email,Phone FROM Lead');
    }
    
    global void execute(Database.BatchableContext BC, List<Lead> scope)
    {
        if(criteria.Email__c)
        {
           for(Lead l : scope)
           {
             if(l.Email!='')
                {
                    if(!uniqueRecords.contains(l.Email))
                        {
                            uniqueRecords.add(l.Email);
                        }
                    else
                        {
                            if(!duplicateRecords.contains(l))
                             {
                                 duplicateRecords.add(l);
                             }  
                        }
                }
           }
        
      }
        
        if(criteria.Phone__c)
        {
           for(Lead l :scope)
           {
            if(l.Phone!='')
            {
               if(!uniqueRecords.contains(l.Phone))
                {
                    uniqueRecords.add(l.Phone);
                }
               else
                {
                   if(!duplicateRecords.contains(l))
                    {
                        duplicateRecords.add(l);
                    } 
                  
               }
            }
           }
        }
        
        if(!duplicateRecords.isEmpty())
           {
             deleteRecords=new List<Lead>(duplicateRecords);
             Totalcount = Totalcount + deleteRecords.size();
             delete deleteRecords;
           }
           
      }
      
       global void finish(Database.BatchableContext BC){
           System.debug('********************************'+Totalcount);
           
   }
}