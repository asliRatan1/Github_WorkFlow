trigger Portal_Log_Tests on Account (after update) {
    
    
	List<Contact> conList = new List<Contact>();
    for(Account acc : trigger.new){
        Contact con = new Contact();
        con.FirstName = 'aman';
        con.LastName = 'tiwari';
        conList.add(con);
    }
    
    insert conList;
}