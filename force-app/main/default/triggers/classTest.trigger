trigger classTest on Account (after insert, before delete) {
   
    if(trigger.isInsert){
        
    List<Opportunity> oppList = new List<Opportunity>();
    
        for(Account acc : trigger.new){
            Opportunity opp = new Opportunity();
            opp.Name = 'Class Test1';
            opp.AccountId = acc.Id;
            opp.CloseDate = Date.today();
            opp.StageName = 'Prospecting';
            
            oppList.add(opp);
            Opportunity opp1 = new Opportunity();
            opp1.Name = 'Class Test2';
            opp1.AccountId = acc.Id;
            opp1.CloseDate = Date.today();
            opp1.StageName = 'Prospecting';
            oppList.add(opp1);
        }
        
        
        insert oppList;
    }
    if(trigger.isDelete){
        
        
        
        Set<Id> accId =  new Set<Id>();
        
        for(Account acc: trigger.new){
            if(acc.Id != null){
                accId.add(acc.Id);
            }
        }
        
        List<Opportunity> oppList = [SELECT AccountId, Id FROM Opportunity WHERE AccountId in :accId];
        
        
        for(Account acc : trigger.new){
            if(oppList.size() > 0){
                acc.adderror('Opportunity is avilable..');
            }
        }
        
    }
}