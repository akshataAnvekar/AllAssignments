@isTest
private class TestSoqlQueryGeneratorController {

    static testMethod void checkSelectedObjectList() {
       
       Test.setCurrentPage(Page.DisplayAllAccountRecords); 
       SoqlQueryGeneratorController sq=new SoqlQueryGeneratorController();
       sq.getObjectList();
       System.assertEquals(sq.setObject.size(),sq.options.size());
    }
    
    static testMethod void checkFieldList()
    {
      Test.setCurrentPage(Page.DisplayAllAccountRecords); 
       SoqlQueryGeneratorController sq=new SoqlQueryGeneratorController();
       sq.getObjectList();
       sq.selectedObject=sq.options[0].getValue();
       System.debug('+++++++++'+sq.selectedObject);
       
       sq.fetchFields();
       System.assertNotEquals(null,sq.listRelatedFields);
       
    }
    
    static testMethod void checkRadioButtons()
    {
       Test.setCurrentPage(Page.DisplayAllAccountRecords); 
       SoqlQueryGeneratorController sq=new SoqlQueryGeneratorController();
       List<SelectOption> radioButton=sq.getItems();
       System.assertEquals(2,radioButton.size());
       System.assertEquals('Asc',sq.sortOrder);
       
        
    }
    
    static testMethod void checkNoOfRecord()
    {
       Test.setCurrentPage(Page.DisplayAllAccountRecords); 
       SoqlQueryGeneratorController sq=new SoqlQueryGeneratorController();
       List<SelectOption> limitList=sq.getNoOfRecords();
       System.assertEquals(4,limitList.size());
    }
    
    static testMethod void CheckQueryBuilder()
    {
      Test.setCurrentPage(Page.DisplayAllAccountRecords);
      SoqlQueryGeneratorController sq=new SoqlQueryGeneratorController();
      sq.getObjectList();
      sq.selectedObject='Contact';
      sq.fetchFields();
      //String selected=sq.selectedFields[0].getValue();
      //sq.field.add('LastName');
      sq.selectedFields.add(new SelectOption('LastName','LastName'));
      sq.recordlimit='500';
      sq.sortOrder='Asc';
      String expectedQuery='SELECT LastName FROM Contact Order By id Asc LIMIT 500';
      sq.generateQuery();
      System.assertEquals(expectedQuery,sq.query);
        
    }
    
    
}