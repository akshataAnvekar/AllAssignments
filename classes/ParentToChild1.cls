public with sharing class ParentToChild1 
{
	public static void getaccountContactsRecord()
	{
		List<Account> accountRecord=new List<Account>([SELECT id,Name, (SELECT id,Name FROM Contacts) from Account WHERE Name LIKE 'John%']);
		
		for(Account a : accountRecord)
		{
			System.debug(a);
			
			for(Contact c:a.Contacts)
			{
				System.debug(c.Name);
			}
			
		}
		}
}