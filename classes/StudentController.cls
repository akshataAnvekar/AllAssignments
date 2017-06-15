public with sharing class StudentController {
    public  Student__c student{get;set;}
    public StudentController(ApexPages.StandardController controller)
    {
        student =(Student__c)controller.getRecord();
    }
    
    public pagereference enterDetails()
    {
        insert student;
        ApexPages.addmessage(new ApexPages.message(ApexPages.severity.Info,'Records insrted Sucessfully'));
        return null;
    }
    
}