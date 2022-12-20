public with sharing class Categoryclass 
{
    @AuraEnabled(cacheable=true)
    Public static List<Categories__c> getparentcategory()
    {
        Return [SELECT Name FROM Categories__c];
    }
    
    @AuraEnabled(cacheable=true)
    Public static List<Categories__c> getCategory(string parentid)
    {
       return [SELECT Name, ParentCategory__c FROM Categories__c where ParentCategory__c=:parentid];
    }
    
    @AuraEnabled(cacheable=true)
    Public static List<Product_Categories__c> getProductCategory(string catid)
    {
        return [SELECT Category__c, Product__r.Name FROM Product_Categories__c where Category__c=:catid];
    } 
}