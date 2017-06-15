global class RemoveDuplicateLeadsScheduler implements Schedulable{
    
        global void execute(SchedulableContext ctx)
        {
            RemoveDuplicateLeads leads = new RemoveDuplicateLeads();
            Database.executeBatch(leads);
        }

  }