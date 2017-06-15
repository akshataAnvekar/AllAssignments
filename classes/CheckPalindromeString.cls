public class CheckPalindromeString 
{
	
	public  static void checkPalindrome(String teststring)
	{
		String copystring = teststring.reverse();
		
			if(copystring.equals(teststring))
			
				System.debug('String is palindrome');
			else
				System.debug('String is not palindrome');
	}
    
}