trigger OLIAssignNewQOUTE on OpportunityLineItem (after insert) {
    
    List<Quote> qoUpdate = new List<Quote>();
        
    for(OpportunityLineItem oil : trigger.new){
        Quote qo = new Quote();
        qo.OpportunityId = oil.OpportunityId;
        qo.Name = 'TEST SUCCESSFULL';
        qoUpdate.add(qo);
    }
    
    insert qoUpdate;
}