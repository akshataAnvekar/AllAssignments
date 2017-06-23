@isTest
private class TestLeadManupulationSOAP {

    @testSetup
    public static void createDataFactory()
   {
       List<Lead> leads=TestDataFactory.createLeads(2);
       insert leads;
   }
    
    static testMethod void leadInsertTest() 
    {
        Test.startTest();
        LeadManupulationSOAP.Response response=new LeadManupulationSOAP.Response();
        response=LeadManupulationSOAP.createLead('Akshata','Anvekar','abc@gmail.com','24354675','espl');
        Test.stopTest();
        
        List<Lead> newLead=[select id from Lead];

        System.assertEquals(3,newLead.size());
        System.assertEquals(true,response.isSuccess);
        System.assertNotEquals(null,response.lead);
        System.assertEquals('Success',response.status);
        
        
    }
    
    static testMethod void leadInsertFailedTest() 
    {
        Test.startTest();
        String error;
        LeadManupulationSOAP.Response response=new LeadManupulationSOAP.Response();
        response=LeadManupulationSOAP.createLead('Akshata','Anvekar','abc@gmail.com','24354675','');
        Test.stopTest();
        
        response=LeadManupulationSOAP.createLead('Akshata','Anvekar','abc@gmail.com','24354675','');
        
        List<Lead> newLead=[select id from Lead];
        System.assertEquals(2,newLead.size());
        System.assertEquals(false,response.isSuccess);
        System.assertEquals(null,response.lead);
        System.assertNotEquals('Success',response.status);
        
    }
    
    static testMethod void leadDeleteTest() 
    {
        Test.startTest();
        LeadManupulationSOAP.Response response=new LeadManupulationSOAP.Response();
        response=LeadManupulationSOAP.deleteLead('Rest','LeadTest1','restTest@mail.com','8888888881');
        Test.stopTest();
        
        List<Lead> newLead=[select id from Lead];
           
        System.assertEquals(1,newLead.size());
        System.assertEquals(true,response.isSuccess);
        System.assertNotEquals(null,response.lead);
        System.assertEquals('Success',response.status);
        
    }
    
    static testMethod void leadUpdateTest() 
    {
        List<Lead> oldRecord=[select id,Email,Phone from Lead where FirstName='Rest' AND LastName='LeadTest2'];
        
        Test.startTest();
        LeadManupulationSOAP.Response response=new LeadManupulationSOAP.Response();
        response=LeadManupulationSOAP.updateLeadFields('Rest','LeadTest2','abc@gmail.com','24354675','espl');
        Test.stopTest();
        
        List<Lead> newRecord=[select id,Email,Phone from Lead where FirstName='Rest' AND LastName='LeadTest2'];
        
        System.assertNotEquals(oldRecord[0].Email,newRecord[0].Email);
        System.assertNotEquals(oldRecord[0].Phone,newRecord[0].Phone);
        System.assertEquals(true,response.isSuccess);
        System.assertEquals(oldRecord[0].id,response.lead);
        System.assertEquals('Success',response.status);
        
    }
    
}