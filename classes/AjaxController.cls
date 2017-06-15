public class AjaxController {
    public Integer firstNumber {get;set;}
    public Integer secondNumber {get;set;}
    
    public Integer addition {get;set;}
    public Integer substraction {get;set;}
    public Integer multiplication {get;set;}
    public Integer division {get;set;}
    
    public Boolean isShow {get;set;}
    
    public Contact c {get;set;}
    
    public AjaxController() {
        isShow = false;
    }
    
    public void debug() {
        System.debug('Text-' + secondNumber);
    }
    
    public void calculate() {
        addition = firstNumber + secondNumber;
        substraction = firstNumber - secondNumber;
        multiplication = firstNumber * secondNumber;
        if (secondNumber != 0) {
            division = firstNumber / secondNumber;
            isShow = true;
        } else {
            isShow = false;
        }
    }
    
    @RemoteAction
    public static String concat(Integer num1, Integer num2) {
        return '' + num1 + num2;
    }
}