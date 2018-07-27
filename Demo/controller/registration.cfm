
	<cfif structKeyExists(form,"addEmployee")>
	  <cftry>

		<!--calling the addEmployee() to add employee   -->
		<cfset rsDetails = application.employeeDao.addEmployee(#form#)/>
		<cfif rsDetails>
			<cflocation url="/Demo/view/adminDashboard.cfm?registration=success">

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
		alert("sss");
	  </script>

	</cfif>



