trigger NewAsseOIL on OpportunityLineItem (after insert, after update) {
    
	List<Asset> assList = new List<Asset>();
    for(OpportunityLineItem oil : Trigger.new){
        if(oil.Opportunity.AccountId != null){
        Asset ass = new Asset();
        ass.Name = 'CHal gaya';
        ass.AccountId = oil.Opportunity.AccountId;
        ass.Product2Id = oil.Product2Id;
        
        assList.add(ass);
        }
        
    }
        insert assList;

}