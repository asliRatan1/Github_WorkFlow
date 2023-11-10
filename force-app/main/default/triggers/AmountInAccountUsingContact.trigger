trigger AmountInAccountUsingContact on Contact (after Update) {
		
    set<Id> accId = new set<Id>();
    
    for(contact con : trigger.new){
        if(con.AccountId != null){
            accId.add(con.AccountId);
        }
    }
    
   List<Opportunity> oppList = [SELECT  Id, contactId, AccountId, Amount from Opportunity WHERE AccountId in :accId];
    List<Account> accList = new List<Account>();
    for(Opportunity opp : oppList){
        Account acc =  new Account();
        acc.Id = opp.AccountId;
        acc.Total_Amount_From_Opp_using_Contact__c = opp.Amount;
        accList.add(acc);
    }
    update  accList;    
}