trigger TotalOLIitems on OpportunityLineItem(after insert)
{

    set<Id> accId = new set<Id>();

    for (OpportunityLineItem oil : trigger.new)
    {
        if (oil.OpportunityId != NULL)
        {
            accId.add(oil.OpportunityId);
        }
    }

    List<Opportunity> oppList = [ SELECT Id, AccountId, (SELECT Quantity FROM OpportunityLineItems)FROM Opportunity WHERE Id in :accId ];
    List<Account> oppToUpdate = new List<Account>();

    for(Opportunity opp : oppList)
    {
        Decimal sum = 0;
        for (OpportunityLineItem oil : opp.OpportunityLineItems)
        {
            sum += oil.Quantity;
        }
        Account acc = new Account();
        acc.Id = opp.AccountId;
        acc.Total_sales_quantities__c = sum;
        oppToUpdate.add(acc);
    }
    update oppToUpdate;
}