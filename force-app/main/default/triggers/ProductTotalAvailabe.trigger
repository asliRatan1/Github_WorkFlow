trigger ProductTotalAvailabe on OpportunityLineItem (after insert) {    
    Set<Id> proId = new Set<Id>();
    
    for(OpportunityLineItem oil : trigger.new){
        if(oil.Product2Id != null){
            proId.add(oil.Product2Id);
        }
    }
    
    List<OpportunityLineItem> oilList = [SELECT Id, Product2Id, Quantity, product2.Total_Quantity__c, Product2.Name
                                         FROM OpportunityLineItem 
                                         WHERE Product2Id in :proId];
    
    List<Product2> proUpdate = new List<Product2>();
    
    for(OpportunityLineItem oil :oilList){
        Product2 pro = new Product2();
        
        pro.Id = oil.Product2Id;
        pro.Total_Quantity__c -= oil.Quantity;
        proUpdate.add(pro);
    }
    
    update proUpdate;
    
}