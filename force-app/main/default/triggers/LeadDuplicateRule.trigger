trigger LeadDuplicateRule on Lead (before insert) {
    
    Set<String> setEmail = new Set<String>();
    Set<String> setPhone = new Set<String>();
    for(Lead le : trigger.new){
        setEmail.add(le.Email);
        setPhone.add(le.Phone);
    }
    
    List<Lead> leadEmail = new List<Lead>();
    List<Lead> leadPhone = new List<Lead>();
    leadEmail = [SELECT Email from Lead WHERE Email in :setEmail];
    leadPhone = [SELECT Phone from Lead WHERE Phone in :setPhone];
    
    for(Lead le : trigger.new){
        if(leadEmail.size() >0){
            Le.Email.adderror('Email already Registered.');
        }
        if(leadPhone.size() >0){
            Le.Phone.adderror('Phone already Registered.');
        }
    }
    
}