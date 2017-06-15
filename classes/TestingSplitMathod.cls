public with sharing class TestingSplitMathod {
	
	public static void testSplit()
	{
		String s='akshata@gmail.com';
		String[] split=s.split('@');
		System.debug(split[1]);
	}
    
}