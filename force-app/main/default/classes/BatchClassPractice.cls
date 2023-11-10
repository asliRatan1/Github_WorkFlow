public class BatchClassPractice implements Database.Batchable<sObject>{
    
    public Database.QueryLocator start(Database.BatchableContext BC){
        
        String query = 'SELECT Id FROM Account';
        return Database.getQueryLocator(query);
    }
    
    
    public void execute(Database.BatchableContext BC, List<Account> scope){
        List<Contact> conList = new List<Contact>();
        for (Account acc : scope) {
            for (Integer i = 0; i < 5; i++) {
                Contact con = new Contact();
                con.FirstName = 'Contact';
                con.LastName = 'Name ' + i;
                con.AccountId = acc.Id;
                conList.add(con);
            }
        }
    delete conList;
    }
    

    
    
    public void finish(Database.BatchableContext BC){
                
    }
    

}