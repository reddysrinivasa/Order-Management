trigger ProOfferTrigger on Product_Offer__c (after insert) {
    
     /*set<id> ids = new set<id>();
     id etid;
    string mail  = 'yy@gmail.com';
    map<id, blob> picMap = new  map<id, Product_Image__c>();
    for(EmailTemplate et : [Select Id,Subject,Description,
                                 HtmlValue,DeveloperName,Body
                                 from EmailTemplate where name =
                            'Test Account Alert Email']){
                                etid = et.id;
                            }
    for(Product_Offer__c poc1 : trigger.new){
        
    ids.add(poc1.product__c);
    }
    for(Product_Image__c pic : [select id, heroImage__c, Product_Image__c.Product__C from Product_Image__c where Product_Image__c.Product__C in: ids]){
        picMap.put(pic.Product__C, pic.url__);
        
    }
    for(Product_Offer__c poc : trigger.new){
    Messaging.SingleEmailMessage message = new        
        Messaging.SingleEmailMessage();
    message.setTargetObjectId(poc.id);
    
    
    //Get templete id for set the templete.
    message.fileattachments = picMap.get(poc.Product__c).url__c;
    message.setTemplateID(etid);
        message.toAddresses = new String[] {mail};
            
            Messaging.SingleEmailMessage[] messages = new   
            List<Messaging.SingleEmailMessage> {message};
                
                Messaging.SendEmailResult[] results =
                Messaging.sendEmail(messages);
    }
    for()
    
    if (results[0].success)
    {
        System.debug(‘The email was sent successfully.’);
    }
    else
    {
        System.debug(‘The email failed to send: ‘ +
                     results[0].errors[0].message);
    }*/
}