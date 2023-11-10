trigger CreateOppOpplineInAccount on Asset (after insert) {
    
    Set<Id> accId = new Set<Id>();
    for(Asset ass : trigger.new){
        if(ass.AccountId !=NULL){
            accId.add(ass.AccountId);
        }
    }    
    
    List<Account> accList = [SELECT Id FROM Account WHERE Id in : accId];
    List<Opportunity> oppList = new  List<Opportunity>();
    List<OpportunityLineItem> oilList = new  List<OpportunityLineItem>();
    for(Account acc : accList){
      Opportunity opp = new Opportunity();
        opp.AccountId = acc.Id;
        opp.Name = 'Opp Test';
        opp.CloseDate = Date.today();
        opp.StageName = 'Prospecting';
        opp.Amount = 10000;
        oppList.add(opp);
    }
    insert oppList;
    System.debug('insertion complete');
    
}