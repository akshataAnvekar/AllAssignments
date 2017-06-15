@isTest
public class ContactTriggerTest {

    @isTest
    static void testEmail() {
        Contact newContact = new Contact(
        	FirstName = 'Saket',
            LastName = 'Joshi',
            Contact_No__c = '123'
        );
        
        Test.startTest();
        	insert newContact;
       	Test.stopTest();
        
        List<Contact> lstContact = [
            SELECT Email
			  FROM Contact
			 WHERE Id =: newContact.Id
             LIMIT 1
        ];
        
        System.assertEquals('saket@gmail.com', lstContact[0].Email);
    }
    
}