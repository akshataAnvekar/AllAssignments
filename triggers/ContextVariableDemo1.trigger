trigger ContextVariableDemo1 on Contact (after update) {
	
	for(Contact c : Trigger.new)
	{
		System.debug(c);
	}
	for(Contact c : Trigger.old)
	{
		System.debug(c);
		System.debug('Trigger.old Executed' );
	}
	
	//Map <id,Contact> newrecords=new Map<id,Contact>();
	//for( Contact c: Trigger.newMap.keySet())
	//{
	//	System.debug(c);
	//}
	//for(Contact c : Trigger.oldMap)
	//{
	//	System.debug(c);
	//}
    
}