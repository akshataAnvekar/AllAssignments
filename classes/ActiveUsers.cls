public with sharing class ActiveUsers {
    
    public static void getActiveUsers()
    {
    	List<User> userList=new List<User>([select id,IsActive,Address,Email,Alias from User where IsActive=true]);
    	Map<id,User> usermap=new Map<id,User>();
    	
    	for(User u:userList)
    	{
    		usermap.put(u.id,u);
    		
    	}
    	
    	
    	System.debug(usermap);
    }
    
}