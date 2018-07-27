
$(document).ready(function() {

	
	
	$("#logout").click(function() {
		
		$.ajax({
			url : "/Demo/components/dao/loginDao.cfc",
			data : {
				method : "userLogout",
			},
			dataType : "json",
			type : "POST",
			success : function(response) {
				
				if(response){
					window.location = "/Demo/view/index.cfm";
				}else{
					alert("dd");
				}
			}
				
					
			});

	});
	
});
	
	