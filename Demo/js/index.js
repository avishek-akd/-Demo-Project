//Array of errors with key
var errors = {
		error_username:"Fill the Username field",
		error_username_length:"length between 3 to 30 character",
		error_username_invalid:"Username not exists",
		error_password:"Fill the password  field",
		error_password_length:"length  8 to 16 character",
		error_password_validation:"a lowercase letter, a uppercase letter, a numeric number and a special character",
		error_password_correct:"Enter Correct password",
		error_userType:"Select UserType"
	}

var check_first_blank_field = true;
var username_field = true;


$(document).ready(function(){
	
	
	$("#password").focusout(function(){
  		check_password();
  	});
	
	
	$("#userType").focusout(function(){
  		check_userType();
  	});
	
	$("#username").focusout(function() {
		var flag = check_username();
  		var username = $(this).val();
 		$.ajax({
 			 url:"/Demo/components/dao/loginDao.cfc",
 				 data: {
 					method : "checkUserAvailability",
 					username : username,
 					 },
 				 dataType: "json", 
 				 type:"POST",
 				success: function(response){
 					if (response) {
 						username_field = true;
 						hideError("#message_username","#username");
 					} else {
 						username_field = false;
 						printError("#message_username","error_username_invalid","#username",this.check_first_blank_field);
 						
 						
 					}
 				}
 		});
 	});
	
	
	 $("#loginForm").submit(function(e){
		 e.preventDefault();
		 var form = validateForm();
		 if (form) {
			 authenticationUser();
			
		}else{
			return form;
		}
		 
	 });
	 
	
	 
	 
	
	 
  	
	
	
});

function authenticationUser(){

	var username = $('#username').val();
	var password = $('#password').val();
	var type = $('#userType').val();
	$.ajax({
			 url:"/Demo/components/dao/loginDao.cfc",
			 data: {
					method : "authenticateUser",
					username : username,
					password : password,
					type : type,
					 },
				 dataType: "json", 
				 type:"POST",
				success: function(response){
					console.log(response);
					if (response=="Admin" && type=="Admin" ) {
							window.location = "/Demo/view/adminDashboard.cfm";
					}else if(response=="Admin" && type=="Employee")  {
							window.location = "/Demo/view/employee.cfm";
					}else if(response=="Employee" && type=="Employee") {
						window.location = "/Demo/view/employee.cfm";	
					}else{
						$("#invalidLoginModal").modal('show');
					}
				}
		});     
}

function validateForm(){

		this.check_first_blank_field = true;
		
		var username_flag = check_username();
		var password_flag = check_password();
		var userType_flag = check_userType();
		
		
		return username_flag && password_flag && userType_flag;
	           
	}

function check_username(){
	 var username =  $("#username").val();

	 var flag = true;

	 if (username=="") {
		printError("#message_username","error_username","#username",this.check_first_blank_field);
		flag = false;
	}
	else if (!(username.length<=20 && username.length>=3)) {
		printError("#message_username","error_username_length","#username",this.check_first_blank_field);
		flag = false;
	}else if (username_field==false) {
		printError("#message_username","error_username_invalid","#username",this.check_first_blank_field);
		flag = false;
	}else{
		hideError("#message_username","#username");
	}

	return flag;

}

function check_password(){
	var password = $("#password").val();
	var password_regx = /^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\$%\^&\*])(?=.{8,16})/g;
	var flag = true;

	if (password=="") {
		printError("#message_password","error_password","#password",this.check_first_blank_field);
		flag =  false;
		
	}else if (!(password.length>=8 && password.length<=16)){
        printError("#message_password","error_password_length","#password",this.check_first_blank_field);
		flag =  false;    
	}else if (password_regx.test(password) == false){
        printError("#message_password","error_password_validation","#password",this.check_first_blank_field);
		flag =  false;      
	}else{
		hideError("#message_password","#password");
	}

	return flag;
}

function check_userType(){
	 var userType =  $("#userType").val();

	 var flag = true;

	 if (userType=="blank") {
			printError("#message_userType","error_userType","#userType",this.check_first_blank_field);
			flag =  false;
	 }else{
			hideError("#message_userType","#userType");
	 }


	return flag;

}











	function printError(id,msgid,fieldid,check_first_blank_field){
		$(id).html(errors[msgid]);
		$(id).show();
		$(fieldid).css("border-bottom", "2px solid #F90A0A");

		if (check_first_blank_field) {
			$(fieldid).focus();
			this.check_first_blank_field = false;
		}
		
	}

	function hideError(msgid,fieldid){
		$(msgid).hide();
		$(fieldid).css("border-bottom", "2px solid #34F458");
		
	}
