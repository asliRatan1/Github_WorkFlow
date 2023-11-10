trigger UpdateAllContactMailingCity on Account (after update) {
    
     Set<Id> setId = new Set<Id>();
     
    for(Account acc : trigger.new){
        Account oldAccount = trigger.oldMap.get(acc.Id);
        if(acc.BillingCity != oldAccount.BillingCity){
            setId.add(acc.Id);
        }
    }
    
    // query for contact mailing city
    
    List<Contact> conList = [SELECT Id, Account.BillingCity FROM Contact WHERE Account.ID in :setId];
    
    for(Contact con : conList){
        con.MailingCity  = con.Account.BillingCity;
    }
    
    update conList;
    
}