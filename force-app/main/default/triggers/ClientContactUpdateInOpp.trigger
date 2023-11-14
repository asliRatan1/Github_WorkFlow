trigger ClientContactUpdateInOpp on Opportunity (after update) {
    
    set<Id> oppId = new set<Id>();
    
    for(Opportunity opp : trigger.new){
        if(opp.Id != null){
            oppId.add(opp.Id);
        }
    }
    List<Opportunity> oppList = [SELECT Id, Client_Contact__c, AccountId FROM Opportunity WHERE Id in :oppId];
    List<Account> accList =  new List<Account>();

    for(Opportunity opp : oppList){
        Account acc =  new Account();
        acc.Id = opp.AccountId;
        acc.Client_Contact__c = opp.Client_Contact__c;
        accList.add(acc);
    }
    
    update accList;
    
}