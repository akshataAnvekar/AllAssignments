public class CheckPrimeNumber
{
    public static void primeCheck(Integer num)
    {
        Integer notprime=0,i;
        for(i=2;i<num;i++)
        {
            if(math.mod(num,i)==0)
                notprime++;
        }
        if(notprime > 0)
            System.debug('Number is Not a prime number');
        else
            System.debug('Number is prime');
    }   
    
}