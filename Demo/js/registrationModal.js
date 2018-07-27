
var check_first_blank_field = true;
var username_field = true;

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
	$(".message_username").hide();
	
	
	$("#first_name").focusout(function(){
  		check_first_name();
  	});

	$("#last_name").focusout(function(){
  		check_last_name();
  	});
	
	$(".gender").focusout(function(){
  		check_gender();
  	});
	
	$("#date_of_birth").focusout(function(){
  		check_date_of_birth();
  	});
	
	$("#email").focusout(function(){
  		check_email();
  	});
	
	$("#department").focusout(function(){
  		check_department();
  	});
	
	$("#job_title").focusout(function(){
  		check_job_title();
  	});
  	
  	$("#userType").focusout(function(){
  		check_userType();
  	});
  	

  	$("#username").focusout(function(){
  		check_username();
  	});
  	
		//when addEmployee button clicked
	 $("#regd_form").submit(function(){
	 	var form = validateForm();

	 	return form;
	 });
	 	
	 	

	 	
 	
	  	$("#username").keyup(function() {
	  		var username = $(this).val();
	 		$.ajax({
	 			 url:"/Demo/components/dao/employeeDao.cfc",
	 				 data: {
	 					method : "checkAvailability",
	 					username : username,
	 					 },
	 				 dataType: "json", 
	 				 type:"POST",
	 				success: function(response){
	 					if (response==true) {
	 						username_field = true;
	 						hideError("#message_username","#username");
	 					} else {
	 						username_field = false;
	 						printError("#message_username","error_username_invalid","#username",this.check_first_blank_field);
	 					}
	 				}
	 		});
	 	});
	  	
});	  	
	  	
	  	
	  	
	  	function validateForm(){

	  		this.check_first_blank_field = true;
	  		
	  		var first_name_flag = check_first_name();
	  		var last_name_flag = check_last_name();
	  		var gender_flag = check_gender();
	  		var date_of_birth_flag = check_date_of_birth();
	  		var email_flag = check_email();
	  		var department_flag = check_department();
	  		var job_title_flag = check_job_title();
	  		var userType_flag = check_userType();
	  		var username_flag = check_username();
	  		
	  		return first_name_flag && last_name_flag && gender_flag && date_of_birth_flag && email_flag && department_flag && 
	  		job_title_flag && userType_flag && username_flag ;
	  	           
	  	}
	  	
	  	function check_first_name(){
			 var first_name =  $("#first_name").val();

			 var flag = true;

			 if (first_name=="") {
				printError("#message_first_name","error_firstname","#first_name",this.check_first_blank_field);
				flag = false;
			}
			else if (!(first_name.length<=20 && first_name.length>=3)) {
				printError("#message_first_name","error_firstname_length","#first_name",this.check_first_blank_field);
				flag = false;
			}else{
				hideError("#message_first_name","#first_name");
			}

			return flag;

	}

	//validate function for LastName
	function check_last_name(){
			 var last_name =  $("#last_name").val();
			 var flag = true;

			if (last_name=="") {
				printError("#message_last_name","error_lastname","#last_name",this.check_first_blank_field);
				flag = false;
				
			}else if (!(last_name.length<=20 && last_name.length>=3)) {
				printError("#message_last_name","error_lastname_length","#last_name",this.check_first_blank_field);
				flag = false;
			}else{
				hideError("#message_last_name","#last_name");
			}

			return flag;

	}
		
		//validate function for Gender
	 function check_gender(){
	  		var gender = $('input[name="gender"]:checked');
	  		var flag = true;

	  		if (!gender.length) {
	  	        printError("#message_gender","error_gender","#male",this.check_first_blank_field);
	  			flag =  false;
	  		}else{
	  			hideError("#message_gender","#male");
	  		}

	  		return flag;
	 }
	 
	//validate function for DateOfBirth
		function check_date_of_birth(){
			var date_of_birth = $("#date_of_birth").val();
			var flag = true;

			if (date_of_birth=="") {
		        printError("#message_date_of_birth","error_date_of_birth","#date_of_birth",this.check_first_blank_field);
				flag =  false;
			}else{
				hideError("#message_date_of_birth","#date_of_birth");
			}

			return flag;
		}

		//validate function for Email
		function check_email(){
			var email = $("#email").val();
			var email_regx = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/g;
			var flag = true;

			if (email=="") {
				printError("#message_email","error_email","#email",this.check_first_blank_field);
				flag =  false;
				
			}else if (email_regx.test(email) == false){
		        printError("#message_email","error_email_validation","#email",this.check_first_blank_field);
				flag =  false;    
			}else{
				hideError("#message_email","#email");

			}

			return flag;
		}

		//validate function for Department
		function check_department(){
			var department = $("#department").val();
			var flag = true;

			if (department=="blank") {
				printError("#message_department","error_department","#department",this.check_first_blank_field);
				flag =  false;
				
			}else{
				hideError("#message_department","#department");
			}

			return flag;
		}

		//validate function for JobTitle
		function check_job_title(){
			var job_title = $("#job_title").val();
			var flag = true;

			if (job_title=="blank") {
				printError("#message_job_title","error_job_title","#job_title",this.check_first_blank_field);
				flag =  false;
			}else{
				hideError("#message_job_title","#job_title");
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


		//validate function for Username
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
		
		
		
		
