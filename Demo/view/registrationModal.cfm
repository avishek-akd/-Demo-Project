
	<!--Employee Registration Modal  -->
	<div class="modal fade" id="registrationModal" role="dialog">
	          <div class="modal-dialog">
	              <div class="modal-content">

	                  <div class="modal-header">
	                        <button type="button" class="close" data-dismiss="modal">&times;</button>
	                        <h4 class="form-title">Add  Employee</h4>
	                  </div>

	                  <div class="modal-body" id="scrollabel">
	                    <span class="message_error">*</span>
	                    <span class="message_error">marked fields are mandatory</span><br><br>
	                        <form role="form" method="POST"  action="../controller/registration.cfm" name="regd_form" id="regd_form">

	                              <div class="form-group">
	                                  <label for="first_name"><span class="glyphicon glyphicon-user"></span>  First Name</label>
	                                  <span class="message_error">*</span>
	                                  <input type="text" id="first_name" class="form-control lettersOnly first_name" name="first_name" maxlength="20"placeholder="Enter Your First Name.." >
	                                  <span id="message_first_name" class="message_error message_first_name"></span>
	                               </div>


	                              <div class="form-group">
	                                <label for="middle_name"><span class="glyphicon glyphicon-user"></span>  Middle Name</label>
	                                <input type="text" id="middle_name" class="form-control lettersOnly middle_name"  name="middle_name" maxlength="20" placeholder="Enter Your Middle Name..">
	                                <span id="message_middle_name" class="message_error message_middle_name"></span>
	                              </div>


	                              <div class="form-group">
	                                <label for="last_name"><span class="glyphicon glyphicon-user "></span>  Last Name</label><span class="message_error">*</span>
	                                <input type="text" id="last_name" class="form-control lettersOnly last_name" name="last_name" maxlength="20" placeholder="Enter Your Last Name..">
	                                <span id="message_last_name" class="message_error message_last_name"></span>
	                              </div>


	                                <label for="male"><span class="glyphicon glyphicon-user"></span>  Gender</label>
	                                <span class="message_error">*</span><br>
	                                  <label for="male" class="radio-inline">
	                                    <input type="radio" id="male"  name="gender" class="gender" value="Male">
	                                  Male</label>
	                                  <label for="female" class="radio-inline" >
	                                    <input type="radio" id="female" name="gender"  class="gender" value="Female">
	                                  Female</label>
	                                <br>
	                                <span id="message_gender" class="message_error message_gender"></span><br>

	                              <div class="form-group">
	                               <label for="date_of_birth"><span class="glyphicon glyphicon-calendar "></span>  Date Of Birth</label>
	                               <span class="message_error">*</span>
	                               <input type="date" id="date_of_birth" class="form-control date_of_birth" name="date_of_birth" min="1900-01-01">
	                               <span id="message_date_of_birth" class="message_error message_date_of_birth"></span>
	                              </div>

	                              <div class="form-group">
	                               <label for="email"><span class="glyphicon glyphicon-envelope "></span>  Email Id</label>
	                               <span class="message_error">*</span>
	                               <input type="text" id="email" maxlength="40" class="form-control email" name="email" placeholder="Enter Your Email.." >
	                               <span id="message_email" class="message_error message_email"></span>
	                              </div>

	                              <div class="form-group">
	                               <label for="department"><span class="glyphicon glyphicon-briefcase"></span>  Department</label>
	                               <span class="message_error">*</span>
	                               <select id="department" class="form-control department" name="department" >
	                                  <option value="blank">------------Select Department------------</option>
	                                  <option value="Marketing">Marketing</option>
	                                  <option value="Human Resources">Human Resources</option>
	                                  <option value="Finance">Finance</option>
	                                  <option value="Research and Development">Research and Development</option>
	                                  <option value="Production">Production</option>
	                               </select>
	                               <span id="message_department" class="message_error message_department"></span>
	                              </div>

	                              <div class="form-group">
	                               <label for="job_title"><span class="glyphicon glyphicon-briefcase"></span>  Job Title</label>
	                               <span class="message_error">*</span>
	                               <select id="job_title" class="form-control job_title" name="job_title" >
	                                  <option value="blank">------------Select Job Title------------</option>
	                                  <option value="Design Engineer">Design Engineer</option>
	                                  <option value="Marketing Manager">Marketing Manager</option>
	                                  <option value="Software Engineer">Software Engineer</option>
	                                  <option value="Delivery Manager">Delivery Manager</option>
	                                  <option value="Tool Designer">Tool Designer</option>
	                               </select>
	                               <span id="message_job_title" class="message_error message_job_title"></span>
	                              </div>


	                              <div class="form-group">
	                               <label for="userType"><span class="glyphicon glyphicon-user"></span>  UserType</label>
	                               <span class="message_error">*</span>
	                               <select id="userType" class="form-control userType" name="userType" >
	                                  <option value="blank">------------Select User------------</option>
	                                  <option value="Employee">Employee</option>
	                                  <option value="Admin">Admin</option>
	                               </select>
	                               <span id="message_userType" class="message_error message_userType"></span>
	                              </div>


	                              <div class="form-group">
	                                  <label for="username"><span class="glyphicon glyphicon-user"></span>  UserName</label>
	                                  <span class="message_error">*</span>
	                                  <input type="text" class="form-control" id="username" class="username lettersOnly" maxlength="30" name="username" maxlength="20"placeholder="Enter Your User Name.." >
	                                  <span id="message_username" class="message_error"></span>
	                              </div>


								   <input type="reset" class="btn btn-warning pull-left" name="reset" id="reset" value="Reset"/>
	                              <input type="submit" class="btn btn-success pull-right" name="addEmployee" id="addEmployee" value="Add Employee"/>


	                        </form>
	                  </div>


	                  <div class="modal-footer">
	                    <button type="submit" class="btn btn-default btn-danger pull-right" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> Cancel</button>
	                  </div>
	              </div>

	          </div>
	      </div>
	  </div>
