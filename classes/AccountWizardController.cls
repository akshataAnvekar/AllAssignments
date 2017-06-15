public with sharing class AccountWizardController {
	
	public AccountWizardController(ApexPages.StandardController controller){
			
		Attachment Attachments=(Attachment)controller.getRecord();
			}
	
	
	public Pagereference deleteOpp()
 {
     String atcid= ApexPages.currentPage().getParameters().get('atcid'); 
     
     Attachment atch = [Select id from Attachment where id =:atcid limit 1];
     if(atch !=null && atch.id !=null){
      delete atch;
     }
    return null;
 }
    
    
    
}