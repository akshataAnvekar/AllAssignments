@isTest
private class TestJSONToSobject {

    static testMethod void singleInvalidJSON() {
        String jsonField = '{"JSON":{"Name":"Batch8"}"Object Name":"Account"}';
        TestDataFactory.createEvents(1, jsonField, true);
        test.startTest();
            JSONToSobject b = new JSONToSobject();
            database.executeBatch(b);
        test.stopTest();
        Event__c event = [Select IsProccessed__c, Error_If_Any__c from Event__c][0];
        System.assertEquals(false, event.IsProccessed__c);
        System.assertEquals(System.Label.Event_InvalidJSON, event.Error_If_Any__c);
    }

    static testMethod void singleFieldEmpty() {
        String jsonField = '';
        TestDataFactory.createEvents(1, jsonField, true);
        test.startTest();
            JSONToSobject b = new JSONToSobject();
            database.executeBatch(b);
        test.stopTest();
        Event__c event = [Select IsProccessed__c, Error_If_Any__c from Event__c][0];
        System.assertEquals(false, event.IsProccessed__c);
        System.assertEquals(System.Label.Event_FieldEmpty, event.Error_If_Any__c);
    }

    static testMethod void singleNoObject() {
        String jsonField = '{"JSON":{"Name":"Batch8"}}';
        TestDataFactory.createEvents(1, jsonField, true);
        test.startTest();
            JSONToSobject b = new JSONToSobject();
            database.executeBatch(b);
        test.stopTest();
        Event__c event = [Select IsProccessed__c, Error_If_Any__c from Event__c][0];
        System.assertEquals(false, event.IsProccessed__c);
        System.assertEquals(System.Label.Event_NoObjectName, event.Error_If_Any__c);
    }

    static testMethod void singleInvalidObjectName() {
        String jsonField = '{"JSON":{"Name":"Batch8"},"Object Name":"Account1"}}';
        TestDataFactory.createEvents(1, jsonField, true);
        test.startTest();
            JSONToSobject b = new JSONToSobject();
            database.executeBatch(b);
        test.stopTest();
        Event__c event = [Select IsProccessed__c, Error_If_Any__c from Event__c][0];
        System.assertEquals(false, event.IsProccessed__c);
        System.assertEquals(System.Label.Event_InvalidObjectName, event.Error_If_Any__c);
    }

    static testMethod void singleNoJSON() {
        String jsonField = '{"Object Name":"Account"}}';
        TestDataFactory.createEvents(1, jsonField, true);
        test.startTest();
            JSONToSobject b = new JSONToSobject();
            database.executeBatch(b);
        test.stopTest();
        Event__c event = [Select IsProccessed__c, Error_If_Any__c from Event__c][0];
        System.assertEquals(false, event.IsProccessed__c);
        System.assertEquals(System.Label.Event_NoJSON, event.Error_If_Any__c);
    }

    static testMethod void singleEmptyJSON() {
        String jsonField = '{"JSON":"","Object Name":"Account"}}';
        TestDataFactory.createEvents(1, jsonField, true);
        test.startTest();
            JSONToSobject b = new JSONToSobject();
            database.executeBatch(b);
        test.stopTest();
        Event__c event = [Select IsProccessed__c, Error_If_Any__c from Event__c][0];
        System.assertEquals(false, event.IsProccessed__c);
        System.assertEquals(System.Label.Event_NoJSON, event.Error_If_Any__c);
    }

    static testMethod void singleInvalidField() {
        String jsonField = '{"JSON":{"Name":"Batch8", "AccountNumber1":"11111"},"Object Name":"Account"}}';
        TestDataFactory.createEvents(1, jsonField, true);
        test.startTest();
            JSONToSobject b = new JSONToSobject();
            database.executeBatch(b);
        test.stopTest();
        Event__c event = [Select IsProccessed__c, Error_If_Any__c from Event__c][0];
        System.assertEquals(false, event.IsProccessed__c);
        System.assertEquals(System.Label.Event_InvalidField, event.Error_If_Any__c);
    }

