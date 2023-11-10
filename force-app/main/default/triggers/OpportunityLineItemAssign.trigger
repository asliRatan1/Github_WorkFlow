trigger OpportunityLineItemAssign on Opportunity (after insert) {
    
    
    
    List<OpportunityLineItem>  oppLineItem = new List<OpportunityLineItem>();
    
    for(Opportunity opp : trigger.new){
        OpportunityLineItem oil  =  new OpportunityLineItem();
        oil.OpportunityId = opp.id;
        oil.Quantity = 1;
        oil.PricebookEntryId  = '01u2w000006sEzxAAE';
        oil.TotalPrice = 100000;
        oppLineItem.add(oil);
    }
    insert oppLineItem;

    
}