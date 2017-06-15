public with sharing class ChildToParent1
{
	public static void getActiveContact()
	{
		List<Contact> activeContact=new List<Contact>([select id,Name,Phone,Fax,Email,Contact.Account.Name From Contact WHERE Contact.Account.Industry='Energy']);
		
		for(Contact c : activeContact)
		{
			System.debug(c.id+'_'+c.Name+'_'+c.Phone+'_'+c.Fax+'_'+c.Email+'_'+c.Account.Name);
		}
	}
    
    
    
    
    
}