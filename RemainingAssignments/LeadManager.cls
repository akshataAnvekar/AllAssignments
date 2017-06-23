@RestResource(urlMapping='/Lead/*')
global class LeadManager {
    
    @HttpPost
    global static void createLead(String firstName, String lastName,

      String email, String phone,String company) 
      {
            
            RestRequest request = RestContext.request;
            RestResponse response= RestContext.response;
            Lead thisLead;
        try
        {
            thisLead = new Lead(FirstName=firstName,LastName=lastName,
                                    Email=email,Phone=phone,Company=company);
            insert thisLead;
            response.addHeader('Content-Type', 'application/json');
            String jsonResponse='{"isSuccess":"True","lead":"'+thisLead.id+'","Status":"Success"}';
            response.responseBody=blob.valueOf(jsonResponse); 
        
        }catch(DmlException e)
         {
            response.addHeader('Content-Type', 'application/json');
            String jsonResponse='{"isSuccess":"False","lead":"","Status":"'+e+'"}';
            response.responseBody=blob.valueOf(jsonResponse); 
         }
        
        
      }  

 

    @HttpDelete
    global static void deleteLead() {

        RestRequest request = RestContext.request;
        RestResponse response= RestContext.response;
        String firstName=request.params.get('FirstName');
        String lastName=request.params.get('LastName');

        String email=request.params.get('Email');
        String phone=request.params.get('Phone');

        String LeadId = request.requestURI.substring(

            request.requestURI.lastIndexOf('/')+1);
            
        try{
            
            List<Lead> thisLead = [SELECT Id,FirstName,LastName,Email,Phone FROM Lead 
                                   WHERE FirstName=:firstName 
                                   AND LastName=:lastName AND Email=:email 
                                   AND Phone=:phone];
                                    
             if(thisLead.size()>0)
              {
                 delete thisLead;
              }
            response.addHeader('Content-Type', 'application/json');
            String jsonResponse='{"isSuccess":"True","lead":"'+firstName+lastName+'","Status":"Success"}';
            response.responseBody=blob.valueOf(jsonResponse); 
              
        }
        catch(DmlException e)
        {
            response.addHeader('Content-Type', 'application/json');
            String jsonResponse='{"isSuccess":"False","lead":"","Status":"'+e+'"}';
            response.responseBody=blob.valueOf(jsonResponse);
        }
           
   } 
    
   @HttpPatch

    global static void updateLeadFields(String firstName, String lastName,

        String email, String phone,String company) {

        RestRequest request = RestContext.request;
        RestResponse response= RestContext.response;
        String LeadId = request.requestURI.substring(
                        request.requestURI.lastIndexOf('/')+1);
        List<Lead> thisLead;

        try
        {
            thisLead = [SELECT Id,FirstName,LastName,Company FROM Lead WHERE FirstName=:firstName AND LastName=:lastName];
            thisLead[0].Email=email;
            thisLead[0].Phone=phone;
        
            update thisLead;
        
            response.addHeader('Content-Type', 'application/json');
            String jsonResponse='{"isSuccess":"True","lead":"'+thisLead[0].id+'","Status":"Success"}';
            response.responseBody=blob.valueOf(jsonResponse); 
        
        }catch(DmlException e)
         {
            response.addHeader('Content-Type', 'application/json');
            String jsonResponse='{"isSuccess":"False","lead":"","Status":"'+e+'"}';
            response.responseBody=blob.valueOf(jsonResponse); 
         }
        
    }
       

    
}