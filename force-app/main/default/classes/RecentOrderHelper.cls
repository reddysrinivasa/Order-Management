public class RecentOrderHelper {

@AuraEnabled(cacheable=true)
    public static List<Order__c> getOrderList() {
        return [SELECT  Name, ShippingAddress__c,Status__c
            FROM Order__c where CreatedDate < THIS_MONTH  limit 5 ];
    }
}