@isTest
private class TestLeadManager {

    @testSetup

   public static void createDataFactory()
   {
       List<Lead> leads=TestDataFactory.createLeads(2);
       insert leads;
   }
    
    static testMethod void leadInsertTest() 
    {
        RestRequest req = new RestRequest(); 
        RestResponse res = new RestResponse();

          
        req.httpMethod = 'POST';
        RestContext.request = req;
        RestContext.response = res;
        
        LeadManager.createLead('Akshata','Anvekar','abc@gmail.com','24354675','espl');
        
        List<Lead> newLead=[select id from Lead];

        System.assertEquals(3,newLead.size());
        
    }
    
    static testMethod void leadDeleteTest() 
    {
        RestRequest req = new RestRequest(); 
        RestResponse res = new RestResponse();

        req.requestURI = 'https://ap5.salesforce.com/services/apexrest/Lead?'+
                         'FirstName=Rest&LastName=LeadTest1&Email=restTest@mail.com&Phone=8888888881';
        req.httpMethod = 'DELETE';
        RestContext.request = req;
        RestContext.response = res;
        
        LeadManager.deleteLead();
        
        List<Lead> newLead=[select id from Lead];
        
        System.assertEquals(2,newLead.size());
        
    }
}