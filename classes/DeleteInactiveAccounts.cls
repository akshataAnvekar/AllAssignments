public class DeleteInactiveAccounts
{
	public static void deleteRecords()
	{
		List<Account> inactive=new List<Account>([SELECT id,Name from Account where Active__c='No' and CreatedDate=LAST_90_DAYS]);
		DELETE inactive;	
	}
    
}