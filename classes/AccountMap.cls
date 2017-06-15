public class AccountMap 
{
	public static void getAccountObjectMap()
	{
	List<Account> accountList=new List<Account>([select id,Name,AccountNumber,BillingAddress from Account]);
	Map<id,Account> map2=new Map<id,Account>();
	
	for(Account a: accountList)
	{
		map2.put(a.id,a);
	}
	
	}
	
	public static void getAccountMap()
	{
	List<Account> accountList=new List<Account>([select id,Name,AccountNumber,BillingAddress from Account]);
	Map<String,id> map1=new Map<String,id>();
	
	for(Account a: accountList)
	{
		map1.put(a.Name,a.id);
	}
	
	}
}