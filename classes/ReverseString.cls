public with sharing class ReverseString {
    
 public void rString(){
  String original= 'abcdef';
        String revStr = ' ';

        for (Integer i = original.length()-1; i >= 0; i--)
        {
            revStr= revStr+original.substring(i, i+1);
        }
        system.debug(revStr );
 }
}