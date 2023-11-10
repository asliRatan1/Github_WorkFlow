public class ShowContactDetails {
	
	// Properties
    @AuraEnabled public string FirstName{get;set;}
    @AuraEnabled public string LastName{get;set;}
    @AuraEnabled public string Email{get;set;}
    
    
    @AuraEnabled
    public static ShowContactDetails getData(){
        ShowContactDetails obj = new ShowContactDetails();
        obj.FirstName = 'A.R';
        obj.lastName = 'Tiwari';
        obj.Email = 'anmolratantiwari98@gmail.com';
        return obj;        
    }
	
    
    
    @AuraEnabled
    public static boolean saveCon(string fstName, string lstName,
                                string eml){
                                    Contact con = new Contact();
                                    con.Firstname = fstName;
                                    con.Lastname = lstName;
                                    con.Email = eml;
                                    
                                    try{
                                        insert con;
                                        return true;
                                    }catch(exception ex){
                                        return false;                                        
                                    }
    }
    @AuraEnabled
    public static Contact RecordIdMethod(Id ConId){
        Contact con = [SELECT FirstName, LastName, Email FROM Contact WHERE Id = :ConId];
        return con;
        
    }
    
}