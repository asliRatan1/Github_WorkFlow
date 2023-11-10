trigger PreventDuplicateContact on Contact (before insert) {
    // Create sets to store unique email and phone values
    Set<String> emailSet = new Set<String>();
    Set<String> phoneSet = new Set<String>();
    
    
    for (Contact con : Trigger.new) {
        emailSet.add(con.Email);
        phoneSet.add(con.Phone);
    }
    List<Contact> conEmail = new List<Contact>();
    List<Contact> conPhone = new List<Contact>();
    
    conEmail = [SELECT Email From Contact Where Email in :emailSet];
    conPhone = [SELECT Phone From Contact Where Phone in :PhoneSet];
    
    for(Contact con : trigger.new){
            if(conEmail.size() >0){
            con.Email.adderror('Duplicate Email Found');
            }
        
            if(conPhone.size() >0){
            con.Phone.adderror('Duplicate Phone Found');
            }
            
    }
    
    
       
}