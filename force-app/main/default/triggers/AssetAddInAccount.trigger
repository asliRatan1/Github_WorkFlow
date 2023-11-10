trigger AssetAddInAccount on Account (after insert) {
        
    List<Asset> assList = new List<Asset>();
    
    
    
    for(Account acc : trigger.new){
        Asset ass = new Asset();
        
        ass.AccountId = acc.Id;
        ass.Name = 'Test Successfull';
        
        assList.add(ass);
         
    }

    insert assList;
    
    
    
    
}