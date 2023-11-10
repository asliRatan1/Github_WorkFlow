({
    doInit : function(cmp, event, helper) {
        
       var recordId = cmp.get('v.recordId');
        
        var action = cmp.get('c.RecordIdMethod');
        action.setParams({
            ConId : recordId,
        });
        action.setCallback(this, function(response){
            var state = response.getState();
            
            if(state == 'SUCCESS'){
                var result = response.getReturnValue();    
                cmp.set('v.conName', result);
            }
        });
        $A.enqueueAction(action);
    }
	
})
  /*  saveContact : function(cmp,event,helper){
        var action = cmp.get('c.saveCon');
        action.setParams({ 
            fstName : cmp.get('v.Fname'),
           	lstName : cmp.get('v.Lname'),
            eml : cmp.get('v.Ename'),
        })
        action.setCallback(this,function(response){
            var result = response.getReturnValue();
            alert(result);
        });
        $A.enqueueAction(action);
    }*/