    static testMethod void singleRequiredFieldNotProvided() {
        String jsonField = '{"JSON":{"AccountNumber":"11111"},"Object Name":"Account"}}';
        TestDataFactory.createEvents(1, jsonField, true);
        test.startTest();
            JSONToSobject b = new JSONToSobject();
            database.executeBatch(b);
        test.stopTest();
        Event__c event = [Select IsProccessed__c, Error_If_Any__c from Event__c][0];
        System.assertEquals(false, event.IsProccessed__c);
        System.assertEquals(System.Label.Event_RequiredNotProvided, event.Error_If_Any__c);
    }

    static testMethod void singleSuccess() {
        String jsonField = '{"JSON":{"Name":"Batch8", "AccountNumber":"11111"},"Object Name":"Account"}}';
        TestDataFactory.createEvents(1, jsonField, true);
        test.startTest();
            JSONToSobject b = new JSONToSobject();
            database.executeBatch(b);
        test.stopTest();
        Event__c event = [Select IsProccessed__c, Error_If_Any__c from Event__c][0];
        System.assertEquals(true, event.IsProccessed__c);
        System.assertEquals(null, event.Error_If_Any__c);
    }

    static testMethod void singleException() {
        String jsonField = '{"JSON":{"Name":"Batch8", "ParentId":"abcd"},"Object Name":"Account"}}';
        TestDataFactory.createEvents(1, jsonField, true);
        test.startTest();
            JSONToSobject b = new JSONToSobject();
            database.executeBatch(b);
        test.stopTest();
        Event__c event = [Select IsProccessed__c, Error_If_Any__c from Event__c][0];
        System.assertEquals(false, event.IsProccessed__c);
    }

    static testMethod void bulkInvalidJSON() {
        String jsonField = '{"JSON":{"Name":"Batch8"}"Object Name":"Account"}';
        TestDataFactory.createEvents(100, jsonField, true);
        test.startTest();
            JSONToSobject b = new JSONToSobject();
            database.executeBatch(b);
        test.stopTest();
        List<Event__c> events = [Select IsProccessed__c, Error_If_Any__c from Event__c];
        for(Event__c event : events) {
            System.assertEquals(false, event.IsProccessed__c);
            System.assertEquals(System.Label.Event_InvalidJSON, event.Error_If_Any__c);
        }
    }

    static testMethod void bulkFieldEmpty() {
        String jsonField = '';
        TestDataFactory.createEvents(100, jsonField, true);
        test.startTest();
            JSONToSobject b = new JSONToSobject();
            database.executeBatch(b);
        test.stopTest();
        List<Event__c> events = [Select IsProccessed__c, Error_If_Any__c from Event__c];
        for(Event__c event : events) {
            System.assertEquals(false, event.IsProccessed__c);
            System.assertEquals(System.Label.Event_FieldEmpty, event.Error_If_Any__c);
        }
    }

    static testMethod void bulkNoObject() {
        String jsonField = '{"JSON":{"Name":"Batch8"}}';
        TestDataFactory.createEvents(100, jsonField, true);
        test.startTest();
            JSONToSobject b = new JSONToSobject();
            database.executeBatch(b);
        test.stopTest();
        List<Event__c> events = [Select IsProccessed__c, Error_If_Any__c from Event__c];
        for(Event__c event : events) {
            System.assertEquals(false, event.IsProccessed__c);
            System.assertEquals(System.Label.Event_NoObjectName, event.Error_If_Any__c);
        }
    }

    static testMethod void bulkInvalidObjectName() {
        String jsonField = '{"JSON":{"Name":"Batch8"},"Object Name":"Account1"}}';
        TestDataFactory.createEvents(100, jsonField, true);
        test.startTest();
            JSONToSobject b = new JSONToSobject();
            database.executeBatch(b);
        test.stopTest();
        List<Event__c> events = [Select IsProccessed__c, Error_If_Any__c from Event__c];
        for(Event__c event : events) {
            System.assertEquals(false, event.IsProccessed__c);
            System.assertEquals(System.Label.Event_InvalidObjectName, event.Error_If_Any__c);
        }
    }

