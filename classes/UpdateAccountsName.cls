public class UpdateAccountsName {
	
	public static void updateNames()
	{
		
		List<Account> accountNames=new List<Account>([select id,Name from Account where Name LIKE 'a%']);
		
		
			for(Account aname: accountNames)
				{
					aname.Name='Updated via update DML operation';
					update aname;
					System.debug(aname);
			
				}
			
		
		
	}    
}