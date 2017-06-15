public class GetEnrollmentYear 
{
	public static void getAccountRecord1()
	{
	List<Account> account=new List<Account>([select id,Name,AccountNumber,Type from Account where Enrollment_Year__c='2010']);
	
	for(Account a:account)
	{
		System.debug(a.id+a.Name+a.AccountNumber+a.Type);
	}
	}
	
	public static void getAccountRecord2()
	{
	List<Account> account=new List<Account>([select id,Name,AccountNumber,Type from Account where Enrollment_Year__c includes('2013') AND Enrollment_Year__c includes('2014')]);
	
	for(Account a:account)
	{
		System.debug(a.id+a.Name+a.AccountNumber+a.Type);
	}
	}
}