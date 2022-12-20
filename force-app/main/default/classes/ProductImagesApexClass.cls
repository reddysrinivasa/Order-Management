public with sharing class ProductImagesApexClass {
@AuraEnabled(cacheable=true)
public static List<Product_Image__c> getProductsImages(String searchKey){ 
    if(searchKey !=''){
        String key='%'+searchKey+'%';
        List<Product_Image__c> pcList1 = [SELECT Id,Product__r.Name,Product__r.Id,Product__r.RemainingQuantity__c,Product__r.Description,Product__c,HeroImage__c,Name,ResourceURL__c,Resource__c FROM Product_Image__c WHERE ResourceURL__c !='' AND Product__r.Name LIKE:key ]; 
        return pcList1;
    }
    else
    {
        List<Product_Image__c> pcList2 = [SELECT Id,Product__r.Name,Product__r.Id,Product__r.RemainingQuantity__c,Product__r.Description,Product__c,HeroImage__c,Name,ResourceURL__c,Resource__c FROM Product_Image__c WHERE ResourceURL__c !='' ]; 
        if(!pcList2.isEmpty()){
        return pcList2;
        }                       
        return NULL;
        } 
    }

    @auraEnabled(cacheable=true) 
    public static List<Product_Image__c> getProductDetail(){ 
        List<Product_Image__c> pcList = [SELECT Id,Product__r.Name,Product__r.Id,URL__c,Product__c,Resource__c,ResourceURL__c FROM Product_Image__c WHERE Id='a0r1e00000153ZaAAI' ];                   
        return pcList; 
   } 

   @AuraEnabled(cacheable=true) 
	public static string getItems(String cartId){
        List<Cart_Item__c> items = [SELECT Id, Name, Product__c, Cart__c,Quantity__c, UnitPrice__c,TotalAmount__c,Product__r.Name FROM Cart_Item__c WHERE Cart__c =: cartId];
        return JSON.serialize(items);
    }
    public Static Map<Id, Cart_Item__c> getCartItems(String cartId){
        Map<Id, Cart_Item__c> cartItemsMap = new Map<Id, Cart_Item__c>();
        for ( Cart_Item__c cart :[SELECT Id, Name, Product__c, Cart__c,Quantity__c, UnitPrice__c,TotalAmount__c,Product__r.Name FROM Cart_Item__c WHERE Cart__c =: cartId]) {
            cartItemsMap.put(cart.Product__c, cart);
        }
        return cartItemsMap;
    }

    
   public static String generateCardId(){
    String CharList = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789_';
    Integer position;
    Integer LengthRequired = 30;
    String Res = '';
    for(Integer i = 0; i <= LengthRequired; i++) {
        position = Integer.valueof(String.valueof(Math.roundToLong(CharList.length()*Math.random()))) -1;
        Res += CharList.substring(position,position+1);
    }
    return Res;
}

   //Create Cart
    /*@AuraEnabled(cacheable=false)
    public static string getCartId(){
    List<Cart__c> cartInfo = [SELECT Id, Name,User__c FROM Cart__c WHERE User__c =: UserInfo.getUserId() AND Status__c= 'Open'];
    if (cartInfo != null && cartInfo.size() > 0) {
        return cartInfo.get(0).Id;              
    } else { 
        Cart__c defaultCart = new Cart__c();
        //Coupon__c coupon = getCouponInformation('Default');
        defaultCart.CartId__c = generateCardId();
        defaultCart.Status__c = 'Open';
        //defaultCart.User__c = UserInfo.getUserId();
        insert defaultCart;
       system.debug('id : '+defaultCart.Id);
        return defaultCart.Id;
    }                        
}*/

public class CartWrapper {
    @AuraEnabled
    public String CartId                { get; set; }
    @AuraEnabled
    public Decimal Count                { get; set; }
    @AuraEnabled
    public List<Cart_Item__c> items     { get; set; }
}

@AuraEnabled
public static string createCartItems(String CartId, String ProductId, Decimal Amount,Integer Quantity){
    Cart_Item__c item = new Cart_Item__c();
    Map<Id, Cart_Item__c> cartItemsMap = getCartItems(CartId);
    if ( cartItemsMap.containsKey(ProductId) ) {
        item = cartItemsMap.get(ProductId);
        item.Quantity__c = item.Quantity__c + 1;
        update item;
    } else {
        item.Product__c = ProductId;
        item.Cart__c = CartId;
        item.Quantity__c = Quantity ;
        item.UnitPrice__c = Amount;
        item.Amount__c = Amount;
        insert item;
    }
    return item.Id;
 }

}