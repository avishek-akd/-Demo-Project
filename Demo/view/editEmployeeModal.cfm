
	<!--Employee Registration Modal  -->
	<div class="modal fade" id="editEmployeeModal" role="dialog">
	          <div class="modal-dialog">
	              <div class="modal-content">

	                  <div class="modal-header">
	                        <button type="button" class="close" data-dismiss="modal">&times;</button>
	                        <h4 class="form-title" id="employeeId"></h4>
	                  </div>

	                  <div class="modal-body" id="scrollabel">
	                    <span class="message_error">*</span>
	                    <span class="message_error">marked fields are mandatory</span><br><br>
	                        <form role="form" method="POST"  action="../controller/edit.cfm" name="edit_form" id="edit_form">

								  <input type="hidden" id="edit_employeeId" name="edit_employeeId" />
	                              <div class="form-group">
	                                  <label for="edit_first_name"><span class="glyphicon glyphicon-user"></span>  First Name</label>
	                                  <span class="message_error">*</span>
	                                  <input type="text" id="edit_first_name" class="form-control lettersOnly first_name" name="first_name" maxlength="20"placeholder="Enter Your First Name.." >
	                                  <span id="message_edit_first_name" class="message_error message_first_name"></span>
	                               </div>


	                              <div class="form-group">
	                                <label for="edit_middle_name"><span class="glyphicon glyphicon-user"></span>  Middle Name</label>
	                                <input type="text" id="edit_middle_name" class="form-control lettersOnly middle_name"  name="middle_name" maxlength="20" placeholder="Enter Your Middle Name..">
	                                <span id="message_edit_middle_name" class="message_error message_middle_name"></span>
	                              </div>


	                              <div class="form-group">
	                                <label for="edit_last_name"><span class="glyphicon glyphicon-user"></span>  Last Name</label><span class="message_error">*</span>
	                                <input type="text" id="edit_last_name" class="form-control lettersOnly last_name"  name="last_name" maxlength="20" placeholder="Enter Your Last Name..">
	                                <span id="message_edit_last_name" class="message_error message_last_name"></span>
	                              </div>


	                                <label for="edit_male"><span class="glyphicon glyphicon-user"></span>  Gender</label>
	                                <span class="message_error">*</span><br>
	                                  <label for="edit_male" class="radio-inline">
	                                    <input type="radio" id="edit_male"  name="edit_gender" class="gender" value="Male">
	                                  Male</label>
	                                  <label for="edit_female" class="radio-inline" >
	                                    <input type="radio" id="edit_female" name="edit_gender"  class="gender" value="Female">
	                                  Female</label>
	                                <br>
	                                <span id="message_edit_gender" class="message_error message_gender"></span><br>

	                              <div class="form-group">
	                               <label for="edit_date_of_birth"><span class="glyphicon glyphicon-calendar"></span>  Date Of Birth</label>
	                               <span class="message_error">*</span>
	                               <input type="date" id="edit_date_of_birth" class="form-control date_of_birth" name="date_of_birth" min="1900-01-01">
	                               <span id="message_edit_date_of_birth" class="message_error message_date_of_birth"></span>
	                              </div>

	                              <div class="form-group">
	                               <label for="edit_email"><span class="glyphicon glyphicon-envelope"></span>  Email Id</label>
	                               <span class="message_error">*</span>
	                               <input type="text" id="edit_email" maxlength="40" class="form-control email" name="email" placeholder="Enter Your Email.." >
	                               <span id="message_edit_email" class="message_error message_email"></span>
	                              </div>

	                              <div class="form-group">
	                               <label for="edit_department"><span class="glyphicon glyphicon-briefcase"></span>  Department</label>
	                               <span class="message_error">*</span>
	                               <select id="edit_department" class="form-control department" name="department" >
	                                  <option value="blank">------------Select Department------------</option>
	                                  <option value="Marketing">Marketing</option>
	                                  <option value="Human Resources">Human Resources</option>
	                                  <option value="Finance">Finance</option>
	                                  <option value="Research and Development">Research and Development</option>
	                                  <option value="Production">Production</option>
	                               </select>
	                               <span id="message_edit_department" class="message_error message_department"></span>
	                              </div>

	                              <div class="form-group">
	                               <label for="edit_job_title"><span class="glyphicon glyphicon-briefcase"></span>  Job Title</label>
	                               <span class="message_error">*</span>
	                               <select id="edit_job_title" class="form-control job_title" name="job_title" >
	                                  <option value="blank">------------Select Job Title------------</option>
	                                  <option value="Design Engineer">Design Engineer</option>
	                                  <option value="Marketing Manager">Marketing Manager</option>
	                                  <option value="Software Engineer">Software Engineer</option>
	                                  <option value="Delivery Manager">Delivery Manager</option>
	                                  <option value="Tool Designer">Tool Designer</option>
	                               </select>
	                               <span id="message_edit_job_title" class="message_error message_job_title"></span>
	                              </div>


	                              <div class="form-group">
	                               <label for="edit_userType"><span class="glyphicon glyphicon-user"></span>  UserType</label>
	                               <span class="message_error">*</span>
	                               <select id="edit_userType" class="form-control userType" name="userType" >
	                                  <option value="blank">------------Select User------------</option>
	                                  <option value="Employee">Employee</option>
	                                  <option value="Admin">Admin</option>
	                               </select>
	                               <span id="message_edit_userType" class="message_error message_userType"></span>
	                              </div>



	                              <input type="submit" class="btn btn-success pull-right" name="updateEmployee" id="updateEmployee" value="Update"/>


	                        </form>
	                  </div>


	                  <div class="modal-footer">
	                    <button type="submit" class="btn btn-default btn-danger pull-right" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> Cancel</button>
	                  </div>
	              </div>

	          </div>
	      </div>
	  </div>
