public class FindUniqueNumbers 
{
	
	public static void searchUnique(Integer[] arrayofnumbers)
	{
		List<Integer> convertedarray=new List<Integer>();
		for(Integer i = 0;i < arrayofnumbers.size();i++)
		{
			convertedarray.add(arrayofnumbers[i]);
		}
		
		Set<Integer> uniquearray=new Set<Integer>();
		uniquearray.addAll(convertedarray);
		
		for(Integer l : uniquearray)
		{
			System.debug(l);
		}
	}
    
}