({
	handleClick : function(cmp, event, helper) {
        var action = cmp.get('c.saveAcc');
        action.setParams({
            type : cmp.get('v.options')
        });
		
        action.setCallback(this,function(response){
            var state = response.getState();
            var result = response.getReturnValue();
            
            if(state == "SUCCESS"){
                alert(result);
            }
            else{
                alert(result);
            }
            
        });
        
        
	}
})