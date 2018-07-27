
<cfcomponent accessors="true" output="false" persistent="false">

	<!--- Generate EmployeeID --->
	<!--- <cffunction name="generateEmployeeID" returntype="string">
		<cfargument name="lastEmployeeId" type="string" required="true">
		<cfset var employeeID=  ''/>
		<cftry>

			<cfset getArray = listToArray(arguments.lastEmployeeId,"-")/>
			<cfset number = LSParseNumber(getArray[2]) +1>
			<cfset id = numberFormat(number,"0000")>
			<cfset employeeID = "mfsi-" & id  />

		<cfcatch type="any">
  			<p><strong>Apologies, EmployeeId generation error has occurred.
			 Please try again later.<strong><p>
		</cfcatch>

		<cffinally>
			<cfreturn employeeID/>
		</cffinally>

  		</cftry>
	</cffunction> --->

	<!--send mail to registered employee  -->
	<cffunction name="sendRegistrationMail">
		<cfargument name="formData" type="struct" required="true">
		<cftry>
			<cfmail from="avishek060796@gmail.com" to="#arguments.formData.email#" subject="Welcome To Mindfire" type="html">
			   <p>Hello <b>#form.first_name#</b>,</p>
			   <p>Welcome to <b>MindfireSolutions</b>
			   <p>Your UserName: <b>#form.username#</b></p>
			   <p>Password:</h6> <b>mindfire</b></p>
				<br>

			   <p>Thanks</p>
			   <p>HR Team,</p>
			   <p><a href="http://www.mindfiresolutions.com/">MindfireSolutions</a></p>
			</cfmail>
		<cfcatch type="any">
  			<p><strong>Apologies, Email sent error has occurred.
			 Please try again later.<strong><p>
		</cfcatch>
  		</cftry>
	</cffunction>

</cfcomponent>