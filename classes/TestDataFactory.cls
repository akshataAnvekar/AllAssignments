@isTest
public class TestDataFactory {

    public static List<Lead> createLeads(Integer numOfLeads) 
    {
    	List<Lead> leadlist=new List<Lead>();
		Lead lead;
		for(Integer i=1;i<=numOfLeads;i++)
		{
			lead=new Lead(FirstName='Rest',LastName='LeadTest'+String.valueOf(i),Email='restTest@mail.com',Phone='888888888'+i,Company='Eternus',Status='Open-Contacted');
			leadlist.add(lead);
		}
		return leadlist;
        
    }
    
    public static List<Opportunity> createOpportunities(String aId,Integer numOfOpportunities) 
    {
        List<Opportunity> Opportunitylist=new List<Opportunity>();
        Opportunity Opportunities;
        for(Integer i=1;i<=numOfOpportunities;i++)
        {
            Opportunities=new Opportunity(AccountId=aId,CloseDate=Date.newInstance(2017,06,14),Name='OpportunityTest'+String.valueOf(i),StageName='Closed Won',Amount=5000);
            Opportunitylist.add(Opportunities);
        }
        return Opportunitylist;
        
    }
    
    
    public static List<Account> createAccounts(Integer numOfAccounts)
    {
    	List<Account> acclist=new List<Account>();
    	Account acc;
    	
    	for(Integer i=1;i<=numOfAccounts;i++)
		{
			acc=new Account(Name='TestAccount'+String.valueOf(i),Type='Prospect',AccountNumber='AC-00000'+String.valueOf(i),Domain__c=i+'4dinfra.com');
			acclist.add(acc);
		}
		
		return acclist;
    }


    public static List<Event__c> createEvents(Integer count, String jsonField, Boolean toBeInserted) 
    {
        List<Event__c> events = new List<Event__c>();
        for (Integer i = 1; i <= count; i++) {
            Event__c event = new Event__c();
            event.JSON__c = jsonField;
            events.add(event);
        }
        if(toBeInserted) {
            insert events;
        }
        return events;
    }




    public static List<Case> createCases(Integer numOfcases) 
    {
    	List<Case> caselist=new List<Case>();
		Case cases;
		for(Integer i=1;i<=numOfcases;i++)
		{
			cases=new Case(Status='Working',Origin='Web',SuppliedEmail='abc@gmail.com');
			caselist.add(cases);
		}
		return caselist;
        
    }
    
    /*public static List<Contact> createContacts(Integer numOfcontacts) {
        //return createContacts(numOfContacts, null);
    }*/
    
    public static List<Contact> createContacts(String aId,Integer numOfcontacts, String email) 
    {
    	List<Contact> contactlist=new List<Contact>();
		Contact contacts;
		for(Integer i=1;i<=numOfcontacts;i++)
		{
			contacts=new Contact(LastName='Contact'+i,AccountId=aId,Contact_No__c='9287364500',Email=email);
			contactlist.add(contacts);
		}
		System.debug(contactlist);
		return contactlist;
		
    }
    
    public static List<AccountContactRole> createAccountContactRoles(String aId,String cId,Boolean value,Integer numOfAccountContactRole)
    {
        List<AccountContactRole> acclist=new List<AccountContactRole>();
        AccountContactRole acc;
        
        for(Integer i=1;i<=numOfAccountContactRole;i++)
        {
            acc=new AccountContactRole(AccountId=aId,ContactId=cId,IsPrimary=value);
            acclist.add(acc);
        }
        
        return acclist;
    }
}