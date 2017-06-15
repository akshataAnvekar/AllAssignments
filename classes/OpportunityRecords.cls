public class OpportunityRecords {
    
    public static void getOpportunityRecord()
    {
        List<Opportunity> opportunities=new List<Opportunity>([select id,Amount from Opportunity where Amount > 10000]);
        System.debug('opportunities');
    }
    

}