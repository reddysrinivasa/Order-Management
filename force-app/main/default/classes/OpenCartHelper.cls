public class OpenCartHelper {
 @AuraEnabled(cacheable=true)
    public static List<Cart__c> getAccountList() {
        return [SELECT  Name, CartId__c,Status__c
            FROM Cart__c where Status__c='Open,' limit 1];
    }
}