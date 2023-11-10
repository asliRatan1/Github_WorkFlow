trigger UpdateOpportunityStage on Account (after update) {
    Set<Id> setId = new Set<Id>();
    
    for(Account acc :trigger.new){
        setId.add(acc.Id);
    }

    List<Opportunity> opp = [SELECT Id, CreatedDate, StageName FROM Opportunity WHERE AccountID in :setId];
    
    Date thirtyDateAgo = Date.Today().addDays(-30);
    List<Opportunity> oppToUpdate = new list<Opportunity>();
    
    for(Opportunity o :opp){
        if( o.CreatedDate<= thirtyDateAgo   && o.StageName != 'Close Won'){
             o.StageName = 'Close Lost';
             oppToUpdate.add(o);
        }
    }
    
    update oppToUpdate;
}