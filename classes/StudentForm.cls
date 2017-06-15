public with sharing class StudentForm {
    
    public list<Student__C> stList{get;set;}
    public Student__c st{get;set;}
    Public string customValue{get;set;}
   
    public String lang{get;set;}
    public String translation{get;set;}
    public List<selectOption> options{get;set;}
    public Map<String,LangCode__c> codelist{get;set;}
    
    public StudentForm(ApexPages.StandardController ac)
    {   
       st=(Student__c)ac.getRecord();
       codelist=LangCode__c.getAll();
       customValue = Label.Successfull;
    }
    
    
    public List<selectOption> getLanguages()
    {
        options=new List<selectOption>();
            for(LangCode__c code : LangCode__c.getAll().values())
              {
                    options.add(new selectOption(code.Name,code.Name));
              }
        
        return options;
        
    }
        
    
    
    public void changeLanguage()
    {
        if(codelist.containsKey(translation))
         {
            lang = codelist.get(translation).code__c;
            
         }
    
    }
    
    
    
    
    
   public PageReference submitPage()
    {
        try
        {
        
            insert st;
       
        }catch(DmlException e)
        {
            ApexPages.addMessage(new ApexPages.message(ApexPages.severity.ERROR,
                                                        'There is an error '+e));
        }
         
        
        ApexPages.addMessage(new ApexPages.message(ApexPages.severity.info,
                                                        Label.Successfull));
         return null;
        
    }

}