public with sharing class InserBulkAccountRecords 
{
	public static void insertAccountRecords()
	{
	List<Account> acclist=new List<Account>();
		Account acc;
		for(Integer i=0;i<150;i++)
		{
			acc=new Account(Name='Account'+String.valueOf(i),Type='Prospect');
			acclist.add(acc);
		}
		Insert acclist;
	}
}