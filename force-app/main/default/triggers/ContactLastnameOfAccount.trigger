trigger ContactLastnameOfAccount on Contact (after insert,after update) {
    
    if (trigger.isInsert)
{
    Set<Id> accountIds = new Set<Id>();

    // Collect the Account Ids associated with the updated or inserted Contacts
    for (Contact contact : Trigger.new)
    {
        accountIds.add(contact.AccountId);
    }

    // Retrieve the latest LastName for each Account
    Map<Id, Contact> latestContacts = new Map<Id, Contact>();
    for (Contact con : [ SELECT Id, LastName, AccountId FROM Contact WHERE AccountId IN:accountIds
                         ORDER BY LastModifiedDate DESC LIMIT 1 ])
    {
        latestContacts.put(con.AccountId, con);
    }

    // Update the Account Names with the latest Contact LastName
    List<Account> accUpadte = new List<Account>();
    for (Account acc : [ SELECT Id, Name
                                        FROM Account
                                            WHERE Id IN:accountIds ])
    {
        if (latestContacts.containsKey(acc.Id))
        {
            Contact latestContact = latestContacts.get(acc.Id);
            acc.Name = acc.Name + ' ' + latestContact.LastName;
            accUpadte.add(acc);
        }
    }

    // Perform the update operation
    if (!accUpadte.isEmpty())
    {
        update accUpadte;
    }
}
}