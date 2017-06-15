public class RetriveContacts 
{
	public static void getContacts()
	{
	List<Contact> contactrecord=new List<Contact>([select id,AssistantName,AssistantPhone,Birthdate from Contact where LastModifiedDate=Today]);
	for(Contact c:contactrecord)
	{
		System.debug(c);
	}
	
	}
    
}