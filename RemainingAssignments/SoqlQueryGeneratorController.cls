public with sharing class SoqlQueryGeneratorController 
{
    public String selectedObject               {get;set;}
    public List<SelectOption> listRelatedFields{get;set;}
    Map<String, Schema.SObjectType> globalDescribeMap;
    public List<SelectOption> selectedFields{get;set;}
    public String currentFields{get;set;}
    public List<String> field{get;set;}
    public String recordlimit{get;set;}
    public String sortOrder{get;set;}
    public String query{get;set;}
    public List<sObject> slectedRecords{get;set;}
    public List<SelectOption> radioOptions{get;set;}
    {
      sortOrder='Asc';  
    }
    public List<String>selectedFieldsList{get;set;}
    public set<Schema.SObjectType> setObject;
    public List<SelectOption> options;
    
    
    public SoqlQueryGeneratorController()
    {
      listRelatedFields = new List<SelectOption>();
      List<SelectOption> options = new List<SelectOption>();
      selectedFields=new List<SelectOption>();
      
    }
    
    
  
    public List<SelectOption> getObjectList()
    {
      options = new List<SelectOption>();
      setObject = new set<Schema.SObjectType>();
      
      globalDescribeMap = Schema.getGlobalDescribe();
      
      
      for(String objectName : globalDescribeMap.keySet())
      {
      Schema.SObjectType objectType = globalDescribeMap.get(objectName);
      
        Schema.DescribeSObjectResult accountDescribe = objectType.getDescribe();
      
        if(accountDescribe.isAccessible() && accountDescribe.isQueryable()) 
        {
            
            if(!setObject.contains(objectType))
            {
                    options.add(new SelectOption(objectName,objectName));
                    setObject.add(objectType);
            }
        }
      }
      options.sort();
      return options;
    }
  
    public void fetchFields()
    {
      listRelatedFields = new List<SelectOption>();
      
      Schema.SObjectType objectType = globalDescribeMap.get(selectedObject);
      Schema.DescribeSObjectResult objectDescribe = objectType.getDescribe();
      Map<String, Schema.SObjectField> objectFields = objectDescribe.fields.getMap();
      selectedFieldsList=new List<String>(); 
      selectedFields.clear();
       //selectedFields=new List<SelectOption>();  
      
      for(Schema.SObjectField fieldToken : objectFields.values())
      {
            Schema.DescribeFieldResult fieldDescribe = fieldToken.getDescribe();
            
            
                if(fieldDescribe.isAccessible())
                {
                    listRelatedFields.add(new SelectOption(fieldDescribe.getName(),fieldDescribe.getName()));
                    
                }
       }
       listRelatedFields.sort();
      
     }
     
     
     public List<SelectOption> getItems() {

        List<SelectOption> radioOptions = new List<SelectOption>();

        radioOptions.add(new SelectOption('Asc','Ascending'));
        radioOptions.add(new SelectOption('Desc','Descending'));
        
        return radioOptions;

    }
    
    
    public List<SelectOption> getNoOfRecords()
    {
      List<SelectOption> records = new List<SelectOption>();
      records.add(new SelectOption('500','500'));
      records.add(new SelectOption('1000','1000'));
      records.add(new SelectOption('5000','5000'));
      records.add(new SelectOption('50000','50000'));
      return records;
    }
    
    public void generateQuery()
    {
        
        List<String> field=new List<String>();
        
            try{
                query='SELECT ';
        
                    for(integer i=0;i<selectedFields.size();i++)
                    {
                        field.add(selectedFields[i].getValue());
                    }
                        
                        query+= String.join(field, ',')+
                                ' FROM ' + selectedObject+
                                ' Order By id '+sortOrder+
                                ' LIMIT '+recordlimit;
                                
                                executeQuery();
               }
                catch(Exception e)
                {
                    ApexPages.addMessage(new ApexPages.message(ApexPages.severity.ERROR,'Error'+e));
                }
     }
    
    public void executeQuery()
    {
        Set<string> setFlds = new Set<String>();
        slectedRecords=Database.query(query);
            for(integer i=0;i<slectedRecords.size();i++)
            {
                setFlds.addAll(slectedRecords[i].getPopulatedFieldsAsMap().keySet());
            }
        selectedFieldsList.addAll(setFlds);
        
    }
     
     
     
}