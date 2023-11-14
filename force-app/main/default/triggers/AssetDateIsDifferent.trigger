trigger AssetDateIsDifferent on Asset (after insert, after update) {
    
    Set<Id> setId = new Set<Id>();
    
    for(Asset ass : trigger.new){
        if(ass.AccountId !=Null){
            setId.add(ass.AccountId);
        }
    }
        
    List<Account> accList = [SELECT Id, Asset_Minimum_Expiration_Date__c, (SELECT UsageEndDate FROM Assets) FROM Account WHERE Id in : setId];
    List<Account> accUpdate = new List<Account>();
    for(Account acc : accList){
        Date minDate = null;
        
        for(Asset ass : acc.Assets)
        {
            if(minDate == Null || acc.Asset_Minimum_Expiration_Date__c != ass.UsageEndDate){
                minDate = ass.UsageEndDate;
            }
        }
        
        acc.Asset_Minimum_Expiration_Date__c = minDate;


        
        accUpdate.add(acc);
    }
    
    
    update accUpdate;
    
    
}