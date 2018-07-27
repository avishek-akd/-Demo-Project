
	<cfif structKeyExists(form,"updateEmployee")>
	  <cftry>
		<!--calling the addEmployee() to add employee   -->
		<cfset rsDetails = application.employeeDao.editEmployee(#form#)/>
		<cfif rsDetails>
			<cflocation url="/Demo/view/adminDashboard.cfm?edit=success">

		<cfelse>
			<cflocation url="/Demo/view/adminDashboard.cfm">
		</cfif>


		<cfcatch type="database">
	  		<p><strong>Apologies, a database error has occurred.
			Please try again later.<strong><p>
		</cfcatch>

		<cfcatch type="any">
	  		<p><strong>Apologies,  error has occurred.
			Please try again later.<strong><p>
			<cfdump var="#cfcatch.message#">
		</cfcatch>

	  </cftry>
	  <cfelse>
		<script>
			window.location= "/Demo/view/adminDashboard.cfm";
		</script>
	</cfif>