    static testMethod void bulkNoJSON() {
        String jsonField = '{"Object Name":"Account"}}';
        TestDataFactory.createEvents(100, jsonField, true);
        test.startTest();
            JSONToSobject b = new JSONToSobject();
            database.executeBatch(b);
        test.stopTest();
        List<Event__c> events = [Select IsProccessed__c, Error_If_Any__c from Event__c];
        for(Event__c event : events) {
            System.assertEquals(false, event.IsProccessed__c);
            System.assertEquals(System.Label.Event_NoJSON, event.Error_If_Any__c);
        }
    }

    static testMethod void bulkEmptyJSON() {
        String jsonField = '{"JSON":"","Object Name":"Account"}}';
        TestDataFactory.createEvents(100, jsonField, true);
        test.startTest();
            JSONToSobject b = new JSONToSobject();
            database.executeBatch(b);
        test.stopTest();
        List<Event__c> events = [Select IsProccessed__c, Error_If_Any__c from Event__c];
        for(Event__c event : events) {
            System.assertEquals(false, event.IsProccessed__c);
            System.assertEquals(System.Label.Event_NoJSON, event.Error_If_Any__c);
        }
    }

    static testMethod void bulkInvalidField() {
        String jsonField = '{"JSON":{"Name":"Batch8", "AccountNumber1":"11111"},"Object Name":"Account"}}';
        TestDataFactory.createEvents(100, jsonField, true);
        test.startTest();
            JSONToSobject b = new JSONToSobject();
            database.executeBatch(b);
        test.stopTest();
        List<Event__c> events = [Select IsProccessed__c, Error_If_Any__c from Event__c];
        for(Event__c event : events) {
            System.assertEquals(false, event.IsProccessed__c);
            System.assertEquals(System.Label.Event_InvalidField, event.Error_If_Any__c);
        }
    }

    static testMethod void bulkRequiredFieldNotProvided() {
        String jsonField = '{"JSON":{"AccountNumber":"11111"},"Object Name":"Account"}}';
        TestDataFactory.createEvents(100, jsonField, true);
        test.startTest();
            JSONToSobject b = new JSONToSobject();
            database.executeBatch(b);
        test.stopTest();
        List<Event__c> events = [Select IsProccessed__c, Error_If_Any__c from Event__c];
        for(Event__c event : events) {
            System.assertEquals(false, event.IsProccessed__c);
            System.assertEquals(System.Label.Event_RequiredNotProvided, event.Error_If_Any__c);
        }
    }

    static testMethod void bulkSuccess() {
        String jsonField = '{"JSON":{"Name":"Batch8", "AccountNumber":"11111"},"Object Name":"Account"}}';
        TestDataFactory.createEvents(100, jsonField, true);
        test.startTest();
            JSONToSobject b = new JSONToSobject();
            database.executeBatch(b);
        test.stopTest();
        List<Event__c> events = [Select IsProccessed__c, Error_If_Any__c from Event__c];
        for(Event__c event : events) {
            System.assertEquals(true, event.IsProccessed__c);
            System.assertEquals(null, event.Error_If_Any__c);
        }
    }

    static testMethod void bulkException() {
        String jsonField = '{"JSON":{"Name":"Batch8", "Owner":"abcd"},"Object Name":"Account"}}';
        TestDataFactory.createEvents(100, jsonField, true);
        test.startTest();
            JSONToSobject b = new JSONToSobject();
            database.executeBatch(b);
        test.stopTest();
        List<Event__c> events = [Select IsProccessed__c, Error_If_Any__c from Event__c];
        for(Event__c event : events) {
            System.assertEquals(false, event.IsProccessed__c);
        }
    }
}