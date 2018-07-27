//Array of errors with key
var errors = {
	error_firstname : "Fill the first name field",
	error_firstname_length : "First name length between 3 to 20 character",
	error_middlename_length : "Middle name length not exceed  20 character",
	error_lastname : "Fill the last name field",
	error_lastname_length : "Last name length between 3 to 20 character",
	error_gender : "Select gender field",
	error_date_of_birth : "Enter date of birth",
	error_email : "Fill the email id field",
	error_email_validation : "Enter correct email id ex:abc@gmail.com",
	error_department : "Select the department field",
	error_job_title : "Select the job title field",
	error_userType : "Select UserType",
	error_username : "Fill the Username field",
	error_username_length : "Username length between 3 to 30 character",
	error_username_invalid : "Username exists"
};

$(document).ready(function() {

	
	$(".lettersOnly").keyup(function() {
		lettersOnly(this)
	});

	$("#regdBtn").click(function() {
		$("#registrationModal").modal('show');

	});

	$("#confirmYes").click(function() {
		console.log(id);
		$.ajax({
			url : "/Demo/components/dao/employeeDao.cfc",
			data : {
				method : "deactiveEmployee",
				employeeId : id,
			},
			dataType : "json",
			type : "POST",
			success : function(response) {
				if (response) {
					$("#deactivateEmployeeModal").modal('show');
				} else {

				}
			}
		});
	});

	$("#registrationSuccessModal").modal('show');
	$("#updateEmployeeModal").modal('show');

	$("#successModal").click(function() {
		window.location = "/Demo/view/adminDashboard.cfm";
	});
	
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
	
	/* $('#employeeTable tfoot th').each( function () {
	        var title = $(this).text();
	        $(this).html( '<input type="text" placeholder="Search '+title+'" />' );
	    } );*/
	
	    var table = $('#employeeTable').DataTable({
	    	"order": [[ 0, "desc" ]]
	    });
	 
	    /*table.columns().every( function () {
	        var that = this;
	 
	        $( 'input', this.footer() ).on( 'keyup change', function () {
	            if ( that.search() !== this.value ) {
	                that
	                    .search( this.value )
	                    .draw();
	            }
	        } );
	    } );
	    $('#employeeTable tbody')
        .on( 'mouseenter', 'td', function () {
            var colIdx = table.cell(this).index().column;
 
            $( table.cells().nodes() ).removeClass( 'highlight' );
            $( table.column( colIdx ).nodes() ).addClass( 'highlight' );
        } );
	    */
	    
	
});

function editEmployee(employeeId) {

			
			$.ajax({
				url : "/Demo/components/dao/employeeDao.cfc",
				data : {
					method : "getEmployeeById",
					employeeId : employeeId,
				},
				dataType : "json",
				type : "POST",
				success : function(response) {

					if (response) {
						$("#employeeId").html(
								"<span>EmployeeID:  </span>" + employeeId);
						$("#edit_employeeId").val(employeeId);
						$("#edit_first_name").val(response[0]);
						$("#edit_middle_name").val(response[1]);
						$("#edit_last_name").val(response[2]);
						if (response[3] == "Male") {
							$("#edit_male").prop("checked", true);
						} else {
							$("#edit_female").prop("checked", true);
						}
						var date = new Date(response[4]);
						var dd = date.getDate();
						var mm = date.getMonth() + 1;
						var yyyy = date.getFullYear();
						if (dd < 10) {
							dd = '0' + dd
						}
						if (mm < 10) {
							mm = '0' + mm
						}

						resDate = yyyy + '-' + mm + '-' + dd;
						$("#edit_date_of_birth").val(resDate);
						$("#edit_email").val(response[7]);
						$("#edit_department").val(response[6]);
						$("#edit_job_title").val(response[5]);
						$("#edit_userType").val(response[8]);

						$("#editEmployeeModal").modal('show');

					} else {

					}
				}
			});

}

function deactivateEmployee(employeeId) {
	id = employeeId;
	$("#confirmModal").modal('show');
}

// function to set max date of dateofbirth to today
function setMaxDate() {
	var today = new Date();
	var dd = today.getDate();
	var mm = today.getMonth() + 1;
	var yyyy = today.getFullYear();
	if (dd < 10) {
		dd = '0' + dd
	}
	if (mm < 10) {
		mm = '0' + mm
	}

	today = yyyy + '-' + mm + '-' + dd;
	$(".date_of_birth").attr("max", today);
}

function printError(id, msgid, fieldid, check_first_blank_field) {
	$(id).html(errors[msgid]);
	$(id).show();
	$(fieldid).css("border-bottom", "2px solid #F90A0A");

	if (check_first_blank_field) {
		$(fieldid).focus();
		this.check_first_blank_field = false;
	}

}

function hideError(msgid, fieldid) {
	$(msgid).hide();
	$(fieldid).css("border-bottom", "2px solid #34F458");

}

// function to allow only letters to a field
function lettersOnly(input) {

	var name_regex = /[^a-z]/gi;
	input.value = input.value.replace(name_regex, "");
}
function onlyNumberAndLetter(input) {

	var name_regex = /[^0-9a-z]/gi;
	input.value = input.value.replace(name_regex, "");

}
