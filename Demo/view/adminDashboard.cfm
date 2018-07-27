
<cfif structKeyExists(session,'stLoggedInUser')>
	<cfif session.stLoggedInUser.role EQ "Admin">
	

<!DOCTYPE html>
<html>

<head>

  <title>Dashboard</title>
  
  <link rel="icon" href="images/tittleicon.jpg">

  <meta charset="UTF-8">
  <meta name="description" content="Official website of CET,Bhubaneswar">
  <meta name="keywords" content="website,design,bhubaneswar,website designing">
  <meta name="author" content="Avishek Das">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">


  <link rel="stylesheet" href="../css/adminDashboard.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
  <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
  <link href="//cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css" rel="stylesheet">
  
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.17.0/jquery.validate.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.17.0/additional-methods.js"></script>
  

</head>



<body>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="adminDashboard.cfm">Mindfire Solutions</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
        <li><a  id="regdBtn" style="cursor: pointer;"><span class="glyphicon glyphicon-user" "></span> Add Employee</a></li>
        <li>
        	<a class="dropdown-toggle" data-toggle="dropdown" style="cursor: pointer;"><cfoutput>#session.stLoggedInUser.userName#</cfoutput><span class="caret"></span></a>
        	 <ul class="dropdown-menu">
           	 	<li><a id="logout" style="cursor: pointer;">Logout</a></li>
          	</ul>
        </li>
      </ul>
    </div>
</nav>
  <div class="" style="margin:10px">
  	<!--Showing All Employee in a table  -->
  	<cfset employeeDetails = application.employeeDao.getAllEmployee()>
  	
  	<div class="table-responsive">
  	 	<table class=" table stripe hover nowrap tableWidth compact cell-border " cellspacing="0" id="employeeTable">
  	 	
  	 		<thead class="thead-dark">
				<tr class="table-info info">
					<th>Employee Id</th>
					<th>Name</th>
					<th>Gender</th>
					<th>DateOfBirth</th>
					<th>JobTitle</th>
					<th>DepartMent</th>
					<th>Email</th>
					<th>Username</th>
					<th>UserType</th>
					<th>Active Status</th>
					<th>
						<a class="btn btn-sm btn-info" ><span class="glyphicon glyphicon-trash"></span>Deactive</a>
						<a class="btn btn-sm btn-info "><span class="glyphicon glyphicon-pencil">Edit</span></a>
					</th>
				</tr>
			</thead>

		<tbody>
			<cfoutput query="employeeDetails">
			
			<cfif ActiveStatus EQ 1>
				<tr class="success">
			<cfelse>
				<tr class="danger">
			</cfif>
					<td>#EmployeeID#</td>
					<td>#FullName#</td>
					<td>#Gender#</td>
					<td>#dateFormat(DateOfBirth,"dd-mmm-yyyy")#</td>
					<td>#JobTitle#</td>
					<td>#Department#</td>
					<td>#Email#</td>
					<td>#Username#</td>
					<td>#UserType#</td>
					<cfif ActiveStatus EQ 1>
						<td><p class="">Yes</p></td>
						<td><a class="btn btn-sm btn-danger" onClick="deactivateEmployee(#EmployeeID#);"><span class="glyphicon glyphicon-trash">Deactive</span></a>
							<a class="btn btn-sm btn-warning" onClick="editEmployee(#EmployeeID#);" ><span class="glyphicon glyphicon-pencil"></span>Edit</a>
						</td>
					<cfelse>
						<td><p class="">No</p></td>
						<td>
							<a class="btn btn-sm btn-success" ><span class="glyphicon glyphicon-trash"></span></a>
							<a class="btn btn-sm btn-success "><span class="glyphicon glyphicon-pencil"></span></a>
						</td>
					</cfif>
				</tr>
			</cfoutput>
			<tfoot class="thead-dark">
				<tr class="table-info info">
					<th>Id</th>
					<th>Name</th>
					<th>Gender</th>
					<th>DOB</th>
					<th>JobTitle</th>
					<th>Dept.</th>
					<th>Email</th>
					<th>Username</th>
					<th>Type</th>
					<th>status</th>
					<th>action</th>
				</tr>
			</tfoot>
		</tbody>
	  </table>
  	</div>
  	
  	
  	<!--Include Employee Registration Modal  -->
    <cfinclude template="registrationModal.cfm">
    
    <cfif isDefined("url.registration")>
	    <cfif #url.registration# EQ 'success'>
		    <cfinclude template="registrationSuccessModal.cfm">
	    </cfif>
    </cfif>
    
    <cfif isDefined("url.edit")>
	    <cfif #url.edit# EQ 'success'>
		    <cfinclude template="updateEmployeeModal.cfm">
	    </cfif>
    </cfif>
    
    
		   
	<cfinclude template="deactivateEmployeeModal.cfm">
	<cfinclude template="confirmModal.cfm"> 
	<cfinclude template="editEmployeeModal.cfm">
 
      
	</div>
</body>
	<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src="//cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
	
	<script src="../js/adminDashboard.js"></script>
	<script src="../js/registrationModal.js"></script>
	<script src="../js/editEmployeeModal.js"></script>
	
</html>
	<cfelse>
		<cflocation url="/Demo/view/employee.cfm">
	</cfif>
<cfelse>
<cflocation url="/Demo/view/index.cfm">
</cfif>
