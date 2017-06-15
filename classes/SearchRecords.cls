public with sharing class SearchRecords {
		
		public String getstring{get;set;}
		public String alpha{get;set;}
		public List<String> alphabets{get;set;}
		public static List<Account> accounts{get;set;}
		public Integer Length{get;set;}
		public static Account account{get;set;}
		public Id acc{get;set;}
		public static boolean deletedRow{get;set;}
		
		public SearchRecords(ApexPages.StandardSetController ac){
			accounts = ac.getRecords();
			alphabets=new List<String>{'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z','All'};
			//deletedRow=true;
		}
        
        @RemoteAction
		public static void deleteAcc(Id acc)
		{
		    //deletedRow=false;
			account=[select id from Account where Id=:acc];
			delete account;
		}
		
		public void searchAccounts()
		{
		    
		        if(getstring!=null && getstring.length() >= 3)
			   {
					accounts=Database.query('Select id,Name,Email__c,Phone,Website from Account WHERE Name Like \'%'+getstring+'%\'');
					Length=accounts.size();
				}
				else if(getstring.length() <= 3 || getstring==null)
				{
					ApexPages.addMessage(new ApexPages.message(ApexPages.severity.ERROR,'Please enter atleast 3 characters'));
				}
		}
		
		public void displayAllRecords()
		{
		    getstring=null;
		    accounts=[select id,Name,Email__c,Phone,Website from Account];
		    Length=accounts.size();
		}
		
		public void searchByAlphabet()
        {
            if(alpha=='All')
               {
                   accounts=[Select id,Name,Email__c,Phone,Website from Account];
               }
               else{
                
                    accounts=[Select Id,Name,Email__c,phone,Website from Account where name Like :alpha+'%'];
               }
        }
}