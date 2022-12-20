trigger cartitem on Cart_Item__c (after update) 
{
    set<id>cartlineid=new set<id>();
    set<id>cartid=new set<id>();
    // for(Cart_Item__c ciold:trigger.old){
    for(Cart_Item__c ciold:trigger.old){
    for(Cart_Item__c ci:trigger.new ){
        
            if(ciold.Buytestfield__c != ci.Buytestfield__c && ci.Buytestfield__c==true) { 
                cartlineid.add(ci.Id);
                cartid.add(ci.Cart__c);
            }
        }
    }
    
    
    list<Cart__c>cart=[select Customer__c,Customer__r.account.id from Cart__c where id in:cartid];
    list<Order__c> orderlist=new list<Order__c>(); 
    for(cart__c ct:cart){
        Order__c ordernw= new Order__c();
        ordernw.AccountName__c=ct.Customer__r.account.id;
        ordernw.Customer__c=ct.Customer__c;
        ordernw.Status__c='Open';
        orderlist.add(ordernw);
    }
    insert orderlist;
    
    list<Cart_Item__c>cartitemlist=[select id,Cart__r.Customer__r.id,UnitPrice__c,Quantity__c,Product__c from Cart_Item__c where id in:cartlineid];
    list<Order_Line_Item__c>listofneworderlineitems=new list<Order_Line_Item__c>();
    for(Order__c od:orderlist){
        for(Cart_Item__c cartlist:cartitemlist){
            Order_Line_Item__c orderrr= new Order_Line_Item__c();
            //orderr.=cartlist.Cart__r.Customer__r.id;
            orderrr.Order_Cust__c=od.id;
            orderrr.UnitPrice__c=cartlist.UnitPrice__c;
            orderrr.Quantity__c=cartlist.Quantity__c;
            orderrr.Product__c=cartlist.Product__c;
            listofneworderlineitems.add(orderrr);
        }
    }
    insert listofneworderlineitems;
    delete cartitemlist; 
    
}