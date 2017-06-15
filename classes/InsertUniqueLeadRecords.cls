public class InsertUniqueLeadRecords 
{
	public static void insertLeadRecords()
	{
		List<Lead> leadlist=new List<Lead>();
		Lead lead;
		  AssignmentRule assgn = new AssignmentRule();
       assgn = [select id from AssignmentRule where SobjectType = 'Lead' and Active = true limit 1];
       Database.DMLOptions dmlOpts = new Database.DMLOptions();
		dmlOpts.assignmentRuleHeader.assignmentRuleId= assgn.id;	
		
		
		for(Integer i=0;i<50;i++)
		{
			lead=new Lead(FirstName='Lead'+String.valueOf(i),LastName='record'+String.valueOf(i),Company='ESPL',Status='Open - Not Contacted');
			leadlist.add(lead);
			
			lead.setOptions(dmlOpts);
           leadList.add(lead);
		}
		
		for(Integer i = 51; i <= 80; i++)
       {
           lead = new Lead(FirstName='Lead-'+string.valueOf(i),
                                 LastName='record'+String.valueOf(i),
                                 Status='Closed - Not Converted');
           lead.setOptions(dmlOpts);
           leadList.add(lead);
       }
       
       Database.SaveResult[] saveList = Database.insert(leadlist,false);
       List<Log__c> logList = new List<Log__c>();
       Log__c logRecord;
       for(Database.SaveResult saveRecord : saveList)
       {
           if(!saveRecord.isSuccess())
           {
               String errorMessage;
               for(Database.Error error : saveRecord.getErrors())
               {
                   errorMessage =+ error.getMessage();
               }
               logRecord = new Log__c(Error__c=errorMessage);
               logList.add(logRecord);
           }
       }
		
		Insert leadlist;
    
	}
}