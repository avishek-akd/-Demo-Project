

var check_first_blank_field = true;

$(document).ready(function(){
	
	setMaxDate();	
	
	//Hide all the error message initially
	$(".message_first_name").hide();
	$(".message_middle_name").hide();
	$(".message_last_name").hide();
	$(".message_gender").hide();
	$(".message_date_of_birth").hide();
	$(".message_email").hide();
	$(".message_department").hide();
	$(".message_job_title").hide();
	$(".message_userType").hide();
	
	
	
	$("#edit_first_name").focusout(function(){
  		check_edit_first_name();
  	});

	$("#edit_last_name").focusout(function(){
  		check_edit_last_name();
  	});
	
	$(".gender").focusout(function(){
  		check_edit_gender();
  	});
	
	$("#edit_date_of_birth").focusout(function(){
  		check_edit_date_of_birth();
  	});
	
	$("#edit_email").focusout(function(){
  		check_edit_email();
  	});
	
	$("#edit_department").focusout(function(){
  		check_edit_department();
  	});
	
	$("#edit_job_title").focusout(function(){
  		check_edit_job_title();
  	});
  	
  	$("#edit_userType").focusout(function(){
  		check_edit_userType();
  	});
  	
	
	
	
	$("#edit_form").submit(function(){
 		var form = validateUpdateForm();

 		return form;
 	});
		
});


function validateUpdateForm(){

		this.check_first_blank_field = true;
		
		var first_name_flag = check_edit_first_name();
		var last_name_flag = check_edit_last_name();
		var gender_flag = check_edit_gender();
		var date_of_birth_flag = check_edit_date_of_birth();
		var email_flag = check_edit_email();
		var department_flag = check_edit_department();
		var job_title_flag = check_edit_job_title();
		var userType_flag = check_edit_userType();
	
		
		return first_name_flag && last_name_flag && gender_flag && date_of_birth_flag && email_flag && department_flag && 
		job_title_flag && userType_flag;           
}

function check_edit_first_name(){
	 var first_name =  $("#edit_first_name").val();

	 var flag = true;

	 if (first_name=="") {
		printError("#message_edit_first_name","error_firstname","#edit_first_name",this.check_first_blank_field);
		flag = false;
	}
	else if (!(first_name.length<=20 && first_name.length>=3)) {
		printError("#message_edit_first_name","error_firstname_length","#edit_first_name",this.check_first_blank_field);
		flag = false;
	}else{
		hideError("#message_edit_first_name","#edit_first_name");
	}

	return flag;

}

//validate function for LastName
function check_edit_last_name(){
	 var last_name =  $("#edit_last_name").val();
	 var flag = true;

	if (last_name=="") {
		printError("#message_edit_last_name","error_lastname","#edit_last_name",this.check_first_blank_field);
		flag = false;
		
	}else if (!(last_name.length<=20 && last_name.length>=3)) {
		printError("#message_edit_last_name","error_lastname_length","#edit_last_name",this.check_first_blank_field);
		flag = false;
	}else{
		hideError("#message_edit_last_name","#edit_last_name");
	}

	return flag;

}

//validate function for Gender
function check_edit_gender(){
		var gender = $('input[name="edit_gender"]:checked');
		var flag = true;

		if (!gender.length) {
	        printError("#message_edit_gender","error_gender","#edit_male",this.check_first_blank_field);
			flag =  false;
		}else{
			hideError("#message_edit_gender","#edit_male");
		}

		return flag;
}

//validate function for DateOfBirth
function check_edit_date_of_birth(){
	var date_of_birth = $("#edit_date_of_birth").val();
	var flag = true;

	if (date_of_birth=="") {
       printError("#message_edit_date_of_birth","error_date_of_birth","#edit_date_of_birth",this.check_first_blank_field);
		flag =  false;
	}else{
		hideError("#message_edit_date_of_birth","#edit_date_of_birth");
	}

	return flag;
}

//validate function for Email
function check_edit_email(){
	var email = $("#edit_email").val();
	var email_regx = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/g;
	var flag = true;

	if (email=="") {
		printError("#message_edit_email","error_email","#edit_email",this.check_first_blank_field);
		flag =  false;
		
	}else if (email_regx.test(email) == false){
       printError("#message_edit_email","error_email_validation","#edit_email",this.check_first_blank_field);
		flag =  false;    
	}else{
		hideError("#message_edit_email","#edit_email");

	}

	return flag;
}

//validate function for Department
function check_edit_department(){
	var department = $("#edit_department").val();
	var flag = true;

	if (department=="blank") {
		printError("#message_edit_department","error_department","#edit_department",this.check_first_blank_field);
		flag =  false;
		
	}else{
		hideError("#message_edit_department","#edit_department");
	}

	return flag;
}

//validate function for JobTitle
function check_edit_job_title(){
	var job_title = $("#edit_job_title").val();
	var flag = true;

	if (job_title=="blank") {
		printError("#message_edit_job_title","error_job_title","#edit_job_title",this.check_first_blank_field);
		flag =  false;
	}else{
		hideError("#message_edit_job_title","#edit_job_title");
	}

	return flag;
}


function check_edit_userType(){
	 var userType =  $("#edit_userType").val();

	 var flag = true;

	 if (userType=="blank") {
			printError("#message_edit_userType","error_userType","#edit_userType",this.check_first_blank_field);
			flag =  false;
	 }else{
			hideError("#message_edit_userType","#edit_userType");
	 }


	return flag;

}




