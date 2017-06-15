public with sharing class CreateTaskOnAccountHandler {
    
    public static void createTask(List<Account> accountList)
    {	
    	List<Task> newTask = new List<Task>();
    	for(Account acc : accountList)
    	{
    		Task tk = new Task();
 			tk.WhatID = acc.Id;
 			tk.Priority = 'Normal';
 			tk.Status = 'Not Started';
 			tk.Subject = 'Meeting With '+acc.Name;
 			newTask.add(tk);
    	}
    	
 		try
 		{
 			insert newTask;
 		
 		}catch(Exception e)
 		{
 			System.debug('Error Occured '+e.getMessage());
 		}  
    }
}