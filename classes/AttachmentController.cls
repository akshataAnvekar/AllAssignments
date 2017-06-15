public with sharing class AttachmentController {
    
    public Account accnt{get;set;}
    public Id AccountId{get;set;}
   
    
    public AttachmentController(ApexPages.StandardController ac)
    {
        this.accnt = (Account) ac.getRecord();
        accountId=(Id)ac.getId();
    }
    
    public AttachmentController() {
        accountId = ApexPages.currentPage().getParameters().get('id');
        accnt=[select id,Name,AccountNumber,Site,Type from Account where id=:accountId];
                
 }
    
    public Attachment attachment {
        get {
                if (attachment == null)
                    attachment = new Attachment();
                return attachment;
            }
        set;
  }

  public PageReference upload() {

        attachment.OwnerId = UserInfo.getUserId();
        attachment.ParentId = this.accountId; // the record the file is attached to
        attachment.IsPrivate = true;

    try {
        
        insert attachment;
    
    } catch (DMLException e) {
      
        ApexPages.addMessage(new ApexPages.message(ApexPages.severity.ERROR,'Error uploading attachment'));
        return null;
        
    } finally {
      
      attachment = new Attachment(); 
    
    }

    ApexPages.addMessage(new ApexPages.message(ApexPages.severity.INFO,'Attachment uploaded successfully'));
    return (new ApexPages.StandardController (new Account(Id=accountId))).view();
  
  }
  
    public PageReference nextPage()
    {
        return Page.accntstep2;
    
    }
    
    
}