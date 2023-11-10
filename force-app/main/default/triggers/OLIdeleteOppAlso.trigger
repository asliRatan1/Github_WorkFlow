trigger OLIdeleteOppAlso on OpportunityLineItem (after delete) {
    
    
    List<Opportunity> oppList = new List<Opportunity>();
    
    set<Id> oilId = new set<Id>();
    
    for(OpportunityLineItem oil : trigger.old){
        if(oil.OpportunityId !=NULL){
            oilId.add(oil.OpportunityId);
        }
    }
    oppList = [SELECT Id FROM Opportunity WHERE Id in :oilId];
    
    delete oppList;
    
}