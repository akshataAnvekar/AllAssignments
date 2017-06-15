public class SoslQuery 
{
	public static void searchTest()
	{
	List<List<SObject>> searchList = [FIND 'test*' IN NAME FIELDS RETURNING Contact, Account(id,Name), Lead ,User];
	
	Contact[] contactlist = ((List<Contact>)searchList[0]);
	
	Account[] accountlist = ((List<Account>)searchList[1]);
	
	Lead[] leadlist = ((List<Lead>)searchList[2]);
	
	User[] userlist = ((List<User>)searchList[3]);
	
	for(Contact c: contactlist)
	{
		System.debug(c);
	}
	
	for(Account a: accountlist)
	{
		System.debug(a);
	}
	
	for(Lead l: leadlist)
	{
		System.debug(l);
	}
	
	for(User u: userlist)
	{
		System.debug(u);
	}
	
	
	}
}