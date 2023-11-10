trigger ClientContactofAccountName on Account (after insert) {

    List<Contact> conList = new List<Contact>();
    
    for(Account acc : trigger.new){
        
        Contact con  = new Contact();
        
        con.AccountId = acc.Id;
        
        con.FirstName = 'Client';
        con.LastName = acc.Name;
        
        conList.add(con);
    }
    database.insert(conList);
    
    List<Account> accUpdate = new List<Account>();
    
    for(Contact con :conList){
        Account acc = new Account();
        acc.Id = con.AccountId;
        acc.Client_Contact__c = con.Id;
        accUpdate.add(acc);
    }
    
    update accUpdate;
    
    
    
    
    
    // client contact of account 
    
    /*List<Account> accList = new List<Account>();
    for(Account acc : trigger.new){
        List<Contact> conDetail = [SELECT Id FROM Contact WHERE Account.ID = :acc.Id LIMIT 1];
        acc.Client_Contact__c = conDetail.Id;
        
        accList.add(acc);
    }
    
    update accList;*/
    
    
}