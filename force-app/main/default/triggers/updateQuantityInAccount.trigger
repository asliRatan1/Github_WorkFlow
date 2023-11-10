trigger updateQuantityInAccount on OpportunityLineItem (after insert, after update) {
    
    Set<Id> setId = new Set<Id>();
        
    List<OpportunityLineItem> OilList = [SELECT Opportunity.AccountId FROM OpportunityLineItem WHERE OpportunityId !=NULL];
    
    for(OpportunityLineItem oil : OilList ){
        if(oil.Opportunity.AccountId != NULL ){
            setId.add(oil.Opportunity.AccountId);
        }
    }
    
    
    List<OpportunityLineItem> OilList2 = [SELECT Quantity FROM OpportunityLineItem WHERE Opportunity.AccountId in :setId];
    
    List<Account> accList = [SELECT Id, Total_sales_quantities__c FROM Account WHERE Id in :setId];
    
    
    for(Account acc : accList){
        acc.Total_sales_quantities__c  = 0;
        Decimal temp =0;
        for(OpportunityLineItem oil : oilList2){
            temp  = oil.quantity;
        }
        acc.Total_sales_quantities__c = temp;
    }
    update accList;
}