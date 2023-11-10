trigger BillingAddressPopulateIntoShippingAddress on Account (before insert,before update) {
	// jai shree ram
	
    for(Account acc :trigger.new){
        acc.ShippingStreet = acc.BillingStreet;
        acc.ShippingCity = acc.BillingCity;
        acc.ShippingState = acc.BillingState;
        acc.ShippingPostalCode = acc.BillingPostalCode;
        acc.ShippingCountry = acc.BillingCountry;
    }
}