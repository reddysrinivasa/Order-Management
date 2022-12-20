public class allProd {

    @AuraEnabled(cacheable=true)
  public static List<Product_Image__c> getProducts() {
  return [select Url__c, ResourceURL__c, Id,Product__c, Product__r.Name, 
            Product__r.RemainingQuantity__c ,
            Product__r.TotalQuantity__c from Product_Image__c];
  }
}