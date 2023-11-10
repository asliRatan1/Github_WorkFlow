trigger ProductFamily on OpportunityLineItem (before insert) {
    
    
    Set<Id> oppId = new Set<Id>();
    
    for(OpportunityLineItem oil : trigger.new){
        if(oil.OpportunityId != NULL){
            oppId.add(oil.OpportunityId);
        }
    }

    
    
    List<OpportunityLineItem> oilList = [SELECT OpportunityId, Opportunity.Product_type__c, Product2.Family FROM OpportunityLineItem WHERE OpportunityId IN :oppId];
    
    for(OpportunityLineItem oil :oilList){
        if(oil.Opportunity.Product_type__c != oil.Product2.Family){
            oil.adderror('Values are not equal...');
        }
    }
    
    

}