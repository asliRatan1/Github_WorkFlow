trigger MultiValuePiclistOppAccount on Opportunity (after insert, after update) {
    
    
    Set<Id> accId = new Set<Id>();
    
    for(Opportunity opp : trigger.new){
        if(opp.AccountId != NULL){
            accId.add(opp.AccountId);
        }
    }
    
    List<Opportunity> oppList = [SELECT Id, AccountId, Trigger_Value__c FROM Opportunity WHERE AccountId in :accId];
    List<Account> accList = new List<Account>();
    
    for(Opportunity opp : oppList){
        Account acc = new Account();
        acc.Id = opp.AccountId;
        acc.Trigger_Account__c = opp.Trigger_Value__c;
        accList.add(acc);
    }
    
    update accList;
}