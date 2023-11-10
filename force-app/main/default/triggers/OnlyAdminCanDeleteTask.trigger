trigger OnlyAdminCanDeleteTask on Task (before delete) {

 
    Id profileId = UserInfo.getProfileId();
    
    
    Id sysAdminProfileId = [SELECT Id FROM Profile WHERE Name = 'System Administrator'].Id;
    
    
    if (profileId != sysAdminProfileId) {
        
        for (Task t : Trigger.old) {
            t.addError('Only System Administrators can delete tasks.');
        }
    }
    
}