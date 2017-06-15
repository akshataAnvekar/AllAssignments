public with sharing class Savings extends Account 
{
	 public override Double withdraw(Integer amount)
    {
    	if(balance>1000)
    	{
        balance=balance-amount;
        return balance;
    	}
    	else
    	return 0;
    }
	
	
    
}