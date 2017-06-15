public class CountStringLength 
{
	public static void countLength(String sample)
	{
		Integer length=0;
		String[] arr=sample.split('');
		
			for(Integer index=0;index < arr.size();index++)
				{
						length++;
				}
		
		System.debug('Length of string is'+length);
	
	}
    
}