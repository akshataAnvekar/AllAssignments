public with sharing class ContactsList {
    
	public static void getContactsList()
	{
		
	List<Contact> contactrecord=new List<Contact>([select id,AssistantName,AssistantPhone,Birthdate from Contact]);
	
	for(Contact c:contactrecord)
	{
		System.debug(c.AssistantName+c.AssistantPhone+c.Birthdate);
	}
	
	}
    
}