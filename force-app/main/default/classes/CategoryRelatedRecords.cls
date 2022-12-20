public with sharing class CategoryRelatedRecords 
{
    @AuraEnabled(cacheable=true)
    public static List<Categories__c> getCateRecords() 
    {
       
         List<Categories__c> parencategoryobj=[Select Id, Name from Categories__c];
        
        return parencategoryobj;
    }
}
        
       /* @AuraEnabled(cacheable=true)
     public static List<Categories__c> getproductcatrecords(string procatId)
     {
        List<Categories__c> categoryobj;
        if(
            Categories__c.SObjectType.getDescribe().isAccessible() &&
            Schema.SObjectType.Categories__c.fields.Name.isAccessible() && 
            Schema.SObjectType.Categories__c.fields.ParentCategory__c.isAccessible() )
            {
                categoryobj=[Select Id, Name, ParentCategory__c from Categories__c where ParentCategory__c=:procatId];
                for(Categories__c catpro:categoryobj)
                {
                    categoryobj.add(catpro);
                }
            }
            return categoryobj;
        }

             
     @AuraEnabled(cacheable=true)
     public static List<Product_Categories__c> getproduct(string proId)
     {
        List<Product_Categories__c> producateobj;
        if(
            Product_Categories__c.SObjectType.getDescribe().isAccessible() &&
            Schema.SObjectType.Product_Categories__c.fields.Name.isAccessible() && 
            Schema.SObjectType.Product_Categories__c.fields.Category__c.isAccessible() )
            {
                producateobj=[Select Id, Name, Category__c from Product_Categories__c where Category__c=:proId];

                for(Product_Categories__c producatgory:producateobj)
                {
                    producateobj.add(producatgory);  
                }
            }
            return producateobj;
        }
    }*/