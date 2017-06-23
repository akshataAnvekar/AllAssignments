@isTest
private class TestRemoveDuplicateLeads {

    static testMethod void nothingChecked()
    {
        List<Lead> uniqueLeads=TestDataFactory.createLeads(100);
        List<Lead> duplicateLeads=TestDataFactory.createLeads(100);
        Eliminate_duplicate_Field__c lObj = new Eliminate_duplicate_Field__c();
        lObj.Phone__c=false;
        lObj.Email__c=false;
        test.startTest();
        insert uniqueLeads;
        insert duplicateLeads;
        insert lObj;
        
            RemoveDuplicateLeads rObj = new RemoveDuplicateLeads();
            database.executeBatch(rObj,200);
        test.stopTest();
        List<Lead> leadListOne = new List<Lead>();
        leadListOne=[SELECT Id,Name,Email FROM Lead ORDER BY CreatedDate];
        system.assertEquals(200,leadListOne.size());
        
    }
    
   static testMethod void nameCheckedUniqueNameSameEmail()
    {
        List<Lead> uniqueLeads=TestDataFactory.createLeads(100);
        
        for(Integer i=0;i<100;i=i+2)
        {
            uniqueLeads[i].Email = uniqueLeads[i+1].Email;
        }
        insert uniqueLeads;
        Eliminate_duplicate_Field__c lObj = new Eliminate_duplicate_Field__c();
        //lObj.Name__c=true;
        lObj.Email__c=false;
        insert lObj;
        test.startTest();
            RemoveDuplicateLeads rObj = new RemoveDuplicateLeads();
            database.executeBatch(rObj);
        test.stopTest();
        List<Lead> leadList =[SELECT id,Name,Email FROM Lead];
        system.assertEquals(uniqueLeads.size(),leadList.size());
        system.assertEquals(true,leadList[0].Email.containsOnly('restTest@mail.com'));
        system.assertEquals(true,leadList[1].Email.containsOnly('restTest@mail.com'));
        for(Integer i=1;i<99;i++)
        {
            system.assertEquals(false,leadList[i].Name.containsOnly('RestLeadTest1'));
        }
    }

    static testMethod void emailChecked()
    {
        List<Lead> uniqueLeads=TestDataFactory.createLeads(100);
        List<Lead> duplicateLeads=TestDataFactory.createLeads(100);
        Eliminate_duplicate_Field__c lObj = new Eliminate_duplicate_Field__c();
        lObj.Phone__c=false;
        lObj.Email__c=true;
        insert uniqueLeads;
        insert duplicateLeads;
        insert lObj;
        test.startTest();
            RemoveDuplicateLeads rObj = new RemoveDuplicateLeads();
            database.executeBatch(rObj);
        test.stopTest();
        List<Lead> leadList =[SELECT id,Name,Email FROM Lead];
        system.assertEquals(1,leadList.size());
        }
    
    
    /*static testMethod void emailCheckedUniqueEmailSameName()
    {
        List<Lead> uniqueLeads=LeadDataFactory.createLeadRecords(100,'');
        for(Integer i=0;i<100;i=i+2)
        {
            uniqueLeads[i].LastName = uniqueLeads[i+1].LastName;
        }
        insert uniqueLeads;
        LeadFields__c lObj = new LeadFields__c();
        lObj.Name__c=false;
        lObj.Email__c=true;
        insert lObj;
        test.startTest();
            RemoveDuplicateLeads rObj = new RemoveDuplicateLeads();
            database.executeBatch(rObj);
        test.stopTest();
        List<Lead> leadList =[SELECT id,Name,Email FROM Lead];

        system.assertEquals(uniqueLeads.size(),leadList.size());
        system.assertEquals(true,leadList[0].Name.containsOnly('Lead1'));
        system.assertEquals(true,leadList[1].Name.containsOnly('Lead1'));
        for(Integer i=1;i<99;i++)
        {
            system.assertEquals(false,leadList[i].Email.containsOnly('abc0@gmail.com'));
        }
    }*/
    
    static testMethod void phoneChecked()
    {
        List<Lead> uniqueLeads=TestDataFactory.createLeads(100);
        List<Lead> duplicateLeads=TestDataFactory.createLeads(100);
        Eliminate_duplicate_Field__c lObj = new Eliminate_duplicate_Field__c();
        lObj.Phone__c=true;
        lObj.Email__c=false;
        insert uniqueLeads;
        insert duplicateLeads;
        insert lObj;
        test.startTest();
            RemoveDuplicateLeads rObj = new RemoveDuplicateLeads();
            database.executeBatch(rObj);
        test.stopTest();
        List<Lead> leadList =[SELECT id,Name,Email FROM Lead];
        
        system.assertEquals(1,leadList.size());
        
    }
}