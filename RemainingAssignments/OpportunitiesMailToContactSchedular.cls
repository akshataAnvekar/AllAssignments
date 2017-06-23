global class OpportunitiesMailToContactSchedular implements Schedulable
{
    global void execute(SchedulableContext sc)
    {
        OpportunitiesMailToContact obj = new OpportunitiesMailToContact();
        Database.executeBatch(obj);
    }
    
}