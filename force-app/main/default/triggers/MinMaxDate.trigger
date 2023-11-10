trigger MinMaxDate on Opportunity (after insert, after update) {
    
    
    Set<Id> accId = new Set<Id>();
    
    for(Opportunity opp : trigger.new){
        if(opp.AccountId != NULL){
            accId.add(opp.AccountId);
        }
    }
    
    
    List<Account> accList = [SELECT Id, Maximum_Date__c, Minimum_Date__c
                             ,(SELECT Id, Minimum_Date__c, Maximum_Date__c FROM Opportunities)
                             FROM Account WHERE Id in : accId];
    
    
    List<Account> accUpdate = new List<Account>();
        
        
    for(Account acc : accList){
        Date mini = null;
        Date maxi = null;
        
        for(Opportunity opp : acc.Opportunities){
            if(opp.Minimum_Date__c < acc.Minimum_Date__c){
                mini = opp.Minimum_Date__c;
            }
            else{
                mini = acc.Minimum_Date__c;
            }
            
            if(opp.Maximum_Date__c > acc.Maximum_Date__c){
                maxi = opp.Maximum_Date__c;
            }
            else{
                maxi = acc.Maximum_Date__c;
            }
        }
        
        Account a = new Account();
        a.Id = acc.Id;
        a.Minimum_Date__c = mini;
        a.Maximum_Date__c = maxi;
        accUpdate.add(a);
    }

    update accUpdate;
}