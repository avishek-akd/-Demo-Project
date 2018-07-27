
<cfif structKeyExists(session,'stLoggedInUser')>
	<cfif session.stLoggedInUser.role EQ "Admin">
		<cflocation url="/Demo/view/adminDashboard.cfm">
	<cfelse>
		<cflocation url="/Demo/view/employee.cfm">
	</cfif>
<cfelse>

<html>
	<head>
		<title>
			Login
		</title>
		<link rel="stylesheet" type="text/css" href="../css/index.css">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
		<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
		<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.17.0/jquery.validate.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.17.0/additional-methods.js"></script>
		<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
		<script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
		<script src="https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<body>
		<div class="loginbox">
			<img src="../images/tittleicon.jpg" class="avatar">
			<form method="post" id="loginForm" role="form">
				<div class="form-group">
					<label for="username">
						<span class="glyphicon glyphicon-user">
						</span>
						UserName
					</label>
					<input type="text"  id="username" class="form-control"   name="username" maxlength="30" placeholder="Enter Your User Name.." />
					<span id="message_username" class="message_error">
					</span>
				</div>
				<div class="form-group">
					<label for="password">
						<span class="glyphicon glyphicon-lock">
						</span>
						Password
					</label>
					<input type="password"  id="password" class="form-control"  name="password" maxlength="30" placeholder="Enter Your Password.." />
					<span id="message_password" class="message_error">
					</span>
				</div>
				<div class="form-group">
					<label for="userType">
						<span class="glyphicon glyphicon-user">
						</span>
						UserType
					</label>
					<select id="userType" name="userType" class="form-control" >
						<option value="blank">
							------------Select User------------
						</option>
						<option value="Employee">
							Employee
						</option>
						<option value="Admin">
							Admin
						</option>
					</select>
					<span id="message_userType" class="message_error">
					</span>
				</div>
				<br>
				<input type="submit" name="login" value="Login" class="form-control">
				<br>
				<a href="#">
					Lost your password?
				</a>
			</form>
		</div>
		<cfinclude template="invalidLoginModal.cfm">
	</body>
	<script src="../js/index.js"></script>
	</head>
</html>
</cfif>
