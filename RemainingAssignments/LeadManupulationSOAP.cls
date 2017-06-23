global class LeadManupulationSOAP 
{
    global class Response
    {
        webService Boolean isSuccess;
        webService Id lead;
        webService String status;
    }
    
    
      webService static Response createLead(String firstName, String lastName,

                                    String email, String phone,String company) 
      {
            
        try
        {
            Lead thisLead;
            thisLead = new Lead(FirstName=firstName,LastName=lastName,
                                    Email=email,Phone=phone,Company=company);
            insert thisLead;
            
            Response res=new Response();
            res.isSuccess=true;
            res.lead=thisLead.id;
            res.status='Success';
            return res;
        
        }catch(DmlException e)
         {
            Response res=new Response();
            res.isSuccess=false;
            //res.lead=null;
            res.status=e.getMessage();
            return res;
             
         }
        
        
      }  
    
    webService static Response deleteLead(String firstName, String lastName,

                                    String email, String phone) {

    try{
            
            List<Lead> thisLead = [SELECT Id,FirstName,LastName,Email,Phone FROM Lead 
                                   WHERE FirstName=:firstName 
                                   AND LastName=:lastName AND Email=:email 
                                   AND Phone=:phone];
                                    
            if(thisLead.size()>0)
            {
                delete thisLead[0];
            }
             
            Response res=new Response();
            res.isSuccess=true;
            res.lead=thisLead[0].id;
            res.status='Success';
            return res;
            
              
        }
        catch(DmlException e)
        {
            Response res=new Response();
            res.isSuccess=false;
            res.lead=null;
            res.status=e.getMessage();
            return res;
            
        }
           
   }
   
   webService static Response updateLeadFields(String firstName, String lastName,

        String email, String phone,String company) {

        List<Lead> thisLead;

        try
        {
            thisLead = [SELECT Id,FirstName,LastName,Company 
                        FROM Lead WHERE FirstName=:firstName 
                        AND LastName=:lastName];
                        
            thisLead[0].Email=email;
            thisLead[0].Phone=phone;
        
            update thisLead;
            
            Response res=new Response();
            res.isSuccess=true;
            res.lead=thisLead[0].id;
            res.status='Success';
            return res;
         
        }catch(DmlException e)
         {
            Response res=new Response();
            res.isSuccess=false;
            res.lead=null;
            res.status=e.getMessage();
            return res; 
         }
        
    } 
    
    
}