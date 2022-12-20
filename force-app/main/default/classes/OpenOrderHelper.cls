public class OpenOrderHelper {
@AuraEnabled(cacheable=true)
    public static List<Order__c> getOrderList() {
        return [SELECT  Name, ShippingAddress__c,Status__c,AmountPaid__c
            FROM Order__c where Status__c='Open' limit 1 ];
    }
}