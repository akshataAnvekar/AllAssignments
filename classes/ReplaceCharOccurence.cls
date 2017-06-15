public class ReplaceCharOccurence 
{
	public static void replaceCharacter(String replacement,String[] arrayofstring)
	{
		for(Integer index=0;index < arrayofstring.size();index++)
		{
			String replacedstring=arrayofstring[index].replace('a',replacement);
			System.debug(replacedstring);
		}
		
	}
	
    
}