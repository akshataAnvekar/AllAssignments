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
        
        Test.startTest();
        LeadManager.createLead('Akshata','Anvekar','abc@gmail.com','24354675','espl');
        Test.stopTest();
        
        List<Lead> newLead=[select id from Lead];

        System.assertEquals(3,newLead.size());
        
    }
    
    static testMethod void leadDeleteTest() 
    {
        RestRequest req = new RestRequest(); 
        RestResponse res = new RestResponse();

        req.requestURI = 'https://ap5.salesforce.com/services/apexrest/Lead';
        req.addParameter('FirstName','Rest');
        req.addParameter('LastName','LeadTest1');
        req.addParameter('Email','restTest@mail.com');
        req.addParameter('Phone','8888888881');
        req.httpMethod = 'DELETE';
        RestContext.request = req;
        RestContext.response = res;
        
        Test.startTest();
        LeadManager.deleteLead();
        Test.stopTest();
        
        List<Lead> newLead=[select id from Lead];
           
        System.assertEquals(1,newLead.size());
        
    }
    
    static testMethod void leadUpdateTest() 
    {
        RestRequest req = new RestRequest(); 
        RestResponse res = new RestResponse();
        
        req.requestURI = 'https://ap5.salesforce.com/services/apexrest/Lead';
        req.httpMethod = 'PATCH';
        RestContext.request = req;
        RestContext.response = res;
        List<Lead> oldRecord=[select id,Email,Phone from Lead where FirstName='Rest' AND LastName='LeadTest2'];
        
        Test.startTest();
        LeadManager.updateLeadFields('Rest','LeadTest2','abc@gmail.com','24354675','espl');
        Test.stopTest();
        
        List<Lead> newRecord=[select id,Email,Phone from Lead where FirstName='Rest' AND LastName='LeadTest2'];
        
        System.assertNotEquals(oldRecord[0].Email,newRecord[0].Email);
        System.assertNotEquals(oldRecord[0].Phone,newRecord[0].Phone);
        
    }
    
}