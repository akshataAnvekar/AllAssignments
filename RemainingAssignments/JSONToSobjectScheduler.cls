global class JSONToSobjectScheduler implements Schedulable 
{
    global void execute(SchedulableContext sc)
    {
        JSONToSobject obj = new JSONToSobject();
        Database.executeBatch(obj);
    }   
    
}
