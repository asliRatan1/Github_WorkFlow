public class AccountBatchPractice implements Database.Batchable<sObject>{
    
    public Database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator([SELECT Id,name FROM Account Limit 1]);
    }
    
    public void execute(Database.BatchableContext bc, List<Account> accList){
        
    }
    
    public void finish(Database.BatchableContext bc){
        
    }

}