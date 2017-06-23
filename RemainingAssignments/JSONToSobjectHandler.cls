public class JSONToSobjectHandler 
{
    public static void createRecordsBasedOnEvents(List<Events__c> events) {
        List<sObject> recordList = new List<sObject>();
        Set<String> recordFields;
        Map<String,Schema.SObjectField> allFields;
        for(Events__c event : events) {
            Boolean isValidField = true, containsRequiredFields = true;
            if(event.JSON__c != NULL) {
                System.debug('********'+event.JSON__c);
                try {
                    Map<String, Object> jsonFieldMap = (Map<String, Object>)JSON.deserializeUntyped(event.JSON__c);
                    String ObjectName = (String)jsonFieldMap.get('Object Name');
                    if(ObjectName != NULL) {
                        System.debug('********'+ObjectName);
                        if(SObjectUtil.isObjectExist(ObjectName)) {
                            System.debug('********Object Exists');
                            sObject record = Schema.getGlobalDescribe().get(ObjectName).newSObject();
                            if(jsonFieldMap.containsKey('JSON') && jsonFieldMap.get('JSON')!='') {
                                System.debug('********'+jsonFieldMap.get('JSON'));
                                String objectJson = JSON.serialize(jsonFieldMap.get('JSON'));
                                Map<String,String> jsonMap = (Map<String, String>)JSON.deserialize
                                                          (objectJson, Map<String, String>.class);
                                Map<String, Schema.SObjectType> m  = Schema.getGlobalDescribe() ;
                                Schema.SObjectType str = m.get(ObjectName) ;
                                Schema.DescribeSObjectResult r = str.getDescribe() ;
                                allFields = r.fields.getMap() ;
                                for(String s: jsonMap.keySet()) {
                                    System.debug('********'+jsonMap.keySet());
                                    if(allFields.keySet().contains(s.toLowerCase())) {
                                        record.put(s.toLowerCase() ,jsonMap.get(s));
                                    } else {
                                        isValidField = false;
                                        event.Error_If_Any__c = System.Label.Event_InvalidField;
                                        break;
                                    }
                                }
                                if(isValidField) {
                                    recordFields=new Set<String>();
                                    for(string s : jsonMap.keySet()) {
                                        recordFields.add(s.toLowerCase());
                                    }
                                    for(String f : allFields.keyset()) {
                                        Schema.DescribeFieldResult desribeResult =
                                                                        allFields.get(f).getDescribe();
                                        if( desribeResult.isCreateable() && !desribeResult.isNillable()
                                            && !desribeResult.isDefaultedOnCreate()) {
                                            if(!recordFields.contains(f.toLowerCase())) {
                                                containsRequiredFields = false;
                                                event.Error_If_Any__c =
                                                            System.Label.Event_RequiredNotProvided;
                                                break;
                                            }
                                        }
                                    }
                                    if(containsRequiredFields) {
                                        event.Error_If_Any__c = '';
                                        recordList.add(record);
                                        event.IsProccessed__c = true;
                                    }
                                }
                            } else {
                                event.Error_If_Any__c = System.Label.Event_NoJSON;
                            }
                        } else {
                            event.Error_If_Any__c = System.Label.Event_InvalidObjectName;
                        }
                    } else {
                        event.Error_If_Any__c = System.Label.Event_NoObjectName;
                    }
                } catch(Exception e) {
                    event.Error_If_Any__c = System.Label.Event_InvalidJSON;
                }
            } else {
                event.Error_If_Any__c = System.Label.Event_FieldEmpty;
            }
        }
        try {
            insert recordList;
            update events;
        } catch(Exception e) {
            System.debug('ERROR::::::::' + e);
        }
    }
    
}