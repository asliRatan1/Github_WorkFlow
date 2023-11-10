trigger UpdateTotalAmountInAccounts on Opportunity ( after insert, after update) {
    // Jai shree Ram
    
    Set<Id> accId = new Set<Id>();
    
    for(Opportunity opp : trigger.new){
        if(opp.AccountId != Null){
            accId.add(opp.AccountId);
        }
    }
    
    List<Account>  accList =  [SELECT Id, Total_Opportunity_Amount__c, (SELECT id, Amount, AccountId FROM Opportunities ) FROM Account WHERE Id in: accId];  
    List<Opportunity> oppList = [SELECT Amount, id, account.ID, account.Total_Opportunity_Amount__c FROM Opportunity WHERE ID in :accId];
   
    
    
    List<Account> accUpdate = new List<Account>();
    
    for(Account acc : accList){
        Decimal temp = 0;
        for(Opportunity opp : acc.Opportunities){
            if(opp.AccountId == acc.Id){
                temp = temp + opp.Amount;
            }
        }
        accUpdate.add( new Account(Id = acc.Id , Total_Opportunity_Amount__c = temp));
                
    }
    
    update accUpdate;
}